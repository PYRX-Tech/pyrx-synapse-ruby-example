require "dotenv/load"
require "pyrx_synapse"

client = PyrxSynapse::Client.new(
  api_key: ENV.fetch("SYNAPSE_API_KEY"),
  workspace_id: ENV.fetch("SYNAPSE_WORKSPACE_ID"),
  base_url: ENV.fetch("SYNAPSE_API_URL", "https://synapse-api.pyrx.tech")
)

slug = "sdk-get-test-#{Time.now.to_i}"

# Create a template first to ensure it exists
client.templates.create({
  "slug" => slug,
  "name" => "Get Test",
  "subject" => "Test",
  "body_html" => "<p>Hi</p>",
  "sender_name" => "Test",
  "from_email" => "test@example.com",
})

template = client.templates.get(slug)
puts "Template: #{template}"

# Cleanup
begin
  client.templates.delete(slug)
rescue PyrxSynapse::SynapseError
  # ignore cleanup errors
end
