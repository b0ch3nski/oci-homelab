variable "oci_connection" {
  type = object({
    tenancy_ocid     = string
    user_ocid        = string
    fingerprint      = string
    private_key_path = string
    region           = optional(string, "eu-frankfurt-1")
  })
}

variable "general" {
  type = object({
    compartment_name    = optional(string, "infra")
    bucket_name         = optional(string, "bucket")
    private_ip_group    = optional(string, "172.16")
    private_subnet_size = optional(number, 24)
  })
}

variable "vm" {
  type = object({
    availability_domain = optional(number, 1)
    shape               = optional(string, "VM.Standard.A1.Flex")
    cpus                = optional(number, 4)
    mem_size            = optional(number, 24)
    disk_size           = optional(number, 200)
    image_name          = string
    ssh_public_keys     = list(string)
    os = object({
      hostname       = string
      debian_version = optional(string, "bookworm")
      username       = optional(string, "infra")
      password       = optional(string, "")
      force_dns      = optional(list(string), [])
      wg_config      = optional(map(string), {})
    })
  })
}
