provider "aws" {
region = "us-east-2"
}
resource "aws_instance" "example" {
 ami = "ami-0d5d9d301c853a04a"
 instance_type = "t2.micro"
}
resource "aws_key_pair" "example" {
  key_name   = "deployer-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAlmuAQkNAyiUBKAKRcD9+psQ5UEk6X/i4SPiE5GJbQuSaXHzopSBPwgbWuWBSTbQn+V0/jdIeBbNcY7J68IJGQd/H76ozU5hAomW8Kse5eSEu/aoRpXiGmRBQOb6bQKLq9xIKpwJmPF6L2QxCCtFUQBXEOu+GDQf6t9TVMI1qb2yoldkOT2w4W/8oN3cSZ4pkyygVYrosAouJNxLdvLoLba/eV1htlwocaG0nXtP18M2naZfdpMp/hqNgU7eYhp5AlnV6yxfcbNc+ofVwZl4SBBIWcs9gGl4gFRdFJVbwEN76BvPqrHwmkDZCBdHUeqe+kU4TpoycICBVabrVTcxLeQ== rsa-key-20191127"
}
provisioner "remote-exec" {
        inline = [
            "export PATH=$PATH:/usr/bin",
            "sudo apt-get update",
            "sudo apt-get -y install nginx"
        ]
    }
provisioner "file" {
    source      = "world.html"
    destination = "/usr/local/www/world.html"
}
