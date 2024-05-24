provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "k8s_master" {
  ami           = "ami-04b70fa74e45c3917"
  instance_type = "t2.micro"
  key_name      = "ame_cle"

  security_groups = [aws_security_group.k8s_sg.name]

  tags = {
    Name = "K8s Master Node"
  }

  user_data = <<-EOF
    #!/bin/bash
    sudo apt-get update
    sudo apt-get update
              sudo apt-get install -y apt-transport-https
              sudo apt-get install -y curl
              sudo apt-get install -y docker.io
              sudo curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
              sudo chmod +x minikube
              sudo mv minikube /usr/local/bin/
              sudo apt-get install -y conntrack
              sudo minikube start --driver=docker
              sudo usermod -aG docker ubuntu
    # Install Flannel networking
    kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml
    kubectl apply -f https://raw.githubusercontent.com/ngeuya/projet_fil_rouge/main/db-deployment.yml
    kubectl apply -f https://raw.githubusercontent.com/ngeuya/projet_fil_rouge/main/web-deployment.yml
  EOF
}

resource "aws_security_group" "k8s_sg" {
  name = "k8s_security_group"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 6443
    to_port     = 6443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
