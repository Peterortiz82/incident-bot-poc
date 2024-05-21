class Slack::CommandsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_client
  # before_action :verify_slack_request

  def create
    view_payload = Slack::Views::NewIncident.new(params).generate_payload
    render json: @client.views_open(view_payload)

    head :ok
  end

  private

  def set_client
    @client = Slack::Web::Client.new
  end

  def verify_slack_request
    timestamp = request.headers['X-Slack-Request-Timestamp']
    if (Time.now.to_i - timestamp.to_i).abs > 60 * 5
      head :unauthorized
      return
    end

    sig_basestring  = "v0:#{timestamp}:#{request.raw_post}"
    signature       = "v0=" + OpenSSL::HMAC.hexdigest("SHA256", ENV["SLACK_CLIENT_SECRET"], sig_basestring)
    slack_signature = request.headers['X-Slack-Signature']

    if !ActiveSupport::SecurityUtils.secure_compare(signature, slack_signature)
      head :unauthorized
    end
  end
end
