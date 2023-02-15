terraform { 
  required_version = ">=0.15.0"
}

terraform{
    tequired porviders{
        kubernetes = {
            source = "hashicorp/kubernetes"
            version = "2.2.0"
        }
    }
}
provider "kubernetes" {
    confing_path = "./k3s.yaml"

}

locals {
  deployment = file ("./deployment.yaml")
}

resource "kubernetes_mainfest" "example"{
    api_version = "app/v1"
    kind = "Deployment"
    manifest = "local.deployemnt_file"
}