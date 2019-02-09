provider "aws" {
  shared_credentials_file = "~/.aws/credentials"
  region                  = "eu-west-1"
  version                 = "~> 1.2.0"
}

# Create a new Lightsail Key Pair
resource "aws_lightsail_key_pair" "lightsail_key_pair" {
  name = "lightsail_key_pair"
}


resource "aws_lightsail_instance" "aws_lightsail_instance" {
  provider          = "aws"
  name              = "workbox"
  availability_zone = "eu-west-1a"
  blueprint_id      = "ubuntu_18_04"
  bundle_id         = "nano_1_0"
  key_pair_name     = "lightsail_key_pair"


  # This is where we configure the instance with ansible-playbook
  provisioner "local-exec" {
    command = " sleep 60 ; terraform output private_key | ssh-add - ; ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i '${self.public_ip_address}', -u ubuntu ./lightsail.yml"
}

  connection {
    type        = "ssh"
    host        = "${self.public_ip_address}"
    user        = "ubuntu"
    timeout     = "15s"
  }
}
