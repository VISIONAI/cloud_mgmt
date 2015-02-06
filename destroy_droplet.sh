usage () {
  echo "Destroy Droplet"
  echo "==============================================="
  echo "   YOU MUST HAVE ACCESS TOKEN AT ./.DO_TOKEN"
  echo "==============================================="
  echo "Usage:./destroy_droplet.sh droplet_id"
  exit 1
}
TOKEN=$(cat .DO_TOKEN)

[ $# -lt 1 ] && {
  usage
}

DROPLET_ID=$1

curl -I -X DELETE "https://api.digitalocean.com/v2/droplets/$DROPLET_ID" \
      -H "Authorization: Bearer $TOKEN" \
      -H "Content-Type: application/json"
