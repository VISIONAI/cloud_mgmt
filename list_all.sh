usage () {
  echo "List all droplets"
  echo "==============================================="
  echo "   YOU MUST HAVE ACCESS TOKEN AT ./.DO_TOKEN"
  echo "==============================================="
  echo "Usage:./list_all.sh"
  exit 1
}
TOKEN=$(cat .DO_TOKEN)


curl -X GET "https://api.digitalocean.com/v2/droplets" \
      -H "Authorization: Bearer $TOKEN" \
      -H "Content-Type: application/json"
