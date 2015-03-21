usage () {
  echo "Launch CORE OS NODE"
  echo "==============================================="
  echo "   YOU MUST HAVE ACCESS TOKEN AT ./.DO_TOKEN"
  echo "==============================================="
  echo "Usage:./size_launch_coreos_node droplet_name path_to_cloud_config size_slug"
  echo "  valid size_slugs: 512mb 1gb 2gb 4gb etc"
  exit 1
}

[ $# -lt 3 ] && {
  usage
}

DROPLET_NAME=$1
TOKEN=$(cat .DO_TOKEN)
CLOUD_CONFIG=$(cat $2 | sed -e 's/\"/\\"/g') # escape double quotes
SIZE=$3

body='{"name":"'$DROPLET_NAME'","region":"nyc3","size":"'$SIZE'","private_networking":true,"image":"coreos-stable","user_data":"'$CLOUD_CONFIG'"'
body=$body', "ssh_keys": [25214,408466]}'


curl  -X POST "https://api.digitalocean.com/v2/droplets" \
      -d "$body" \
      -H "Authorization: Bearer $TOKEN" \
      -H "Content-Type: application/json"
