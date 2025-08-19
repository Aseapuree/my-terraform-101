## CLAVES
## ssh-keygen -t rsa -b 2048 -f "nginx-server.key"
resource "aws_key_pair" "nginx-server-ssh" {
   key_name       = "nginx-server-ssh-${var.environment}"
   public_key     = file("nginx-server.key.pub")

   tags = {
      Name        = "${var.server_name}-ssh"
      Environment = "${var.environment}"
      Owner       = "testprorfa@gmail.com"
      Team        = "DevOps"
      Project     = "webinar"
   }
}