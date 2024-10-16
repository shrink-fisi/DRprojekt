terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "0.62.0"
    }
  }
}


provider "proxmox" {
  endpoint = "<INSERT_YOUR_OWN_INFO_HERE>"
  api_token = "<INSERT_YOUR_OWN_INFO_HERE>"
  insecure = true
  ssh {
    agent = true
    username = "<INSERT_YOUR_OWN_INFO_HERE>"
    password = "<INSERT_YOUR_OWN_INFO_HERE>"
  }
}

variable "vm_count_s" {
  type    = number
  default = 2
}

variable "vm_count_v" {
  type    = number
  default = 2
}

variable "vm_ids_s" {
  type    = list(number)
  default = [9001, 9003]
}

variable "vm_ids_v" {
  type    = list(number)
  default = [9002, 9004]
}

variable "mac_addresses_s" {
  type    = list(string)
  default = ["<INSERT_YOUR_OWN_INFO_HERE>", "<INSERT_YOUR_OWN_INFO_HERE>"]
}

variable "mac_addresses_v" {
  type    = list(string)
  default = ["<INSERT_YOUR_OWN_INFO_HERE>", "<INSERT_YOUR_OWN_INFO_HERE>"]
}

resource "proxmox_virtual_environment_vm" "windows-server_vmS" {
  count        = var.vm_count_s
  vm_id        = var.vm_ids_s[count.index]
  node_name    = "pve"

  agent {
    enabled = true
  }

  stop_on_destroy = true

  clone {
    datastore_id = "<INSERT_YOUR_OWN_INFO_HERE>"
    vm_id        = 4100
    node_name    = "pve"
    full         = true
  }

  network_device {
    bridge      = "vmbr0"
    mac_address = var.mac_addresses_s[count.index]
  }

  cpu {
    sockets = 2
    cores   = 2
  }

  memory {
    dedicated = 8192
  }
}

resource "proxmox_virtual_environment_vm" "windows-server_vmV" {
  count        = var.vm_count_v
  vm_id        = var.vm_ids_v[count.index]
  node_name    = "pve2"

  agent {
    enabled = true
  }

  stop_on_destroy = true

  clone {
    datastore_id = "<INSERT_YOUR_OWN_INFO_HERE>"
    vm_id        = 4101
    node_name    = "pve2"
    full         = true
  }

  network_device {
    bridge      = "vmbr1"
    mac_address = var.mac_addresses_v[count.index]
  }

  cpu {
    sockets = 2
    cores   = 2
  }

  memory {
    dedicated = 8192
  }
}

resource "proxmox_virtual_environment_vm" "debian-server_vm" {

  vm_id		= "9005"
  node_name	= "pve3"
  
  agent {
	enabled = true
  }
  stop_on_destroy = true

  clone {
	datastore_id = "<INSERT_YOUR_OWN_INFO_HERE>"
	vm_id	= 4202
	node_name = "pve3"
	full	= true
  }

  network_device {
	bridge = "vmbr0"
	mac_address = "<INSERT_YOUR_OWN_INFO_HERE>"
  }

  cpu {
	sockets = 2
	cores	= 2
  }

  memory {
	dedicated = 8192
  }

}
