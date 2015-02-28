usage () {
  echo "Check the status of an action using URL provided by DO "
  echo "(note: this really just wraps the get request with the bearer token"
  echo "==============================================="
  echo "   YOU MUST HAVE ACCESS TOKEN AT ./.DO_TOKEN"
  echo "==============================================="
  echo "Usage:./check_action.sh ACTION_URL"
  exit 1
}

[ $# -lt 1 ] && {
  usage
}

TOKEN=$(cat .DO_TOKEN)
ACTION_URL=$1



curl  -X GET "$ACTION_URL" \
      -H "Authorization: Bearer $TOKEN" \
      -H "Content-Type: application/json"
