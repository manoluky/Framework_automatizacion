#!/bin/bash
echo "Generando token"
export token=$(curl -H "Content-Type: application/json" -X POST --data @"infra/cloud_auth.json" https://xray.cloud.getxray.app/api/v2/authenticate| tr -d '"')
echo $token
echo "Token Generado"
echo "Cargando TestExecution"
curl -H "Authorization: Bearer $token" -X POST 'https://xray.cloud.getxray.app/api/v2/import/execution/cucumber/multipart' -H "Content-Type:multipart/form-data" -F 'info=@"infra/info.json"' -F 'results=@"results/Cucumber.json"' > log.txt
cat log.txt
export TESTEXECUTION=$(grep "RQBD-" log.txt | cut -d '"' -f 8)
echo "ID de ejecucion: $TESTEXECUTION"
echo "Attachment para ejecucion"
export url=https://demo-bci.atlassian.net/rest/api/3/issue/$TESTEXECUTION/attachments
echo $url
cd results/
pwd
echo $url>url.txt

