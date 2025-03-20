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
  test-dashboard_json = file("grafana-templates/test-dashboard.json")
}

resource "kubernetes_config_map" "grafana_dashboards" {
  metadata {
    name      = "grafana-dashboards"
    namespace = "monitoring"
  }

  data = {
    "dashboard1.json" = local.test-dashboard_json
  }
}
