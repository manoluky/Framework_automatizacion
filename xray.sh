#!/bin/bash
echo "Generando token"
export token=$(curl -H "Content-Type: application/json" -X POST --data @"cloud_auth.json" https://xray.cloud.getxray.app/api/v2/authenticate| tr -d '"')
echo $token
echo "Token Generado"
echo "Cargando TestExecution"
curl -H "Authorization: Bearer $token" -X POST 'https://xray.cloud.getxray.app/api/v2/import/execution/cucumber/multipart' -H "Content-Type:multipart/form-data" -F 'info=@"Info.json"' -F 'results=@"results/Cucumber.json"' > log.txt
cat log.txt
export TESTEXECUTION=$(grep "XRAY-" log.txt | cut -d '"' -f 8)
echo "ID de ejecucion: $TESTEXECUTION"
echo "Attachment para ejecucion"
#export url=https://capacitacionxray9.atlassian.net/rest/api/3/issue/$TESTEXECUTION/attachments
export url=https://capacitacionxray9.atlassian.net/rest/api/3/issue/XRAY-18/attachments
export url=https://capacitacionxray9.atlassian.net/rest/api/3/issue/XRAY-20/attachments
echo $url
cd results/
pwd
echo $url>url.txt
#curl -H \'Authorization: Basic YWFyb24uYmFycmFAdHNvZnRsYXRhbS5jb206QVRBVFQzeEZmR0YwUlVfeHdnZHdLRGRfZFlxU1VnamgxVkpaM2VjQ2hlUzdZVU5oSlhlRDdIVjlIYVc4TmRNaDN4S2VXTEh1aHAzODViOE41V1k5VVhJUWhyQnF6WmZIQnloamlzNFBTbXcyUEJqSlNGUE12N2RZVHRobC1Edlg2WklUZHdHRTNkRk9MbjRLN2dfVkkzS1k5VU1BTzJ4dTdSRnYwUjRnOFZkQ1dXRzI0WTN4eHRjPUVCM0UwMTU4' -X POST $tempUrl -H \"Content-Type:multipart/form-data\" -H \'X-Atlassian-Token: no-check\' -F \'file=@"reporteQA.pdf\"\'
curl -H 'Authorization: Basic YWFyb24uYmFycmFAdHNvZnRsYXRhbS5jb206QVRBVFQzeEZmR0YwUlVfeHdnZHdLRGRfZFlxU1VnamgxVkpaM2VjQ2hlUzdZVU5oSlhlRDdIVjlIYVc4TmRNaDN4S2VXTEh1aHAzODViOE41V1k5VVhJUWhyQnF6WmZIQnloamlzNFBTbXcyUEJqSlNGUE12N2RZVHRobC1Edlg2WklUZHdHRTNkRk9MbjRLN2dfVkkzS1k5VU1BTzJ4dTdSRnYwUjRnOFZkQ1dXRzI0WTN4eHRjPUVCM0UwMTU4' -X POST "$url" -H "Content-Type:multipart/form-data" -H 'X-Atlassian-Token: no-check' -F 'file=@"reporteQA.pdf"'
