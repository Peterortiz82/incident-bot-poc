class Slack::ActionsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_client

  def create
    payload = JSON.parse(params[:payload])
    handle_action(payload)
  end

  private

  def set_client
    @client = Slack::Web::Client.new
  end

  def handle_action(payload)
    case payload["type"]
    when "view_submission"
      handle_view_submission(payload)
    when "view_closed"
      return
    when "message_actions"
      return
    when "block_actions"
      return
    else
      nil
    end
  end

  def handle_view_submission(payload)
    state_values = payload['view']['state']['values']

    incident_name = state_values.dig('TxCjU', 'incident_name', 'value')
    incident_name_without_whitespace = incident_name.gsub(/\s+/, '-')
    state_values.dig('QwWBy', 'incident_description', 'value')
    selected_users = state_values.dig('incident_add_users_section', 'text1234', 'selected_users')

    # Create a new Slack channel
    response = @client.conversations_create(name: "incident-#{incident_name_without_whitespace}-#{Time.now.strftime('%Y%m%d')}", is_private: false)

    if response['ok']
      channel_id = response['channel']['id']

      # Invite selected users to the new channel
      if selected_users && !selected_users.empty?
        begin
          @client.conversations_invite(channel: channel_id, users: selected_users.join(','))

          head :ok
        rescue Slack::Web::Api::Errors::SlackError => e
          puts "Slack API Error: #{e.message}"
          render json: { error: e.message }, status: :unprocessable_entity
          return
        end
      end

      head :ok
    else
      puts "Error: #{response['error']}"
      render json: { error: response['error'] }, status: :unprocessable_entity
    end
  end
end
