pipeline {
    agent any
    tools {
        gradle "gr8.0.1"
    }
    environment {
        REPOSITORIO = "https://github.com/aaronbarra/Framework_Automatizacion.git"
        TAG = "@TEST_PX-3"
        TIPO = 0
    }
    stages {
        stage('CleanWorkspace') {
            steps {
                cleanWs()
            }
        }
        stage('CloneDockerFiles'){
          steps{
            git branch: 'main', url: 'https://github.com/aaronbarra/DockerTC.git'    
            sh 'chmod +x ${WORKSPACE}/app/entrypoint.sh'
          }
        }
        
        stage('Ejecucion Docker'){
            steps{
                //sh 'docker compose up'
                sh 'docker run -e REPOSITORIO=https://github.com/aaronbarra/Framework_Automatizacion.git -e TAG=@TEST_PX-3 -e TIPO=1 dockertc_docker-tc'
        }
    }
        
    /*    stage('gitClone') {
          steps {
            git branch: 'main', url: 'https://github.com/aaronbarra/Framework_automatizacion.git'
            script {
              env.TOKEN = sh(
                script: 'curl -H "Content-Type: application/json" -X POST --data @"cloud_auth.json" https://xray.cloud.getxray.app/api/v2/authenticate | tr -d "\\""',
                returnStdout: true
              ).trim()
              sh 'export TOKEN=$TOKEN'
            }
          }
        }
    stage('Automatizacion') {
      steps {
        cleanWs()
        script {
            withCredentials([string(credentialsId: 'healenium_token', variable: 'HEALENIUM_TOKEN')]) {
                git branch: 'master', url: "https://${HEALENIUM_TOKEN}@github.com/dbustamanter/Healenium_POC.git"
            }
        }
        sh 'gradle runWithCucumber -P tags=@TEST_IXR-93'
        sh 'chmod +x tokenXray.sh'
        sh './tokenXray.sh'
        sh 'cd results && export tempUrl=$(cat url.txt) && curl -H \'Authorization: Basic ZGllZ28uYnVzdGFtYW50ZUB0c29mdGxhdGFtLmNvbTpBVEFUVDN4RmZHRjBHemVnNFV1Ui1CYmFRczl4Ql9jUEo3SFpyN1VqQ214RG95blA2dGZUU0lCa25ubThIVEtGQ0NUMGx2VjU5X0UtTGlMZzE0RFlCVzQ4d0dEZHlYVGxVODc5OEFLeFhldHhHQUZaT1k1UnNJcEtuNkNTOXczdnNoeXdEb0Jkb1BKSlFHbk9JRlhCZjVIY25MYlJOT1BKRlNsT0dRemxsNF9RSUpTN0JSR3RxVU09QzAxNTU0MTk=\' -X POST $tempUrl  -H \"Content-Type:multipart/form-data\" -H \'X-Atlassian-Token: no-check\' -F \'file=@"reporteQA.pdf\"\' && rm url.txt'
      }
    }
    stage('Deploy Prod') {
      steps {
        cleanWs()
        git branch: 'testing2', url: 'https://github.com/dbustamanter/prueba.dibrsite.com.git'
        sh 'cp -r $WORKSPACE/* /var/www/html/prod'
      }
    post {
        success {
          echo 'El desplieue al ambiente PROD ha sido exitoso'
          sh '''sed -i 's/"summary": "TITULOJSON"/"summary": "Despliegue PROD exitoso"/g' integracion/jira.json'''
          sh """sed -i 's/"decription": "Test exitoso"/"description": "Ejecucion Jenkins:  ${env.BUILD_TAG}  [~accountid:63d93e141b13d42998e0e160] "/g' integracion/jira.json"""
          sh '''
          curl -H "Content-Type: multipart/form-data" -X POST -F info=@integracion/jira.json -F results=@integracion/prueba-passed.json -H "Authorization: Bearer $TOKEN" https://xray.cloud.getxray.app/api/v2/import/execution/cucumber/multipart
          '''
       }
        failure {
          echo 'El despliegue al ambiente PROD ha fallado'
          sh '''sed -i 's/"summary": "TITULOJSON"/"summary": "Despliegue PROD fallido"/g' integracion/jira.json'''
          sh '''sed -i 's/"description": "Test exitoso"/"description": "Despliegue PROD fallido"/g' integracion/jira.json'''
          sh '''
          curl -H "Content-Type: multipart/form-data" -X POST -F info=@integracion/jira.json -F results=@integracion/prueba-failed.json -H "Authorization: Bearer $TOKEN" https://xray.cloud.getxray.app/api/v2/import/execution/cucumber/multipart
          '''
        }
      }
    }
  }*/
  }
}
