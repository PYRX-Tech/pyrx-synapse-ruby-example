require "dotenv/load"
require "pyrx_synapse"

client = PyrxSynapse::Client.new(
  api_key: ENV.fetch("SYNAPSE_API_KEY"),
  workspace_id: ENV.fetch("SYNAPSE_WORKSPACE_ID"),
  base_url: ENV.fetch("SYNAPSE_API_URL", "https://synapse-api.pyrx.tech")
)

slug = "sdk-preview-test-#{Time.now.to_i}"

# Create a template to preview
client.templates.create({
  "slug" => slug,
  "name" => "Preview Test",
  "subject" => "Hi {{first_name}}",
  "body_html" => "<p>Hello {{first_name}}</p>",
  "sender_name" => "Test",
  "from_email" => "test@example.com",
})

preview = client.templates.preview(slug, {
  "contact" => { "email" => "jane@example.com", "first_name" => "Jane" },
})
puts "Subject: #{preview.subject}"

# Cleanup
begin
  client.templates.delete(slug)
rescue PyrxSynapse::SynapseError
  # ignore cleanup errors
end
