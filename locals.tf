locals {
  kms_keys = {
    for name, key_data in try(var.data, {}) :
    name => key_data if var.create && try(var.data.create, true) && try(key_data.create, true)
  }
}
