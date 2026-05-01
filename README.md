# Synapse Ruby Example

All 15 SDK endpoints with [pyrx-synapse](https://rubygems.org/gems/pyrx-synapse).

## Setup

1. `bundle install`
2. Copy `.env.example` to `.env`

## Examples

### Core
```bash
bundle exec ruby track_event.rb        # Track event
bundle exec ruby track_batch.rb        # Batch track
bundle exec ruby identify_contact.rb   # Identify contact
bundle exec ruby identify_batch.rb     # Batch identify
bundle exec ruby send_email.rb         # Send email
```

### Contacts
```bash
bundle exec ruby contacts_list.rb      bundle exec ruby contacts_get.rb
bundle exec ruby contacts_update.rb    bundle exec ruby contacts_delete.rb
```

### Templates
```bash
bundle exec ruby templates_list.rb     bundle exec ruby templates_get.rb
bundle exec ruby templates_create.rb   bundle exec ruby templates_update.rb
bundle exec ruby templates_delete.rb   bundle exec ruby templates_preview.rb
```

- [Synapse Docs](https://synapse.pyrx.tech/developers)
- [Ruby SDK](https://synapse.pyrx.tech/developers/sdks/ruby)
