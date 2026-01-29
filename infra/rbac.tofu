resource "kubernetes_service_account" "ci" {
  metadata {
    name      = "github-ci"
    namespace = "apps"
  }
}

resource "kubernetes_cluster_role_binding" "ci_admin" {
  metadata {
    name = "github-ci-admin"
  }

  subject {
    kind      = "ServiceAccount"
    name      = kubernetes_service_account.ci.metadata[0].name
    namespace = "apps"
  }

  role_ref {
    kind      = "ClusterRole"
    name      = "cluster-admin"
    api_group = "rbac.authorization.k8s.io"
  }
}
