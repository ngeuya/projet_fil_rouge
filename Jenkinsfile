pipeline {
    agent any
    environment {
        DOCKER_COMPOSE_VERSION = '1.29.2'
        PATH = "/usr/local/bin:$PATH" // Assurez-vous que cela inclut le chemin vers Docker
    }
    stages {
        stage('Build') {
            steps {
                script {
                    sh 'docker --version' // Vérifier que Docker est accessible
                    // Téléchargement de Docker Compose
                  //  sh "curl -L \"https://github.com/docker/compose/releases/download/\${DOCKER_COMPOSE_VERSION}/docker-compose-\$(uname -s)-\$(uname -m)\" -o /usr/local/bin/docker-compose"
                    sh "chmod +x /usr/local/bin/docker-compose"
                    sh "export PATH=$PATH:/usr/local/bin"
                    // Lancement de Docker Compose
                    sh '/usr/local/bin/docker-compose up -d --build'
                }
            }
        }
        stage('Test') {
            steps {
                script {
                    // Mettez ici vos commandes pour exécuter des tests
                    echo "Running tests"
                    sh 'curl -s http://localhost:8000'
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
            sh '/usr/local/bin/docker-compose down'

        }
    }
}
