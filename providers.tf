provider "kubernetes" {
  config_path = "~/.kube/k3s-config/k3s.yaml"
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/k3s-config/k3s.yaml"
  }
}
