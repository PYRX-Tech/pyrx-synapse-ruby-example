require "dotenv/load"
require "pyrx_synapse"

client = PyrxSynapse::Client.new(
  api_key: ENV.fetch("SYNAPSE_API_KEY"),
  workspace_id: ENV.fetch("SYNAPSE_WORKSPACE_ID"),
  base_url: ENV.fetch("SYNAPSE_API_URL", "https://synapse-api.pyrx.tech")
)

result = client.identify(
  external_id: "user_123",
  email: "jane@example.com",
  first_name: "Jane",
  properties: { "plan" => "pro", "signup_source" => "website" }
)
puts "Contact identified: #{result}"
