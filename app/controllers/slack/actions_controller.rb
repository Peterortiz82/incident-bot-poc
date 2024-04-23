class Slack::ActionsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def create
    handle_action(JSON.parse(params[:payload]))
  end

  def handle_action(payload)

    case payload["type"]
    when "view_submission"
      puts "++++++++++++++VIEW_SUBMISSION++++++++++++++: #{payload}"
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
end
