usage () {
  echo "Launch CORE OS NODE"
  echo "==============================================="
  echo "   YOU MUST HAVE ACCESS TOKEN AT ./.DO_TOKEN"
  echo "==============================================="
  echo "Usage:./launch_coreos_node droplet_name path_to_cloud_config"
  exit 1
}

[ $# -lt 2 ] && {
  usage
}

DROPLET_NAME=$1
TOKEN=$(cat .DO_TOKEN)
CLOUD_CONFIG=$(cat $2)

echo ========BEGIN CLOUD CONFIG=======
echo $CLOUD_CONFIG
echo ========END CLOUD CONFIG======

body='{"name":"'$DROPLET_NAME'","region":"nyc3","size":"512mb","private_networking":true,"image":"coreos-stable","user_data":"'$CLOUD_CONFIG'"'
body=$body', "ssh_keys": [25214,408466]}'


curl  -X POST "https://api.digitalocean.com/v2/droplets" \
      -d "$body" \
      -H "Authorization: Bearer $TOKEN" \
      -H "Content-Type: application/json"
