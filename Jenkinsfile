pipeline {
    agent any
    environment {
        PATH = "/usr/local/bin:$PATH" // Assurez-vous que cela inclut le chemin vers Docker
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
    }
    post {
        success {
            emailext body: 'Resultat du build: Success', subject: 'Detail du Build', to: 'ndiaye58amadou@gmail.com'

        }
        failure {
            emailext body: 'Resultat du build: Echec', subject: 'Detail du Build', to: 'ndiaye58amadou@gmail.com'
        }
    }
}
