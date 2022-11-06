variable "client_id" {
   default =   env("ARM_CLIENT_ID")
}
variable "subscription_id" {
   default =   env("ARM_SUBSCRIPTION_ID")
}
variable "client_secret" {
   default =   env("ARM_CLIENT_SECRET")
}
variable "tenant_id" {
   default =   env("ARM_TENANT_ID")
}
source "azure-arm" "autogenerated_1" {
  azure_tags = {
    dept = "Engineering"
    task = "Image deployment"
  }
  client_id                         = var.client_id
  client_secret                     = var.client_secret
  image_offer                       = "0001-com-ubuntu-server-focal"
  image_publisher                   = "Canonical"
  image_sku                         = "20_04-lts"
  location                          = "East US"
  managed_image_name                = "myPackerImage"
  managed_image_resource_group_name = "myPackerImages"
  os_type                           = "Linux"
  subscription_id                   = var.subscription_id
  tenant_id                         = var.tenant_id
  vm_size                           = "Standard_DS2_v2"
}

build {
  sources = ["source.azure-arm.autogenerated_1"]

  provisioner "shell" {
    script = "./AnsibleUbuntuAzure.sh"
  }

  provisioner "ansible-local" {
    playbook_file = "./install-tomcat.yml"
  }

  provisioner "shell" {
    script = "./TomcatStart.sh"
  }

}
