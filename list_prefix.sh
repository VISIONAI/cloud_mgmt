usage () {
  echo "List all droplets whose name contains a string"
  echo "==============================================="
  echo "   YOU MUST HAVE ACCESS TOKEN AT ./.DO_TOKEN"
  echo "==============================================="
  echo "Usage:./list_all_prefix.sh the_string"
  exit 1
}

./list_all.sh |  jq ' .droplets[] | {name:.name, id:.id, ips: [.networks.v4[].ip_address] }' | jq "select (.name | contains( \"$1\"))"

