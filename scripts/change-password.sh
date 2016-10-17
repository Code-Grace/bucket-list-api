#!/bin/bash

curl --include --request PATCH http://127.0.0.1:3000/change-password/580521c1ea82663cf45705be \
  --header "Authorization: Token token=Gsabx/lCAikThmJ/UK9EHByTs+TLkZj2u8LyycM+OBQ=--4bQwt0Daxq2haMZnJXhmfgCtvknvRA7tgb9VAvIOetc=" \
  --header "Content-Type: application/json" \
  --data '{
    "passwords": {
      "old": "123",
      "new": "321"
    }
  }'
