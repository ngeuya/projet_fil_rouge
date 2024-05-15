# Projet Fil rouge pour l'apprentissage des outils devOps
## Prerequis 
#### Installer minikube 
#### Installer terraform

## Clonez le projet dans le server web sur htdocs

`git clone https://github.com/ngeuya/projet_fil_rouge.git`
## creer la base de donnees dans mysql et gerer les configuration necessaire dans l'appli
## Demarrer minikube 
`minikube start`
## Provisionner vos ressource avec terraform
`cd Terraform`
`terraform init`
`terraform plan`
`terraform apply`
vous pouvez consulter l'appli avec  
`minikube service apache-service`
