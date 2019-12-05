#!/bin/bash

BESU_VERSION=${BESU_VERSION:-"1.2.5-SNAPSHOT"}
VOLUME_PATH=${VOLUME_PATH:-""}
NETWORK=${NETWORK:-"mainnet"}

[[ -z "$VOLUME_PATH" ]] && echo "VOLUME_PATH variable is unset. Not starting besu."

docker run \
  -p 8545:8545 \
  -p 8546:8546 \
  -p 8547:8547 \
  -p 30303:30303 \
  --mount type=bind,source=${VOLUME_PATH},target=/var/lib/besu \
  hyperledger/besu:${BESU_VERSION} \
  --data-path=/var/lib/besu \
  --rpc-http-enabled \
  --rpc-ws-enabled \
  --graphql-http-enabled \
  --rpc-http-host="0.0.0.0" \
  --rpc-ws-host="0.0.0.0" \
  --graphql-http-host="0.0.0.0" \
  --network="${NETWORK}"
