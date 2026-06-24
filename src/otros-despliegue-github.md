# Despliegue GitHub Pages + Integración Continua (CI/CD)


---

## Objetivo

Publicar una aplicación Vue + Vite en GitHub Pages utilizando GitHub Actions para automatizar el despliegue cada vez que se realice un `git push`.

---

## ¿Qué es GitHub Pages?

GitHub Pages es un servicio gratuito de GitHub que permite publicar sitios web estáticos directamente desde un repositorio.

Al combinarlo con GitHub Actions podemos crear un flujo de Integración Continua (CI/CD):

```txt
Desarrollador
      ↓
git push
      ↓
GitHub Actions
      ↓
npm install
npm run build
      ↓
GitHub Pages
      ↓
Sitio actualizado
```

---

## 1. Crear el proyecto

Ejemplo con Vue + Vite:

```bash
npm create vite@latest
```

Seleccionar:

```txt
Vue
JavaScript
```

Instalar dependencias:

```bash
npm install
```

Probar localmente:

```bash
npm run dev
```

---

## 2. Crear repositorio en GitHub

Inicializar Git:

```bash
git init
```

Agregar archivos:

```bash
git add .
```

Primer commit:

```bash
git commit -m "primer commit"
```

Conectar con GitHub:

```bash
git branch -M main
git remote add origin URL_REPOSITORIO
git push -u origin main
```

---

## 3. Configurar Vite

Editar:

```txt
vite.config.js
```

Agregar el nombre del repositorio en `base`.

Ejemplo:

Repositorio:

```txt
vue-portafolio
```

Configuración:

```javascript
import { defineConfig } from 'vite'
import vue from '@vitejs/plugin-vue'

export default defineConfig({
  plugins: [vue],
  base: '/vue-portafolio/'
})
```

⚠️ Si no se configura correctamente, los archivos CSS y JavaScript no cargarán al publicar.

---

## 4. Crear workflow de GitHub Actions

Crear carpetas:

```txt
.github/
└── workflows/
    └── deploy.yml
```

---

## 5. Archivo deploy.yml

```yaml
name: Deploy to GitHub Pages

on:
  push:
    branches:
      - main

permissions:
  contents: read
  pages: write
  id-token: write

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
      - name: Clonar repositorio
        uses: actions/checkout@v4

      - name: Instalar Node
        uses: actions/setup-node@v4
        with:
          node-version: 22

      - name: Instalar dependencias
        run: npm install

      - name: Build
        run: npm run build

      - name: Subir artefacto
        uses: actions/upload-pages-artifact@v3
        with:
          path: ./dist

  deploy:
    needs: build

    runs-on: ubuntu-latest

    environment:
      name: github-pages
      url: ${{ steps.deployment.outputs.page_url }}

    permissions:
      pages: write
      id-token: write

    steps:
      - name: Deploy
        id: deployment
        uses: actions/deploy-pages@v4
```

---

## 6. Activar GitHub Pages

Ir al repositorio:

```txt
Settings
→ Pages
```

En:

```txt
Source
```

Seleccionar:

```txt
GitHub Actions
```

Guardar.

---

## 7. Realizar un nuevo push

Cada modificación:

```bash
git add .
git commit -m "actualizacion"
git push
```

disparará automáticamente:

```txt
npm install
npm run build
deploy
```

---

## 8. Revisar el proceso

En GitHub:

```txt
Actions
```

Podrás ver:

```txt
✓ Checkout
✓ Install
✓ Build
✓ Deploy
```

Si todo sale bien aparecerá una URL similar a:

```txt
https://usuario.github.io/vue-portafolio/
```

---

## Estructura final

```txt
proyecto/
│
├── .github/
│   └── workflows/
│       └── deploy.yml
│
├── src/
├── public/
├── vite.config.js
├── package.json
└── README.md
```

---

## Ventajas

* Gratuito
* Integración Continua real
* Automatización del despliegue
* Ideal para portafolios
* Ideal para proyectos Vue y React
* Permite aprender CI/CD profesional

---

## Comparación rápida

| Característica             | GitHub Pages | Vercel        |
| -------------------------- | ------------ | ------------- |
| Gratis                     | ✅            | ✅             |
| Integración con GitHub     | ✅            | ✅             |
| Configuración inicial      | Media        | Muy simple    |
| CI/CD automático           | ✅            | ✅             |
| Ideal para aprender DevOps | ✅            | ⚠️ Más oculto |
| Facilidad de uso           | ⭐⭐⭐          | ⭐⭐⭐⭐⭐         |

### Conclusión

Para aprender cómo funciona realmente un pipeline de despliegue:

```txt
GitHub Pages + GitHub Actions
```

Para publicar rápido y sin preocuparse de la configuración:

```txt
Vercel
```
