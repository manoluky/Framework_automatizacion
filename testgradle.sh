#!/bin/bash
TAG=$1
xvfb-run -a --server-args="-screen 0 1920x1080x24" gradle runWithCucumber -P tags=$TAG ; exit 0 > logGradle.txt

cat "IMPRIMIENDO RESULTADO LOG"
cat logGradle.txt
 
if grep -q "BUILD SUCCESSFUL" logGradle.txt; then
  echo "Repositorio clonado con éxito"
sed -i 's/"summary": "Clonacion exitosa"/"summary": "Ejecucion exitosa"/g' integracion/jira.json
curl -H "Content-Type: multipart/form-data" -X POST -F info=@integracion/jira.json -F results=@integracion/prueba-passed.json -H "Authorization: Bearer $token" https://xray.cloud.getxray.app/api/v2/import/execution/cucumber/multipart
else
  echo "FALLO"
  sed -i 's/"summary": "Clonacion exitosa"/"summary": "Ejecucion fallida"/g' integracion/jira.json
  curl -H "Content-Type: multipart/form-data" -X POST -F info=@integracion/jira.json  -F results=@integracion/prueba-failed.json -H "Authorization: Bearer $token" https://xray.cloud.getxray.app/api/v2/import/execution/cucumber/multipart    
  exit 1
fi
