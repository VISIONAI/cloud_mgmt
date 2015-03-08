DISCOVERY_URL=$(curl https://discovery.etcd.io/new)
RETVAL=$?

if [[ "$RETVAL" != "0" ]]; then
    >&2 echo "Getting discovery URL FAILED CLOUD CONFIG NOT WRITTEN $RETVAL"
    exit $RETVAL
  fi
read -r -d '' MYVAR << EOF
#cloud-config

coreos:
  etcd:
    #new url for each cluster: https://discovery.etcd.io/new
    discovery: $DISCOVERY_URL
    addr: \$private_ipv4:4001
    peer-addr: \$private_ipv4:7001
  fleet:
    public-ip: \$private_ipv4   # used for fleetctl ssh command
  units:
    - name: etcd.service
      command: start
    - name: fleet.service
      command: start
EOF

echo "$MYVAR"
