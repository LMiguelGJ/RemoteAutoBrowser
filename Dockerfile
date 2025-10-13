# Imagen base de Node.js optimizada para Puppeteer
FROM node:20-slim

# Variables de entorno
ENV DEBIAN_FRONTEND=noninteractive
ENV NODE_ENV=production

# Instalar dependencias mínimas del sistema para Chromium headless (usado por Puppeteer)
RUN apt-get update && apt-get install -y \
    wget \
    ca-certificates \
    libnss3 \
    libnspr4 \
    libatk1.0-0 \
    libatk-bridge2.0-0 \
    libcups2 \
    libdrm2 \
    libxss1 \
    libgconf-2-4 \
    libxrandr2 \
    libasound2 \
    libpangocairo-1.0-0 \
    libcairo-gobject2 \
    libgdk-pixbuf2.0-0 \
    libxcomposite1 \
    libxdamage1 \
    libxext6 \
    libxfixes3 \
    libxi6 \
    libxrender1 \
    libxtst6 \
    fonts-liberation \
    libxkbcommon0 \
    libgbm1 \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get clean

# Directorio de trabajo
WORKDIR /app

# Copiar archivos de dependencias
COPY package*.json ./

# Instalar dependencias de Node.js (Puppeteer descargará Chromium en esta fase)
RUN npm ci --only=production

# Copiar código fuente
COPY . .

# Asignar permisos al usuario no-root existente en la imagen (node)
RUN chown -R node:node /app

# Cambiar a usuario no-root
USER node

# Exponer puerto
EXPOSE 3000

# Opciones de Node para memoria (ajustable según necesidad)
ENV NODE_OPTIONS="--max-old-space-size=4096"

# Comando de inicio
CMD ["npm", "start"]