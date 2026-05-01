require "dotenv/load"
require "pyrx_synapse"

client = PyrxSynapse::Client.new(
  api_key: ENV.fetch("SYNAPSE_API_KEY"),
  workspace_id: ENV.fetch("SYNAPSE_WORKSPACE_ID"),
  base_url: ENV.fetch("SYNAPSE_API_URL", "https://synapse-api.pyrx.tech")
)

# First identify to ensure contact exists
client.identify(external_id: "sdk_update_test", email: "update@example.com")

updated = client.contacts.update("sdk_update_test", { "properties" => { "plan" => "growth" } })
puts "Updated: #{updated}"
