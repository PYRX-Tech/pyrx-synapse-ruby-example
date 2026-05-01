require "dotenv/load"
require "pyrx_synapse"

client = PyrxSynapse::Client.new(
  api_key: ENV.fetch("SYNAPSE_API_KEY"),
  workspace_id: ENV.fetch("SYNAPSE_WORKSPACE_ID"),
  base_url: ENV.fetch("SYNAPSE_API_URL", "https://synapse-api.pyrx.tech")
)

result = client.identify_batch(contacts: [
  { "external_id" => "user_1", "email" => "alice@example.com", "properties" => { "plan" => "starter" } },
  { "external_id" => "user_2", "email" => "bob@example.com", "properties" => { "plan" => "growth" } },
])
puts "Batch identified: #{result}"
