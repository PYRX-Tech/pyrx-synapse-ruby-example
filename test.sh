#!/usr/bin/env bash
set -uo pipefail
RED='\033[0;31m'; GREEN='\033[0;32m'; NC='\033[0m'
PASS=0; FAIL=0

[[ -z "${SYNAPSE_API_KEY:-}" ]] && echo "Set SYNAPSE_API_KEY" && exit 1

echo "Installing..."
bundle install --quiet > /dev/null 2>&1

run_script() {
  local name="$1" cmd="$2"
  if eval "$cmd" > /dev/null 2>&1; then
    echo -e "  ${GREEN}✓${NC} $name"
    ((PASS++)) || true
  else
    echo -e "  ${RED}✗${NC} $name"
    ((FAIL++)) || true
  fi
}

echo "Running all scripts..."

echo "── Core ──"
run_script "track_event" "bundle exec ruby track_event.rb"
run_script "track_batch" "bundle exec ruby track_batch.rb"
run_script "identify_contact" "bundle exec ruby identify_contact.rb"
run_script "identify_batch" "bundle exec ruby identify_batch.rb"
run_script "send_email" "bundle exec ruby send_email.rb"

echo "── Contacts ──"
run_script "contacts_list" "bundle exec ruby contacts_list.rb"
run_script "contacts_get" "bundle exec ruby contacts_get.rb"
run_script "contacts_update" "bundle exec ruby contacts_update.rb"
run_script "contacts_delete" "bundle exec ruby contacts_delete.rb"

echo "── Templates ──"
run_script "templates_list" "bundle exec ruby templates_list.rb"
run_script "templates_get" "bundle exec ruby templates_get.rb"
run_script "templates_create" "bundle exec ruby templates_create.rb"
run_script "templates_update" "bundle exec ruby templates_update.rb"
run_script "templates_preview" "bundle exec ruby templates_preview.rb"
run_script "templates_delete" "bundle exec ruby templates_delete.rb"

echo ""
echo "Results: $PASS passed, $FAIL failed"
[[ $FAIL -eq 0 ]] && echo -e "${GREEN}All passed!${NC}" || echo -e "${RED}$FAIL failed${NC}"
exit $FAIL
