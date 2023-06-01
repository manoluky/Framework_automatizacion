#!/bin/bash
echo "archivos antes de crear token"
echo "Generando token"
export token=$(curl -H "Content-Type: application/json" -X POST --data @"cloud_auth.json" https://xray.cloud.getxray.app/api/v2/authenticate| tr -d '"')
echo $token
echo "Token Generado"
echo "Personalizacion Jira"
sed -i 's/"summary": "a"/"summary": "Resultado Testing Continuo GIT "/g' integracion/jira.json
echo "Cargando TestExecution"
curl -H "Authorization: Bearer $token" -X POST 'https://xray.cloud.getxray.app/api/v2/import/execution/cucumber/multipart' -H "Content-Type:multipart/form-data" -F 'info=@"Info.json"' -F 'results=@"results/Cucumber.json"' > log.txt
cat log.txt
export TESTEXECUTION=$(grep "PX-" log.txt | cut -d '"' -f 8)
echo "ID de ejecucion: ${TESTEXECUTION}"
echo "Attachment para ejecucion"
export url=https://capacitacionxray9.atlassian.net/rest/api/3/issue/${TESTEXECUTION}/attachments
echo "VERIFICANDO URL"
echo $url
cd results/
echo "ENVIO DE ARCHIVO"
curl -H 'Authorization: Basic YWFyb24uYmFycmFAdHNvZnRsYXRhbS5jb206QVRBVFQzeEZmR0YwWFZLWl91NldZU2ltOEZ0NjFQWTZvZTB5WWlGejNRQkloeGtRZ0NJdlFCNkktdXpRdHZoTnpWWDQtM3BvVEtIODhqLXdFdmF3NFdDVjdNbzkwTDQ5OXRjNEVlcmxzM3oyWmxDTS1mMmpDckQ0WFRFeXB1bmJuOXRTYzRQcFIwNFlBcG9yXzRxWmZBNFR0WjVhWWRrOHNmajZnLTVzYlA0UkJ0VWZrWTZxc0hzPTFGN0IzMEVG' -X POST $url -H "Content-Type:multipart/form-data" -H 'X-Atlassian-Token: no-check' -F file=@'reporteQA.pdf'
