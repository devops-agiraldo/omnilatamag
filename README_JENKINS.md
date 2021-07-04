
Paso a paso creación Job en Jenkins

1. Se crea un contenedor Docker con Jenkins y se configura para posteriormente acceder a la GUI.
2. Se configura el acceso a Jenkins con las credenciales
3. Se procede a crear una nueva tarea en Jenkins, del tipo "Crear un proyecto de estilo libre"
  ![image](https://user-images.githubusercontent.com/86692845/124375822-a9993900-dc69-11eb-93a2-4c677a17adaf.png)
  
4. Se le asigna una descripción al Job: "Job to create and destroy AWS Infrastructure from Terraform". Adicional, se configura para que se desechen las ejecuciones antiguas y solo se mantengan las últimas 3.
  ![image](https://user-images.githubusercontent.com/86692845/124375885-ecf3a780-dc69-11eb-9d47-dac0acc16540.png)
  
5. Se configura el origen del código fuente para que obtenga el proyecto desde Git. Se establece la url del repo, se crean las credenciales en Jenkins y se asignan. Adicional se indica que debe tomar el proyecto de la rama "main"
  ![image](https://user-images.githubusercontent.com/86692845/124375948-42c84f80-dc6a-11eb-82aa-8c75fd1427a4.png)
  
6. Se configura la ejecución desde la opción "Ejecutar desde línea de comandos (shell)"
 
  ![image](https://user-images.githubusercontent.com/86692845/124376001-74d9b180-dc6a-11eb-846c-f3370d5b9a0e.png)
  
7. Se procede a definir las acciones a ejecutar en 3 bloques(pasos) de ejecución.
   - Bloque de instanación de Terraform:
     ![image](https://user-images.githubusercontent.com/86692845/124376041-a18dc900-dc6a-11eb-9b87-d326bc40bbb6.png)
     
   - Bloque de despliegue de la infraestructura de AWS desde Terraform
     ![image](https://user-images.githubusercontent.com/86692845/124376084-de59c000-dc6a-11eb-8b3b-c055ea52db75.png)
     
   - Bloque de destrucción de la infraestructura de AWS desde Terraform
     ![image](https://user-images.githubusercontent.com/86692845/124376308-07c71b80-dc6c-11eb-82b7-f087e0ac5e2c.png)
 
8. Se aplican cambios, se guarda el Job y se ejecuta, obteniendo su ejecución un resultado exitoso.
  ![image](https://user-images.githubusercontent.com/86692845/124376561-30034a00-dc6d-11eb-84cf-f723f1532238.png)

9. Se evidencia en los logs de la ejecución que se crea la infraestructura y posterior a ello se destruye:
>>> Apply complete! Resources: 18 added, 0 changed, 0 destroyed.

>>> Destroy complete! Resources: 8 destroyed.

Por último, se comparte en texto el código utilzado en las ejecuciones del Job de Jenkins:

Acción #1
>>> echo ""
>>> 
>>> echo "############### Installig Terraform ###############"
>>> 
>>> echo ""
>>> 
>>> file="/usr/local/bin/terraform"
>>> 
>>> [ -f $file ] && rm $file
>>> 
>>> wget https://releases.hashicorp.com/terraform/1.0.1/terraform_1.0.1_linux_amd64.zip
>>> 
>>> unzip terraform_1.0.1_linux_amd64.zip -d /usr/local/bin/
>>> 
>>> terraform -v
>>> 


Acción #2

>>> echo ""
>>> 
>>> echo "############### Deploying AWS Infrastructure from Terraform ###############"
>>> 
>>> echo ""
>>> 

>>> export AWS_ACCESS_KEY_ID="AKIAWPBG5****"
>>> 
>>> export AWS_SECRET_ACCESS_KEY="kOA30zrAdv********"
>>> 
>>> export AWS_DEFAULT_REGION="us-east-1"
>>> 

>>> cd /var/jenkins_home/workspace/Execute\ Terraform\ Project\ from\ Github
>>> 
>>> terraform init
>>> 
>>> terraform plan
>>> 
>>> terraform apply -input=false -auto-approve
>>> 

Acción #3
>>> echo ""
>>> 
>>> echo "############### Destroying AWS Infrastructure ###############"
>>> 
>>> echo ""
>>> 
>>> export AWS_ACCESS_KEY_ID="AKIAWPBG5****"
>>> 
>>> export AWS_SECRET_ACCESS_KEY="kOA30zrAdv********"
>>> 
>>> export AWS_DEFAULT_REGION="us-east-1"
>>> 
>>> terraform init
>>> 
>>> terraform plan
>>> 
>>> terraform destroy -input=false -auto-approve

  
