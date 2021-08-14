provider "oneview" {
  ov_username   = var.username
  ov_password   = var.password
  ov_endpoint   = var.endpoint
  ov_sslverify  = var.ssl_enabled
  ov_apiversion = 3000
  ov_ifmatch    = "*"
}

data "oneview_scope" "scope_obj" {
  name = "testing"
}

# Creates the fc network with name TestFCNetwork and local name FCNetwork.
resource "oneview_fc_network" "FCNetwork" {
  name               = "TestFCNetwork"
  fabric_type        = "FabricAttach"
  type               = "fc-networkV4"
  initial_scope_uris = [data.oneview_scope.scope_obj.uri]
}
# Creates the fc network with  fabric type direct attach.
# resource "oneview_fc_network" "FCNetwork" {
#   name               = "TestFCNetwork"
#   fabric_type        = "DirectAttach"
#   type               = "fc-networkV4"
#   initial_scope_uris = [data.oneview_scope.scope_obj.uri]
# }

