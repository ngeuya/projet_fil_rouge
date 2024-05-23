pipeline {
    agent any
    environment {
        DOCKER_COMPOSE_VERSION = '1.29.2'
        PATH = "/usr/local/bin:$PATH" // Assurez-vous que cela inclut le chemin vers Docker
        DOCKER_IMAGE1 = "ame-apache"
        DOCKER_TAG1 = "latest"
        DOCKER_IMAGE2 = "ame-mysql"
        DOCKER_TAG2 = "latest"
    }
    stages {
        stage('Provisionnement Infrastructure') {

            steps {
                script {
                    // Initialisation de Terraform
                    sh 'terraform init'
                    // Application des configurations Terraform
                    sh 'terraform apply -auto-approve'
                }
            }
    }
    post {
        success {
            // Nettoyer les ressources Docker
           // sh 'minikube service apache-service'
            emailext body: 'Resultat du build: Success', subject: 'Detail du Build', to: 'ndiaye58amadou@gmail.com'

        }
        failure {
            emailext body: 'Resultat du build: Echec', subject: 'Detail du Build', to: 'ndiaye58amadou@gmail.com'
        }
    }
}
