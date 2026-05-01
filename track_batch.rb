require "dotenv/load"
require "pyrx_synapse"

client = PyrxSynapse::Client.new(
  api_key: ENV.fetch("SYNAPSE_API_KEY"),
  workspace_id: ENV.fetch("SYNAPSE_WORKSPACE_ID"),
  base_url: ENV.fetch("SYNAPSE_API_URL", "https://synapse-api.pyrx.tech")
)

result = client.track_batch(events: [
  { "external_id" => "user_1", "event_name" => "page_viewed", "attributes" => { "page" => "/pricing" } },
  { "external_id" => "user_2", "event_name" => "feature_used", "attributes" => { "feature" => "export" } },
])
puts "Batch tracked: #{result}"
