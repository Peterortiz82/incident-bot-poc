class SlackController < ApplicationController
  skip_before_action :verify_authenticity_token

  def event
    if params[:type] == 'url_verification'
      render json: { challenge: params[:challenge] }
    else
      puts "++++++++++++++EVENT++++++++++++++: #{params}"
    end
  end
end
