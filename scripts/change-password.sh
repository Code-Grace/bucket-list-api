#!/bin/bash

curl --include --request PATCH http://127.0.0.1:3000/change-password/58063b118f875d0011060287 \
  --header "Authorization: Token token=JxcJvjtCYsxxOGToWaPbY+W9Z8vYDhnQx4QbKXojgh4=--Dji9YhrM1NRyjxTHDgCLU3eX0oD3XLFVHBSggT4/NpU=" \
  --header "Content-Type: application/json" \
  --data '{
    "passwords": {
      "old": "123",
      "new": "321"
    }
  }'

  #!/bin/bash

  curl --include --request PATCH https://deathbucket.herokuapp.com/change-password/58063b118f875d0011060287 \
    --header "Authorization: Token token=JxcJvjtCYsxxOGToWaPbY+W9Z8vYDhnQx4QbKXojgh4=--Dji9YhrM1NRyjxTHDgCLU3eX0oD3XLFVHBSggT4/NpU=" \
    --header "Content-Type: application/json" \
    --data '{
      "passwords": {
        "old": "123",
        "new": "321"
      }
    }'
