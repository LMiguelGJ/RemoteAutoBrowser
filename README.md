# 🚀 PyRock - Automatización con Playwright y Render

**PyRock** es una aplicación de control remoto de navegador que utiliza **Playwright** para automatización web y **WebSocket** para comunicación en tiempo real. Permite controlar un navegador de forma remota a través de una interfaz web moderna.

## ✨ Características

- 🌐 **Control remoto de navegador** con Playwright
- 📡 **Comunicación en tiempo real** via WebSocket
- 🖱️ **Control de mouse y teclado** desde la interfaz web
- 📸 **Capturas de pantalla en vivo** cada 2 segundos
- 🎨 **Interfaz moderna y responsiva**
- 🐳 **Listo para desplegar en Render** con Docker
- 🔄 **Reconexión automática** en caso de pérdida de conexión
- 📋 **Registro de actividad** en tiempo real

## 🛠️ Tecnologías Utilizadas

- **Node.js** - Runtime de JavaScript
- **Express.js** - Framework web
- **Playwright** - Automatización de navegadores
- **WebSocket (ws)** - Comunicación bidireccional
- **HTML5/CSS3/JavaScript** - Frontend moderno
- **Docker** - Containerización para despliegue

## 📂 Estructura del Proyecto

```
PyRock/
├── public/
│   └── index.html          # Frontend con interfaz de control
├── server.js               # Servidor principal con Express y WebSocket
├── package.json            # Configuración de dependencias
├── Dockerfile              # Configuración para despliegue
├── .gitignore             # Archivos a ignorar en Git
└── README.md              # Documentación del proyecto
```

## 🚀 Instalación y Uso Local

### Prerrequisitos

- **Node.js** 18+ instalado
- **Git** para clonar el repositorio
- **PowerShell** o **CMD** en Windows

### Pasos de Instalación

1. **Clonar o descargar el proyecto**
   ```powershell
   cd C:\Users\LMiguelGJ\Desktop\PyRock
   ```

2. **Instalar dependencias**
   ```powershell
   npm install
   ```

3. **Instalar navegadores de Playwright**
   ```powershell
   npx playwright install
   ```

4. **Ejecutar el servidor**
   ```powershell
   npm start
   ```

5. **Abrir en el navegador**
   ```
   http://localhost:3000
   ```

## 🎮 Cómo Usar

### Interfaz Web

1. **Inicialización**: Haz clic en "🔄 Inicializar" para arrancar el navegador remoto
2. **Control de Mouse**: 
   - Introduce coordenadas X,Y y haz clic en "Click en Coordenadas"
   - O haz clic directamente en la imagen de preview
3. **Control de Teclado**: 
   - Escribe texto en el campo y presiona "Escribir"
   - Usa los botones para teclas especiales (Enter, Tab, Escape)
4. **Navegación**: Introduce una URL y presiona "Ir"
5. **Capturas**: Usa "Capturar Pantalla" para obtener una imagen actualizada

### Atajos de Teclado

- **Ctrl + R**: Capturar pantalla
- **Ctrl + I**: Inicializar navegador

### API REST

- `GET /api/status` - Obtener estado del navegador
- `POST /api/restart` - Reiniciar el navegador

## 🐳 Despliegue en Render

### Opción 1: Desde GitHub

1. **Subir código a GitHub**
   ```powershell
   git init
   git add .
   git commit -m "Initial commit"
   git remote add origin https://github.com/tu-usuario/pyrock.git
   git push -u origin main
   ```

2. **Conectar con Render**
   - Ve a [render.com](https://render.com)
   - Crea un nuevo "Web Service"
   - Conecta tu repositorio de GitHub
   - Render detectará automáticamente el Dockerfile

### Opción 2: Deploy Directo

1. **Instalar Render CLI**
   ```powershell
   npm install -g @render/cli
   ```

2. **Hacer deploy**
   ```powershell
   render deploy
   ```

### Variables de Entorno en Render

- `NODE_ENV=production`
- `PORT=3000` (automático en Render)

## 🔧 Configuración Avanzada

### Variables de Entorno

```bash
NODE_ENV=production          # Modo de ejecución
PORT=3000                   # Puerto del servidor
PLAYWRIGHT_BROWSERS_PATH=   # Ruta de navegadores (opcional)
```

### Personalización del Navegador

En `server.js`, puedes modificar las opciones del navegador:

```javascript
const browserOptions = {
    headless: process.env.NODE_ENV === 'production',
    args: [
        '--no-sandbox',
        '--disable-setuid-sandbox',
        // Agregar más argumentos según necesidad
    ]
};
```

## 🐛 Solución de Problemas

### Error: "Navegador no inicializado"
- Haz clic en "🔄 Inicializar" en la interfaz
- O usa el endpoint `/api/restart`

### Error de conexión WebSocket
- Verifica que el servidor esté ejecutándose
- Revisa la consola del navegador para errores
- La aplicación intentará reconectar automáticamente

### Problemas en Render
- Verifica que el Dockerfile esté en la raíz del proyecto
- Asegúrate de que el puerto 3000 esté expuesto
- Revisa los logs de Render para errores específicos

## 📊 Monitoreo y Logs

La aplicación incluye:
- **Logs en consola** del servidor
- **Registro de actividad** en la interfaz web
- **Estado de conexión** en tiempo real
- **Manejo de errores** con mensajes descriptivos

## 🔒 Seguridad

- **Usuario no-root** en Docker
- **Validación de entrada** en WebSocket
- **Manejo seguro de errores**
- **Sin exposición de credenciales**

## 🤝 Contribuir

1. Fork el proyecto
2. Crea una rama para tu feature (`git checkout -b feature/AmazingFeature`)
3. Commit tus cambios (`git commit -m 'Add some AmazingFeature'`)
4. Push a la rama (`git push origin feature/AmazingFeature`)
5. Abre un Pull Request

## 📄 Licencia

Este proyecto está bajo la Licencia MIT. Ver el archivo `LICENSE` para más detalles.

## 👨‍💻 Autor

**LMiguelGJ** - Desarrollo inicial

## 🙏 Agradecimientos

- [Playwright](https://playwright.dev/) - Por la excelente herramienta de automatización
- [Express.js](https://expressjs.com/) - Por el framework web robusto
- [Render](https://render.com/) - Por la plataforma de despliegue sencilla

---

**¡Disfruta automatizando con PyRock! 🚀**