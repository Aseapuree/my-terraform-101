### COMANDOS INICIALES   ###

## terraform init #Inicializar un directorio de trabajo
## terraform plan #Generar un plan de ejecucion 
## terraform apply #Aplica los cambios definidos
## terraform destroy #Eliminar los recursos

## Separación de archivos
# Para mantener el orden es recomedable tener archivos pequeños que cumplan una funcionalidad:
# touch 00.variables.tf \ 
#       01.provider.tf  \ 
#       02.ec2.tf       \ 
#       03.key.tf       \ 
#       04.sg.tf        \ 
#       terraform.tfvars




#### tfstate ###
terraform {
  backend "s3" {
    bucket    = "webinar-terraform-caosbinario-123aaa1234"
    key       = "project01/terraform.tfstate" 
    region    = "us-east-1"
  }
}


## MODULOS
## Son una forma de encapsular y reutilizar bloques de configuracion
## Por cada modulo que se agregue se debe de ejecutar: terraform init
## Para el capitulo de modulos no es necesario .tfvars
module "nginx_server_dev" {
  source = "./nginx_server_module"

  ami_id        = "ami-0440d3b780d96b29d"
  instance_type = "t3.micro"
  server_name   = "nginx_server_dev"
  environment   = "dev"
}

module "nginx_server_qa" {
  source = "./nginx_server_module"

  ami_id        = "ami-0440d3b780d96b29d"
  instance_type = "t3.micro"
  server_name   = "nginx_server_qa"
  environment   = "qa"
}


##Definicion de ouputs    
output "nginx_dev_ip" {
  description = "Direccion IP publica de la instancia EC2"
  value       = module.nginx_server_dev.server_public_ip
}

output "nginx_dev_dns" {
  description = "DNS publico de la instancia EC2"
  value       = module.nginx_server_dev.server_public_dns
}

output "nginx_qa_ip" {
  description = "Direccion IP publica de la instancia EC2"
  value       = module.nginx_server_qa.server_public_ip
}

output "nginx_qa_dns" {
  description = "DNS publico de la instancia EC2"
  value       = module.nginx_server_qa.server_public_dns
}

## GUARDAR plan
## terraform plan -out server_qa.tfplan
## terraform apply "server_qa.tfplan"

##.tfstate
##El archivo de estado de Terraform es un archivo que registra el estado actual de la infraestructura administrada por terraterraform {
##No es correcto que se quede en la maquina local  
