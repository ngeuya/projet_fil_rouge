pipeline {
    agent any
    environment {
        PATH = "/usr/local/bin:$PATH" // Assurez-vous que cela inclut le chemin vers Docker
    }
    stages {
        stage ('Configuration Environnement') {
            steps {
                script {
                    sh '''
                    cd Ansible
                    mkdir -p env
                    python3 -m venv env
                    source env/bin/activate
                    pip3 install ansible
                    '''
                }
            }
        }
        stage ('Configuration et déploiement') {
            steps {
                script {
                    sh '''
                    source Ansible/env/bin/activate
                    cd Ansible
                    ansible-playbook -i localhost, -c local ansible-deploy.yml
                    '''
                }
            }
        }
    }
    post {
        success {
            emailext body: 'Résultat du build: Success', subject: 'Détail du Build', to: 'ngeuya58@gmail.com'
        }
        failure {
            emailext body: 'Résultat du build: Échec', subject: 'Détail du Build', to: 'ngeuya58@gmail.com'
        }
    }
}
