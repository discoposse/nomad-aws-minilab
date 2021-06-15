data_dir = "/tmp/nomad/server"

server {
  enabled          = true
  bootstrap_expect = 3
  job_gc_threshold = "2m"
  server_join {
    retry_join = ["10.0.0.100", "10.0.1.100", "10.0.2.100"]
    retry_max = 10
    retry_interval = "15s"
  }
}

datacenter = "dc-aws-1"
region = "region-aws-1"

advertise {
  http = "{{ GetInterfaceIP `eth0` }}"
  rpc  = "{{ GetInterfaceIP `eth0` }}"
  serf = "{{ GetInterfaceIP `eth0` }}"
}

plugin "raw_exec" {
  config {
    enabled = true
  }
}

client {
  enabled           = true
  network_interface = "eth0"
  servers           = ["10.0.0.100", "10.0.1.100", "10.0.2.100"]

  host_volume "certs" {
    path      = "/data/certs"
    read_only = "true"
  }

  host_volume "mysql" {
    path      = "/data/mysql"
    read_only = "false"
  }

  host_volume "prometheus" {
    path      = "/data/prometheus"
    read_only = "false"
  }

  host_volume "templates" {
    path      = "/data/templates"
    read_only = "true"
  }
}

acl {
  enabled = false
}

telemetry {
  collection_interval = "1s"
  disable_hostname = true
  prometheus_metrics = true
  publish_allocation_metrics = true
  publish_node_metrics = true
}

autopilot {
  cleanup_dead_servers      = true
  last_contact_threshold    = "200ms"
  max_trailing_logs         = 250
  server_stabilization_time = "10s"
  enable_redundancy_zones   = false
  disable_upgrade_migration = false
  enable_custom_upgrades    = false
}



