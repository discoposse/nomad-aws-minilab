#data "template_file" "client" {
#  template = file("conf/install-nomad.sh")
#}
data "template_cloudinit_config" "config" {
  gzip          = false
  base64_encode = false
  #first part of local config file
  part {
    content_type = "text/x-shellscript"
    content      = <<-EOF
    #!/bin/bash
    # Install New Relic Agent
    # Create a configuration file and add your license key \
    echo "license_key: ${var.new_relic_key}" | sudo tee -a /etc/newrelic-infra.yml && \
    \
    # Create the agent's yum repository \
    sudo curl -o /etc/yum.repos.d/newrelic-infra.repo https://download.newrelic.com/infrastructure_agent/linux/yum/el/7/x86_64/newrelic-infra.repo && \
    \
    # Update your yum cache \
    sudo yum -q makecache -y --disablerepo='*' --enablerepo='newrelic-infra' && \
    \
    # Run the installation script \
    sudo yum install newrelic-infra -y
    EOF
  }
  #second part
  #part {
  #  content_type = "text/x-shellscript"
  ##  content      = data.template_file.client.rendered
  #}
}