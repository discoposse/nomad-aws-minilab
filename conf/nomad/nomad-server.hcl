data_dir = "/tmp/nomad/server"

server {
  enabled          = true
  bootstrap_expect = 1
  job_gc_threshold = "2m"
}

datacenter = "dc-aws-1"

region = "east"

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
}
