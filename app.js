const express = require('express');
const mongoose = require('mongoose');
const cors = require('cors');
require('dotenv').config();

// 1. Inicialización de la App
const app = express();

// 2. Middlewares (Configuraciones base)
app.use(cors()); // Permite peticiones desde otros dominios (frontend)
app.use(express.json()); // Permite que tu API entienda archivos JSON
app.use(express.urlencoded({ extended: true }));

// 3. Conexión a MongoDB (Solo si no estás en entorno de pruebas)
// Nota: Se usa una condicional para evitar múltiples conexiones en los tests
if (process.env.NODE_ENV !== 'test') {
    mongoose.connect(process.env.MONGODB_URI || 'mongodb://127.0.0.1:2017/ReciclajePopayan')
        .then(() => console.log('✅ Conectado a MongoDB (Proyecto Popayán)'))
        .catch(err => console.error('❌ Error de conexión:', err));
}

// 4. Importar Rutas
// Asegúrate de que este archivo exista en tu carpeta de routes
const rutasReciclaje = require('./src/routes/recoleccion.routes'); 

// 5. Montar Rutas
app.use('/api/recoleccion', rutasReciclaje);

// Ruta de bienvenida/salud para verificar que el servidor corre
app.get('/', (req, res) => {
    res.json({ mensaje: "Bienvenido a la API de Reciclaje Popayán 🌿" });
});

// 6. Manejo de Errores (404)
app.use((req, res, next) => {
    res.status(404).json({ mensaje: "Ruta no encontrada" });
});

// 7. EXPORTAR LA APP (Crucial para Jest y Supertest)
module.exports = app;