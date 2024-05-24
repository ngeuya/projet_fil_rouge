provider "kubernetes" {
  config_path = "~/.kube/config"
}
resource "kubernetes_manifest" "deployment" {
  manifest = yamldecode(file("../kubernetes/web-deployment.yml"))
}

resource "kubernetes_manifest" "deployment2" {
  manifest = yamldecode(file("../kubernetes/db-deployment.yml"))
}

resource "kubernetes_manifest" "db-service" {
  manifest = yamldecode(file("../kubernetes/db-service.yml"))
}
resource "kubernetes_manifest" "web-service" {
  manifest = yamldecode(file("../kubernetes/web-service.yml"))
}