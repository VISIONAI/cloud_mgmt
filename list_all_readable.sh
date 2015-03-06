./list_all.sh |  jq ' .droplets[] | {name:.name, id:.id, ips: [.networks.v4[].ip_address] }'
