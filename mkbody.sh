usage () {
  echo "Generate the request body for a cloud config"
  echo "==============================================="
  echo "   YOU MUST HAVE ACCESS TOKEN AT ./.DO_TOKEN"
  echo "==============================================="
  echo "Usage:./mkbody.sh path_to_cloud_config"
  exit 1
}

[ $# -lt 1 ] && {
  usage
}

DROPLET_NAME="TESTNAME"
CLOUD_CONFIG=$(cat $1)

body='{"name":"'$DROPLET_NAME'","region":"nyc3","size":"512mb","private_networking":true,"image":"coreos-stable","user_data":"'$CLOUD_CONFIG'"'
body=$body', "ssh_keys": [25214,408466]}'

echo $body
