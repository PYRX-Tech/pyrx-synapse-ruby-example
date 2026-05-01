require "dotenv/load"
require "pyrx_synapse"

client = PyrxSynapse::Client.new(
  api_key: ENV.fetch("SYNAPSE_API_KEY"),
  workspace_id: ENV.fetch("SYNAPSE_WORKSPACE_ID"),
  base_url: ENV.fetch("SYNAPSE_API_URL", "https://synapse-api.pyrx.tech")
)

slug = "tpl-create-#{Time.now.to_i}"

template = client.templates.create({
  "slug" => slug,
  "name" => "Create Test",
  "subject" => "Order confirmed",
  "body_html" => "<h1>Hi</h1><p>Your order is confirmed.</p>",
  "sender_name" => "Synapse",
  "from_email" => "noreply@example.com",
})
puts "Created: #{template}"

# Cleanup
begin
  client.templates.delete(slug)
rescue PyrxSynapse::SynapseError
  # ignore cleanup errors
end
