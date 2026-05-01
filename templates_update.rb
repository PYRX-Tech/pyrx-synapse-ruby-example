require "dotenv/load"
require "pyrx_synapse"

client = PyrxSynapse::Client.new(
  api_key: ENV.fetch("SYNAPSE_API_KEY"),
  workspace_id: ENV.fetch("SYNAPSE_WORKSPACE_ID"),
  base_url: ENV.fetch("SYNAPSE_API_URL", "https://synapse-api.pyrx.tech")
)

slug = "tpl-update-#{Time.now.to_i}"

# Create first
client.templates.create({
  "slug" => slug,
  "name" => "Update Test",
  "subject" => "Original subject",
  "body_html" => "<h1>Hi</h1>",
  "sender_name" => "Synapse",
  "from_email" => "noreply@example.com",
})

updated = client.templates.update(slug, {
  "subject" => "Your order is confirmed!",
  "body_html" => "<h1>Updated!</h1>",
})
puts "Updated: #{updated}"

# Cleanup
begin
  client.templates.delete(slug)
rescue PyrxSynapse::SynapseError
  # ignore cleanup errors
end
