require "dotenv/load"
require "pyrx_synapse"

client = PyrxSynapse::Client.new(
  api_key: ENV.fetch("SYNAPSE_API_KEY"),
  workspace_id: ENV.fetch("SYNAPSE_WORKSPACE_ID"),
  base_url: ENV.fetch("SYNAPSE_API_URL", "https://synapse-api.pyrx.tech")
)

result = client.track(
  external_id: "user_123",
  event_name: "user_signed_up",
  attributes: { "plan" => "starter", "source" => "landing_page" }
)
puts "Event tracked: #{result}"
