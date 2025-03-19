resource "helm_release" "kube_prometheus_stack" {
  name       = "kube-prometheus-stack"
  namespace  = "monitoring"
  repository = "https://prometheus-community.github.io/helm-charts"
  chart      = "kube-prometheus-stack"
  version    = "70.0.0"
  create_namespace = true

  values = [
    file("values.yaml")
  ]
}

locals {
  dashboard1 = file("${path.module}/grafana-templates/test-dashboard-1742389917481.json")
}