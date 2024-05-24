pipeline {
    agent any
    environment {
        PATH = "/usr/local/bin:$PATH" // Assurez-vous que cela inclut le chemin vers Docker
    }
    stages {
        stage ('Configuration Environnemenr') {
            steps {
                script {
                    sh 'cd Ansible'
                    sh 'mkdir env'
                    sh 'python3 -m venv env'
                    sh 'source env/bin/activate'  
                }
            }
        }
        stage('Configuration Ansible') {
            steps {
                script {
                    sh 'pip3 install ansible'
                }
            }
        }
            stage ('Configuration et deploiement') {
            steps {
                script {
                    sh 'ansible-playbook -i localhost, -c local ansible-deploy.yml'
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
