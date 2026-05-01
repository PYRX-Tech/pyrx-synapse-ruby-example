require "dotenv/load"
require "pyrx_synapse"

client = PyrxSynapse::Client.new(
  api_key: ENV.fetch("SYNAPSE_API_KEY"),
  workspace_id: ENV.fetch("SYNAPSE_WORKSPACE_ID"),
  base_url: ENV.fetch("SYNAPSE_API_URL", "https://synapse-api.pyrx.tech")
)

ext_id = "del_test_#{Time.now.to_i}"
client.identify(external_id: ext_id, email: "#{ext_id}@test.com")
client.contacts.delete(ext_id)
puts "Contact deleted"
