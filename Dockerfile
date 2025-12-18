# 1. ESPECIFICA LA IMAGEN BASE
# Esto depende de tu proyecto.
# EJEMPLO para Node.js:
FROM node:18-alpine

# EJEMPLO para Python (Django/Flask):
# FROM python:3.10-alpine

# EJEMPLO para una aplicación Java (Spring Boot):
# FROM openjdk:17-jdk-slim

# 2. CREAR UN DIRECTORIO DE TRABAJO DENTRO DEL CONTENEDOR
WORKDIR /app

# 3. COPIAR ARCHIVOS DE CONFIGURACIÓN Y DEPENDENCIAS
# Para Node.js:
COPY package*.json ./

# Para Python (si usas requirements.txt):
# COPY requirements.txt ./

# 4. INSTALAR DEPENDENCIAS
# Para Node.js:
RUN npm install

# Para Python:
# RUN pip install --no-cache-dir -r requirements.txt

# Si tienes un paso de compilación (como React, Angular o Java):
# Por ejemplo, para crear un build de front-end:
# RUN npm run build

# 5. COPIAR EL RESTO DE LOS ARCHIVOS DEL PROYECTO
COPY . .

# 6. EXPONER EL PUERTO QUE USA TU APLICACIÓN
# Reemplaza 3000 con el puerto que realmente utiliza tu app (ej. 8080, 5000, 3000).
EXPOSE 3000

# 7. COMANDO PARA INICIAR LA APLICACIÓN
# Esto es lo que se ejecutará cuando el contenedor se inicie.
# EJEMPLO para Node.js (asumiendo que el archivo de inicio es index.js):
CMD [ "node", "index.js" ]

# EJEMPLO para Python (Flask/Gunicorn):
# CMD ["gunicorn", "-b", "0.0.0.0:5000", "tu_app:app"]