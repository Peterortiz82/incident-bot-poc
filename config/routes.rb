Rails.application.routes.draw do

  post 'slack/actions', to: 'slack/actions#create'
  post 'slack/commands', to: 'slack/commands#create'

  post 'slack/event', to: 'slack#event'
end
