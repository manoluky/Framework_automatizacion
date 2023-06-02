pipeline {
    agent any
    tools {
        gradle "gr8.0.1"
    }
    environment {
        RAMA = "main"
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
                sh 'docker run -e RAMA=${RAMA} -e TAG=${TAG} -e TIPO=${TIPO} dockertc-test-gradle-lab'
        }
    }
  }
}
