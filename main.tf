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

