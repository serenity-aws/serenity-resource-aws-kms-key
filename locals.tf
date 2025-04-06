locals {
  kms_keys = {
    for name, kms in try(local.data, {}) :
    name => key if var.create && try(data.create, true) && try(key.create, true)
  }
}
