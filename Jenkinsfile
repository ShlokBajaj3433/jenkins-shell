pipeline {
    agent any

    options {
        timestamps()
    }

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Web Smoke Test') {
            steps {
                sh 'chmod +x script.sh'
                sh '''
                    PORT=8083 ./script.sh > shell-server.log 2>&1 &
                    SHELL_PID=$!
                    trap "kill $SHELL_PID" EXIT
                    sleep 3
                    curl -f http://localhost:8083/
                '''
            }
        }

    }
}
