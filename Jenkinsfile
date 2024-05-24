pipeline {
    agent any
    environment {
        PATH = "/usr/local/bin:$PATH" // Assurez-vous que cela inclut le chemin vers Docker
    }
    stages {
        stage('Provisionnement Infrastructure') {
            steps {
                script {
                    sh 'ls' // Liste les fichiers et dossiers pour vérifier le contexte
                    sh 'cd "$(pwd)/Terraform-Local"' // Change le répertoire vers Terraform
                    sh 'ls' // Liste à nouveau pour vérifier le contenu du dossier Terraform
                    sh 'cd "$(pwd)/Terraform-Local" && terraform init' // Initialise Terraform
                    sh 'cd "$(pwd)/Terraform-Local" && terraform plan' // Affiche le plan Terraform
                    sh 'cd "$(pwd)/Terraform-Local" && terraform apply -auto-approve' // Applique la configuration Terraform sans confirmation manuelle
                }
            }
}

    }
    post {
        success {
            emailext body: 'Resultat du build: Success', subject: 'Detail du Build', to: 'ngeuya58@gmail.com'

        }
        failure {
            emailext body: 'Resultat du build: Echec', subject: 'Detail du Build', to: 'ngeuya58@gmail.com'
        }
    }
}