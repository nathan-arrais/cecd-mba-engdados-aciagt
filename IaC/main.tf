# main.tf

# Configuração do provedor GCP
provider "google" {
  credentials = file("C:/Users/natha/Documents/MBA/crypto-arcade-443419-e3-e5b4e2f225fa.json")  # Caminho correto para o arquivo JSON
  project     = "crypto-arcade-443419-e3"                 # ID do seu projeto
  region      = "us-central1"                             # Região desejada
}

# Exemplo de recurso: Criando uma instância de máquina virtual
resource "google_compute_instance" "vm_instance" {
  name         = "example-instance"
  machine_type = "f1-micro"
  zone         = "us-central1-a"  # Substitua pela zona desejada

  # Configurações de disco de inicialização
  boot_disk {
    initialize_params {
      image = "debian-9-stretch-v20191210"  # Imagem do sistema operacional
    }
  }

  # Configuração de rede
  network_interface {
    network = "default"
    access_config {
      # Configurações para IP público
    }
  }
}