ui = true
disable_mlock = "true"

storage "raft" {
  path    = "/vault/data"
  node_id = "node1"
}

listener "tcp" {
  address = "[::]:8200"
  tls_disable = "true"
  tls_cert_file = "/certs/server.crt"
  tls_key_file  = "/certs/server.key"
}

api_addr = "http://HOSTNAME-VAULT:8200"
cluster_addr = "http://HOSTNAME-VAULT:8201"