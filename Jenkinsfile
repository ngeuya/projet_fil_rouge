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
        stage('Build') {
            steps {
                script {
                    sh 'docker --version' // Vérifier que Docker est accessible
                    // Lancement de Docker Compose
                    sh 'docker build -t ${DOCKER_IMAGE2}:${DOCKER_TAG1} -f Db.Dockerfile .'
                    sh 'docker build -t ${DOCKER_IMAGE1}:${DOCKER_TAG2} -f Web.Dockerfile .'
                }
            }
        }
        stage('Push Docker Image') {
            steps {
                script {
                    // Mettez ici vos commandes pour pousser
                    sh 'docker tag ${DOCKER_IMAGE1}:${DOCKER_TAG1} ngeuya/${DOCKER_IMAGE1}:${DOCKER_TAG1}'
                    sh 'docker push ngeuya/${DOCKER_IMAGE1}:${DOCKER_TAG1}'
                    sh 'docker tag ${DOCKER_IMAGE2}:${DOCKER_TAG2} ngeuya/${DOCKER_IMAGE2}:${DOCKER_TAG2}'
                    sh 'docker push ngeuya/${DOCKER_IMAGE2}:${DOCKER_TAG2}'
                }
            }
        }
        stage('Deploy') {
            steps {
                withCredentials([file(credentialsId: 'kubeconfig', variable: 'KUBECONFIG')]) {
                    script {
                        // Déployer sur Kubernetes
                        sh 'kubectl apply -f kubernetes/components.yaml --kubeconfig=${KUBECONFIG} --validate=false '
                        sh 'kubectl apply -f kubernetes/db-deployment.yml --kubeconfig=${KUBECONFIG} --validate=false'
                        sh 'kubectl apply -f kubernetes/web-deployment.yml --kubeconfig=${KUBECONFIG} --validate=false'
                    }
                }
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
