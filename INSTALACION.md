# 🚀 Instalación del Sistema de Reciclaje - Popayán

## Prerrequisitos
- Node.js 18+ y npm
- PostgreSQL 14+
- Git

## 📦 Instalación Completa

### 1. Clonar el repositorio (si aplica)
```bash
cd /home/boostec/Documentos/popayan-reciclaje
```

### 2. Configurar Base de Datos PostgreSQL

```bash
# Crear base de datos
sudo -u postgres psql -c "CREATE DATABASE popayan_reciclaje;"
sudo -u postgres psql -c "CREATE USER postgres WITH PASSWORD 'postgres';"
sudo -u postgres psql -c "GRANT ALL PRIVILEGES ON DATABASE popayan_reciclaje TO postgres;"
```

### 3. Backend - Instalación y Configuración

```bash
cd backend

# Instalar dependencias
npm install

# Generar cliente Prisma
npm run prisma:generate

# Ejecutar migraciones
npm run prisma:migrate:deploy

# Poblar base de datos con datos de prueba
npm run prisma:seed

# Iniciar servidor (puerto 8080)
npm run start:dev
```

### 4. Frontend - Instalación y Configuración

```bash
# Abrir nueva terminal
cd frontend

# Instalar dependencias
npm install

# Iniciar aplicación (puerto 3002)
npm run dev
```

## 🌐 URLs de Acceso

- **Frontend**: http://localhost:3002
- **Backend API**: http://localhost:8080
- **Swagger Docs**: http://localhost:8080/api

## 👤 Credenciales de Prueba

### Administrador
- Email: `admin@popayan.gov.co`
- Password: `password123`

### Ciudadanos
- Email: `juan@ejemplo.com` | Password: `password123`
- Email: `maria@ejemplo.com` | Password: `password123`

## 🔧 Comandos Útiles

### Backend

```bash
# Ver logs en desarrollo
npm run start:dev

# Ejecutar en producción
npm run build
npm run start:prod

# Resetear base de datos (CUIDADO: borra todo)
npm run prisma:reset

# Crear nueva migración
npm run prisma:migrate:dev

# Abrir Prisma Studio (GUI para base de datos)
npx prisma studio
```

### Frontend

```bash
# Modo desarrollo
npm run dev

# Build para producción
npm run build

# Ejecutar producción
npm run start

# Linter
npm run lint
```

## 🗄️ Variables de Entorno

### Backend (.env)
```env
DATABASE_URL="postgresql://postgres:postgres@localhost:5432/popayan_reciclaje"
JWT_SECRET="tu-secreto-super-seguro-cambiar-en-produccion"
PORT=8080
```

### Frontend (.env.local)
```env
NEXT_PUBLIC_API_URL=http://localhost:8080
```

## 📊 Estructura de Datos Iniciales

El seed crea:
- ✅ 3 usuarios (1 admin, 2 ciudadanos)
- ✅ 5 materiales reciclables
- ✅ 3 puntos de reciclaje activos
- ✅ 13 asociaciones material-punto
- ✅ 3 entregas de ejemplo
- ✅ 2 solicitudes pendientes

## ⚠️ Solución de Problemas

### Error de conexión a PostgreSQL
```bash
# Verificar que PostgreSQL esté corriendo
sudo systemctl status postgresql
sudo systemctl start postgresql

# Verificar conexión
psql -U postgres -d popayan_reciclaje -c "SELECT 1;"
```

### Puerto 8080 ya en uso
```bash
# Cambiar puerto en backend/src/main.ts (línea del await app.listen)
# O matar proceso en ese puerto
lsof -ti:8080 | xargs kill -9
```

### Error en migraciones Prisma
```bash
cd backend
npm run prisma:reset  # Resetea y ejecuta seed automáticamente
```

### Módulos no encontrados
```bash
# Backend
cd backend && rm -rf node_modules package-lock.json && npm install

# Frontend
cd frontend && rm -rf node_modules package-lock.json && npm install
```

## 🔄 Reinstalación Completa (Desde Cero)

```bash
# 1. Limpiar backend
cd backend
rm -rf node_modules package-lock.json dist
npm install
npm run prisma:generate
npm run prisma:reset  # Esto ejecuta migrate + seed automáticamente

# 2. Limpiar frontend
cd ../frontend
rm -rf node_modules package-lock.json .next
npm install

# 3. Iniciar ambos servicios en terminales separadas
cd ../backend && npm run start:dev
cd ../frontend && npm run dev
```

## 📝 Verificación Post-Instalación

1. ✅ Backend responde en http://localhost:8080
2. ✅ Swagger disponible en http://localhost:8080/api
3. ✅ Frontend carga en http://localhost:3002
4. ✅ Login funciona con credenciales de prueba
5. ✅ Panel admin muestra 2 solicitudes pendientes
6. ✅ Mapa muestra 3 puntos activos
7. ✅ Formulario de entrega muestra materiales por punto
