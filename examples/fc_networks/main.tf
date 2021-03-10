provider "oneview" {
  ov_username   = var.username
  ov_password   = var.password
  ov_endpoint   = var.endpoint
  ov_sslverify  = var.ssl_enabled
  ov_apiversion = 2600
  ov_ifmatch    = "*"
}

data "oneview_scope" "scope_obj" {
  name = "testing"
}

# Creates the fc network with name TestFCNetwork and local name FCNetwork.
resource "oneview_fc_network" "FCNetwork" {
  name               = "TestFCNetwork"
  type               = "fc-networkV4"
  initial_scope_uris = [data.oneview_scope.scope_obj.uri]
}
