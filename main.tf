resource "aws_kms_key" "this" {
  for_each = local.resources

  bypass_policy_lockout_safety_check = try(each.value.bypass_policy_lockout_safety_check, null)
  customer_master_key_spec           = try(each.value.customer_master_key_spec, null)
  custom_key_store_id                = try(each.value.custom_key_store_id, null)
  deletion_window_in_days            = try(each.value.deletion_window_in_days, null)
  description                        = try(each.value.description, null)
  enable_key_rotation                = try(each.value.enable_key_rotation, null)
  is_enabled                         = try(each.value.is_enabled, null)
  key_usage                          = try(each.value.key_usage, null)
  multi_region                       = try(each.value.multi_region, null)
  policy                             = try(each.value.policy, null)
  rotation_period_in_days            = try(each.value.rotation_period_in_days, null)

  tags = merge(
    var.tags,
    var.name_tag_enabled ? {
      Name = each.key
    } : {},
    try(each.value.tags, {})
  )
}
