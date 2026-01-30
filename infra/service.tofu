resource "kubernetes_service" "demo_service" {
  metadata {
    name      = "demo-service"
    namespace = kubernetes_namespace.apps.metadata[0].name
  }

  spec {
    selector = {
      app = kubernetes_deployment.demo_app.metadata[0].labels.app
    }

    port {
      port        = 80
      target_port = 80
    }

    type = "NodePort"
  }
}

