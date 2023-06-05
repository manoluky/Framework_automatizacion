#!/bin/bash
TIPO=$1
echo "Generando token"
export token=$(curl -H "Content-Type: application/json" -X POST --data @"cloud_auth.json" https://xray.cloud.getxray.app/api/v2/authenticate| tr -d '"')
echo $token
echo "Token Generado"
echo "Personalizacion Jira"
if [ $TIPO -eq 1 ]; then
  sed -i 's/"summary": "Clonacion exitosa"/"summary": "Resultado Prueba Automatizada ON-DEMAND "/g' integracion/jira.json
else
  sed -i 's/"summary": "Clonacion exitosa"/"summary": "Resultado Prueba Automatizada PIPELINE "/g' integracion/jira.json
fi

if grep -q "BUILD SUCCESSFUL" logGradle.txt; then
  echo "PASO"
  sed -i 's/"description": "USUARIOJ"/"description": "Ejecucion exitosa. [~accountid:63d93e141b13d42998e0e160][~accountid:610ab6d00b454a00681fbd5e]"/g' integracion/jira.json
else
  echo "FALLO"
  sed -i 's/"description": "Clonacion exitosa"/"description": "Ejecución exitosa. [~accountid:63d93e141b13d42998e0e160][~accountid:610ab6d00b454a00681fbd5e]"/g' integracion/jira.json
fi
sed -i 's/"description": "Clonacion exitosa"/"description": "Ejecución fallida. [~accountid:63d93e141b13d42998e0e160][~accountid:610ab6d00b454a00681fbd5e]"/g' integracion/jira.json
echo "Cargando TestExecution"
curl -H "Authorization: Bearer $token" -X POST 'https://xray.cloud.getxray.app/api/v2/import/execution/cucumber/multipart' -H "Content-Type:multipart/form-data" -F 'info=@"integracion/jira.json"' -F 'results=@"results/Cucumber.json"' > log.txt
cat log.txt
export TESTEXECUTION=$(grep "PX-" log.txt | cut -d '"' -f 8)
echo "ID de TestPlan: ${TESTPLAN}"
echo "ID de ejecucion: ${TESTEXECUTION}"
echo "Attachment para ejecucion"
export url=https://capacitacionxray9.atlassian.net/rest/api/3/issue/${TESTEXECUTION}/attachments
echo "VERIFICANDO URL"
echo $url
cd results/
echo "ENVIO DE ARCHIVO"
curl -H 'Authorization: Basic YWFyb24uYmFycmFAdHNvZnRsYXRhbS5jb206QVRBVFQzeEZmR0YwWFZLWl91NldZU2ltOEZ0NjFQWTZvZTB5WWlGejNRQkloeGtRZ0NJdlFCNkktdXpRdHZoTnpWWDQtM3BvVEtIODhqLXdFdmF3NFdDVjdNbzkwTDQ5OXRjNEVlcmxzM3oyWmxDTS1mMmpDckQ0WFRFeXB1bmJuOXRTYzRQcFIwNFlBcG9yXzRxWmZBNFR0WjVhWWRrOHNmajZnLTVzYlA0UkJ0VWZrWTZxc0hzPTFGN0IzMEVG' -X POST $url -H "Content-Type:multipart/form-data" -H 'X-Atlassian-Token: no-check' -F file=@'reporteQA.pdf'
ls
