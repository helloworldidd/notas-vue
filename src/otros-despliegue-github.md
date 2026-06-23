# GitHub Pages sin Integración Continua (CI/CD)

## Objetivo

Publicar una aplicación Vue + Vite en GitHub Pages realizando el proceso de compilación manualmente, sin utilizar GitHub Actions.

---

## ¿Qué significa sin CI/CD?

En este enfoque, GitHub no ejecuta automáticamente el proceso de build.

El desarrollador debe generar manualmente la versión final de la aplicación y luego subirla al repositorio.

```txt
Desarrollador
      ↓
npm run build
      ↓
dist/
      ↓
GitHub Pages
      ↓
Sitio publicado
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

Ejecutar localmente:

```bash
npm run dev
```

---

## 2. Configurar Vite

Editar:

```txt
vite.config.js
```

Agregar el nombre del repositorio:

```javascript
import { defineConfig } from 'vite'
import vue from '@vitejs/plugin-vue'

export default defineConfig({
  plugins: [vue],
  base: '/mi-proyecto/'
})
```

Donde:

```txt
mi-proyecto
```

corresponde al nombre del repositorio de GitHub.

---

## 3. Generar el build

Ejecutar:

```bash
npm run build
```

Se generará una carpeta:

```txt
dist/
```

Esta carpeta contiene la versión lista para producción.

---

## 4. Crear repositorio en GitHub

Inicializar Git:

```bash
git init
git add .
git commit -m "primer commit"
```

Conectar con GitHub:

```bash
git branch -M main
git remote add origin URL_REPOSITORIO
git push -u origin main
```

---

## 5. Publicar la carpeta dist

Instalar la herramienta:

```bash
npm install -D gh-pages
```

Agregar un script en:

```json
{
  "scripts": {
    "dev": "vite",
    "build": "vite build",
    "deploy": "gh-pages -d dist"
  }
}
```

---

## 6. Desplegar

Generar el build:

```bash
npm run build
```

Publicar:

```bash
npm run deploy
```

Se creará automáticamente una rama:

```txt
gh-pages
```

---

## 7. Activar GitHub Pages

Ir al repositorio:

```txt
Settings
→ Pages
```

Seleccionar:

```txt
Deploy from a branch
```

Luego:

```txt
Branch: gh-pages
Folder: /
```

Guardar.

---

## 8. Acceder al sitio

Después de algunos minutos estará disponible en:

```txt
https://usuario.github.io/mi-proyecto/
```

---

## Actualizaciones

Cada vez que modifiques el proyecto debes ejecutar nuevamente:

```bash
npm run build
npm run deploy
```

GitHub Pages actualizará el sitio con la nueva versión.

---

## Ventajas

* Configuración sencilla
* No requiere GitHub Actions
* Ideal para proyectos pequeños
* Permite comprender el proceso de build

---

## Desventajas

* El despliegue es manual
* Hay que ejecutar build en cada actualización
* No existe automatización

---

## Comparación

| Método                 | Build      | Deploy     |
| ---------------------- | ---------- | ---------- |
| GitHub Pages Manual    | Manual     | Manual     |
| GitHub Pages + Actions | Automático | Automático |
| Vercel                 | Automático | Automático |

### Conclusión

GitHub Pages sin CI/CD es una buena opción para proyectos pequeños o para comprender cómo funciona el proceso de compilación y publicación.

Sin embargo, en proyectos reales suele preferirse GitHub Actions o Vercel para automatizar completamente el despliegue.
