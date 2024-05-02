pipeline {
    agent any
    environment {
        DOCKER_COMPOSE_VERSION = '3.8'
    }
    stages {
        stage('Build') {
            steps {
                script {
                    // Téléchargement de Docker Compose
                   // sh "curl -L \"https://github.com/docker/compose/releases/download/\${DOCKER_COMPOSE_VERSION}/docker-compose-\$(uname -s)-\$(uname -m)\" -o /usr/local/bin/docker-compose"
                   // sh "chmod +x /usr/local/bin/docker-compose"
                    // Lancement de Docker Compose
                    sh 'docker-compose up -d --build'
                }
            }
        }
        stage('Test') {
            steps {
                script {
                    // Mettez ici vos commandes pour exécuter des tests
                    echo "Running tests"
                }
            }
        }
        stage('Deploy') {
            steps {
                script {
                    // Mettez ici vos commandes pour déployer l'application
                    echo "Deploying to production"
                }
            }
        }
    }
    post {
        always {
            // Nettoyer les ressources Docker
            sh 'docker-compose down'
        }
    }
}
