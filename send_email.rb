require "dotenv/load"
require "pyrx_synapse"

client = PyrxSynapse::Client.new(
  api_key: ENV.fetch("SYNAPSE_API_KEY"),
  workspace_id: ENV.fetch("SYNAPSE_WORKSPACE_ID"),
  base_url: ENV.fetch("SYNAPSE_API_URL", "https://synapse-api.pyrx.tech")
)

begin
  result = client.send_email(
    template_slug: "welcome-email",
    to: { "user_id" => "user_123", "email" => "jane@example.com" },
    attributes: { "first_name" => "Jane" }
  )
  puts "Email sent: #{result}"
rescue PyrxSynapse::SynapseError => e
  puts "Send failed (expected if template doesn't exist): #{e.message}"
end
