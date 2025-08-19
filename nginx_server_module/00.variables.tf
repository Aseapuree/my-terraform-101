## VARIABLES
## Las variables en terraform son usadas para parametrizar y personalizar la configuracion de la infraestructura

variable "ami_id" {
   description   = "ID de la AMI para la instancia EC2"
   default       = "ami-0440d3b780d96b29d"
}

variable "instance_type" {
   description   = "Tipo de instancia EC2"
   default       = "t2.micro"
}

variable "server_name" {
   description   = "Nombre del servidor web"
   default       = "nginx-server"
}

variable "environment" {
   description   = "Ambiente de la aplicacion"
   default       = "test"
}
