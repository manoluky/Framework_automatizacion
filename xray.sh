sh '''
          token=$(curl -H "Content-Type: application/json" -X POST --data @"cloud_auth.json" https://xray.cloud.getxray.app/api/v2/authenticate| tr -d '"')
          curl -H "Content-Type: multipart/form-data" -X POST -F info=@Info.json -F results=@src/test/resources/output/report/Cucumber.json -H "Authorization: Bearer $token" https://xray.cloud.getxray.app/api/v2/import/execution/cucumber/multipart
          '''
