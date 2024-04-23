Slack.configure do |config|
  config.token = ENV['SLACK_BOT_TOKEN']
end

Slack::Events.configure do |config|
  config.signing_secret = ENV["SLACK_CLIENT_SECRET"]
end



# File upload example
# client.files_upload(
#   channels: '#general',
#   file: Faraday::UploadIO.new("#{Rails.root}/app/assets/images/thisisfine.jpg", "image/jpeg"),
#   title: 'My Avatar',
#   filename: 'avatar.jpg',
#   initial_comment: 'Attached a selfie.'
# )



# Blocks example
# [
#   {
#     "type": "section",
#     "text": {
#       "type": "mrkdwn",
#       "text": "Hello, Assistant to the Regional Manager Dwight! *Michael Scott* wants to know where you'd like to take the Paper Company investors to dinner tonight.\n\n *Please select a restaurant:*"
#     }
#   },
#   {
#     "type": "divider"
#   },
#   {
#     "type": "section",
#     "text": {
#       "type": "mrkdwn",
#       "text": "*Farmhouse Thai Cuisine*\n:star::star::star::star: 1528 reviews\n They do have some vegan options, like the roti and curry, plus they have a ton of salad stuff and noodles can be ordered without meat!! They have something for everyone here"
#     },
#     "accessory": {
#       "type": "image",
#       "image_url": "https://s3-media3.fl.yelpcdn.com/bphoto/c7ed05m9lC2EmA3Aruue7A/o.jpg",
#       "alt_text": "alt text for image"
#     }
#   },
#   {
#     "type": "section",
#     "text": {
#       "type": "mrkdwn",
#       "text": "*Kin Khao*\n:star::star::star::star: 1638 reviews\n The sticky rice also goes wonderfully with the caramelized pork belly, which is absolutely melt-in-your-mouth and so soft."
#     },
#     "accessory": {
#       "type": "image",
#       "image_url": "https://s3-media2.fl.yelpcdn.com/bphoto/korel-1YjNtFtJlMTaC26A/o.jpg",
#       "alt_text": "alt text for image"
#     }
#   },
#   {
#     "type": "section",
#     "text": {
#       "type": "mrkdwn",
#       "text": "*Ler Ros*\n:star::star::star::star: 2082 reviews\n I would really recommend the  Yum Koh Moo Yang - Spicy lime dressing and roasted quick marinated pork shoulder, basil leaves, chili & rice powder."
#     },
#     "accessory": {
#       "type": "image",
#       "image_url": "https://s3-media2.fl.yelpcdn.com/bphoto/DawwNigKJ2ckPeDeDM7jAg/o.jpg",
#       "alt_text": "alt text for image"
#     }
#   },
#   {
#     "type": "divider"
#   },
#   {
#     "type": "actions",
#     "elements": [
#       {
#         "type": "button",
#         "text": {
#           "type": "plain_text",
#           "text": "Farmhouse",
#           "emoji": true
#         },
#         "value": "click_me_123"
#       },
#       {
#         "type": "button",
#         "text": {
#           "type": "plain_text",
#           "text": "Kin Khao",
#           "emoji": true
#         },
#         "value": "click_me_123",
#         "url": "https://google.com"
#       },
#       {
#         "type": "button",
#         "text": {
#           "type": "plain_text",
#           "text": "Ler Ros",
#           "emoji": true
#         },
#         "value": "click_me_123",
#         "url": "https://google.com"
#       }
#     ]
#   }
# ]


# modal example with blocks
# {
#   "type": "modal",
#   "callback_id": "gratitude-modal",
#   "title": {
#     "type": "plain_text",
#     "text": "Gratitude Box",
#     "emoji": true
#   },
#   "submit": {
#     "type": "plain_text",
#     "text": "Submit",
#     "emoji": true
#   },
#   "close": {
#     "type": "plain_text",
#     "text": "Cancel",
#     "emoji": true
#   },
#   "blocks": [
#     {
#       "type": "input",
#       "block_id": "my_block",
#       "element": {
#         "type": "plain_text_input",
#         "action_id": "my_action"
#       },
#       "label": {
#         "type": "plain_text",
#         "text": "Say something nice!",
#         "emoji": true
#       }
#     }
#   ]
# }

