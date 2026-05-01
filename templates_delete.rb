require "dotenv/load"
require "pyrx_synapse"

client = PyrxSynapse::Client.new(
  api_key: ENV.fetch("SYNAPSE_API_KEY"),
  workspace_id: ENV.fetch("SYNAPSE_WORKSPACE_ID"),
  base_url: ENV.fetch("SYNAPSE_API_URL", "https://synapse-api.pyrx.tech")
)

slug = "sdk-del-test-#{Time.now.to_i}"

# Create then delete
client.templates.create({
  "slug" => slug,
  "name" => "Del Test",
  "subject" => "Test",
  "body_html" => "<p>Hi</p>",
  "sender_name" => "Test",
  "from_email" => "test@example.com",
})

client.templates.delete(slug)
puts "Template deleted"
