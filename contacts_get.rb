require "dotenv/load"
require "pyrx_synapse"

client = PyrxSynapse::Client.new(
  api_key: ENV.fetch("SYNAPSE_API_KEY"),
  workspace_id: ENV.fetch("SYNAPSE_WORKSPACE_ID"),
  base_url: ENV.fetch("SYNAPSE_API_URL", "https://synapse-api.pyrx.tech")
)

contacts = client.contacts.list(page: 1, per_page: 1)
if contacts.data && !contacts.data.empty?
  cid = contacts.data[0].id
  contact = client.contacts.get(cid)
  puts "Contact: #{contact}"
else
  puts "No contacts found"
end
