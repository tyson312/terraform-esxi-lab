# create a simple lubuntu host from a local image in this directory
#   - based on script here: https://github.com/josenk/terraform-provider-esxi/blob/master/examples/03%20Resource%20Pools%20-%20Additional%20Storage/main.tf
#
variable "esxi_password" {
  # this value will be stored in terraform.tfvars and included in .gitignore
  description = "esxi password so you don't have type it in" 
}

provider "esxi" {
  esxi_hostname = "some.host.local"
  esxi_hostport = "22"
  esxi_username = "root"
  esxi_password = var.esxi_password
}

resource "esxi_guest" "tf-lubuntu-1" {
  guest_name         = "tf-lubuntu-1"
  disk_store         = "datastore1"
  guestos    = "ubuntu-64"

  boot_disk_type = "thin"
  boot_disk_size = "16"

  memsize            = "2048"
  numvcpus           = "1"
  power              = "off"

  # Specify an existing guest to clone, an ovf source, or neither to build a bare-metal guest vm.
  #clone_from_vm      = "Templates/centos7"
  #ovf_source        = "/local_path/centos-7.vmx"

  network_interfaces {
      virtual_network = "VM Network"
  }
}
