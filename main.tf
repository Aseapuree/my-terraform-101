
### COMANDOS INICIALES   ###

## terraform init #Inicializar un directorio de trabajo
## terraform plan #Generar un plan de ejecucion 
## terraform apply #Aplica los cambios definidos
## terraform destroy #Eliminar los recursos


### Provider ###
### Un proveedor en terraform es un plugin que interactua con un servicio o API especifica de un proveedor de infraestructura. ###

provider "aws" {
   region = "us-east-1"
}

### Resource ###
### Los recursos son la unidad basica de configuracion en Terraform ###
resource "aws_instance" "nginx-server" {
   ami            = "ami-0440d3b780d96b29d"
   instance_type  = "t2.micro"

   user_data      = <<-EOF
                    #!/bin/bash
                    sudo yum install -y nginx
                    sudo systemctl enable nginx
                    sudo systemctl start nginx
                    EOF

   key_name       = aws_key_pair.nginx-server-ssh.key_name

   vpc_security_group_ids = [
      aws_security_group.nginx-server-sg.id
   ]
} 

## CLAVES
## ssh-keygen -t rsa -b 2048 -f "nginx-server.key"
resource "aws_key_pair" "nginx-server-ssh" {
   key_name       = "nginx-server-ssh"
   public_key     = file("nginx-server.key.pub")
}


resource "aws_security_group" "nginx-server-sg" {
   name           = "nginx-server-sg"
   description    = "Security group allowing SSH and HTTP access"

   ingress {
      from_port    = 22
      to_port      = 22
      protocol     = "tcp"
      cidr_blocks  = ["0.0.0.0/0"]
   }   

   ingress {
      from_port    = 80
      to_port      = 80
      protocol     = "tcp"
      cidr_blocks  = ["0.0.0.0/0"] 
   }

   egress {
      from_port    = 0
      to_port      = 0
      protocol     = "-1"
      cidr_blocks  = ["0.0.0.0/0"]

   }




}

