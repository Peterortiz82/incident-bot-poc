class Slack::Views::NewIncident < Slack::Web::Client
  attr_accessor :client, :params

  def Initialize(params)
    @params = params
  end

  def generate_payload
    client = Slack::Web::Client.new
    blocks = [
      header_block,
      name_block,
      description_block,
      add_users_block,
      severity_select_block
    ]

    view_payload = {
      trigger_id: params["trigger_id"],
      view: {
        type: "modal",
        title: {
          type: "plain_text",
          text: "New Incident"
        },
        close: {
          type: "plain_text",
          text: "Cancel"
        },
        submit: {
          type: "plain_text",
          text: "Submit"
        },
        private_metadata: "",
        callback_id: "new_incident_modal",
        blocks: blocks
      }
    }
  end

  private

  def header_block
    {
      type: "section",
      block_id: "new_incident_section",
      text: {
        type: "mrkdwn",
        text: "Provide some details about the incident."
      }
    }
  end

  def name_block
    {
      type: "input",
      label: {
        type: "plain_text",
        text: "Name"
      },
      element: {
        type: "plain_text_input",
        action_id: "incident_name",
        multiline: false
      },
      optional: false
    }
  end

  def description_block
    {
      type: "input",
      label: {
        type: "plain_text",
        text: "Description"
      },
      element: {
        type: "plain_text_input",
        action_id: "incident_description",
        multiline: true
      },
      optional: true
    }
  end

  def severity_select_block
    {
      type: "section",
      block_id: "new_incident_severity_section",
      text: {
        type: "mrkdwn",
        text: "*Severity*"
      },
      accessory: {
        action_id: "severity_action",
        type: "static_select",
        placeholder: {
          type: "plain_text",
          text: "Severity"
        },
        options: [
          {
            text: {
              type: "plain_text",
              text: "SEV1"
            },
            value: "SEV1"
          },
          {
            text: {
              type: "plain_text",
              text: "SEV2"
            },
            value: "SEV2"
          },
          {
            text: {
              type: "plain_text",
              text: "SEV3"
            },
            value: "SEV3"
          },
          {
            text: {
              type: "plain_text",
              text: "SEV4"
            },
            value: "SEV4"
          },
          {
            text: {
              type: "plain_text",
              text: "SEV5"
            },
            value: "SEV5"
          }
        ]
      }
    }
  end

  def add_users_block
    {
      type: "section",
      block_id: "incident_add_users_section",
      text: {
        type: "mrkdwn",
        text: "Add users to the incident."
      },
      accessory: {
        action_id: "text1234",
        type: "multi_users_select",
        placeholder: {
          type: "plain_text",
          text: "Select users"
        }
      }
    }
  end
end
