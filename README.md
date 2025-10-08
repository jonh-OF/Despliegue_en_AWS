# Despliegue_en_AWS
# 🚀 Proyecto Terraform: ¡Desplegando Infraestructura como un Pro!

¡Bienvenido, explorador del código! 🌍  
Aquí has entrado a un pequeño pero poderoso proyecto de **Terraform**, la herramienta que convierte líneas de texto en infraestructura real en AWS — ¡como magia, pero sin varita!

---

## 📦 ¿Qué hace este proyecto?

Este proyecto es una pequeña **máquina de despliegue automatizado**, perfecta para aprender, practicar o impresionar a tus amigos ingenieros.

**Crea lo siguiente:**

- 🖥️ Una instancia EC2 usando una **AMI oficial de Ubuntu** (para que puedas dormir tranquilo).
- 🪣 Un bucket S3 llamado `mi-bucket-localstack-jonh` (porque un buen proyecto siempre necesita un bucket).
- 📍 Una salida (`output`) que te muestra:
  - El ID de la AMI usada.
  - La región donde se desplegó todo.

---

## 🧠 ¿Qué tecnologías se usan?

- [Terraform](https://www.terraform.io/) - IaC (Infraestructura como Código).
- [AWS](https://aws.amazon.com/) - El patio de juegos de la nube.
- (Opcional) [LocalStack](https://localstack.cloud/) - Para pruebas sin gastar dinero (💰).

---

## 📁 Estructura de archivos

-  main.tf # Define recursos: EC2, S3
-  provider.tf # Conecta con AWS o LocalStack
-  variables.tf # Parámetros reutilizables
-  terraform.tfvars # Valores de variables (puede estar en .gitignore)
-  README.md # Esto que estás leyendo 😎

---

## 🛠️ ¿Cómo lo uso?

### 1. 🚧 Requisitos previos

- Terraform instalado → [Instalar Terraform](https://developer.hashicorp.com/terraform/downloads)
- Cuenta de AWS (o LocalStack funcionando en `localhost:4566`)
- Credenciales configuradas (`aws configure`)

### 2. 🧪 Inicializa el proyecto

```bash
terraform init
terraform plan
terraform apply

##📝 Créditos

Creado con ❤ y algo de frustración solucionando errores de Terraform.
Por jonh-OF ¡ahora oficialmente un constructor de nubes!
