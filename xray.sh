#!/bin/bash
echo "Generando token"
export token=$(curl -H "Content-Type: application/json" -X POST --data @"infra/cloud_auth.json" https://xray.cloud.getxray.app/api/v2/authenticate| tr -d '"')
echo $token
echo "Token Generado"
