locals {
# subnets
  public_subnets_ids = [ for i,j in lookup(lookup(module.subnets, "public", null ), "subnet_ids", null) : j.id]
  app_subnets_ids = [ for i,j in lookup(lookup(module.subnets, "app", null ), "subnet_ids", null) : j.id]
  db_subnets_ids = [ for i,j in lookup(lookup(module.subnets, "app", null ), "subnet_ids", null) : j.id]
  private_subnets_ids = concat(local.app_subnets_ids, local.db_subnets_ids)

  #rt
  public_route_table_ids =  [ for i,j in lookup(lookup(module.subnets, "public", null ), "route_table_ids", null) : j.id]
  app_route_table_ids = [ for i,j in lookup(lookup(module.subnets, "app", null ), "route_table_ids", null) : j.id]
  db_route_table_ids = [ for i,j in lookup(lookup(module.subnets, "db", null ), "route_table_ids", null) : j.id]
  private_route_table_ids = concat(local.app_route_table_ids,local.db_route_table_ids)
 #tags
  tags = merge(var.tags, {tf-module-name = "vpc"})
}
