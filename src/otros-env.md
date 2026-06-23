# Variables de Entorno
---


## env


<br>
<br>
<br>

### ¿Qué son?

Las variables de entorno permiten almacenar configuraciones fuera del código de la aplicación.


Ejemplos:

* URL de una API
* Nombre de la aplicación
* Configuraciones para desarrollo y producción

<br>
<br>
<br>

### Crear un archivo `.env`

En la raíz del proyecto:

```txt
mi-proyecto/
├── src/
├── public/
├── .env
├── package.json
└── vite.config.js
```

Contenido:

```env
VITE_SALUDO=Hola desde una variable de entorno 🚀
```

<br>
<br>

### Leer una variable

```vue
<script setup>
const saludo = import.meta.env.VITE_SALUDO
</script>

<template>
  <h1>{{ saludo }}</h1>
</template>
```

Resultado:

```txt
Hola desde una variable de entorno 🚀
```

<br>
<br>


### Prefijo `VITE_`

Para que Vue pueda acceder a una variable de entorno, esta debe comenzar con:

```env
VITE_
```

Ejemplo:

```env
VITE_API_URL=https://api.com
VITE_APP_NAME=Mi Aplicación
```

<br>
<br>

### Reiniciar Vite

Cada vez que se crea o modifica un archivo `.env` es necesario reiniciar el proyecto.

```bash
npm run dev
```

<br>
<br>

### Git y `.env`

Normalmente el archivo `.env` no se sube a GitHub.

`.gitignore`

```gitignore
.env
```

<br>
<br>

### Archivo `.env.example`

Se utiliza para indicar qué variables necesita el proyecto.

`.env.example`

```env
VITE_SALUDO=
VITE_API_URL=
```

Este archivo sí se sube a GitHub.





<br>
<br>

### .gitignore

agregar para no expopner en repo las variables

```
.env
.env.local
.env.*.local
```










<br>
<br>
<br>
<br>
<br>
<br>

---

## En Vercel

Ingresar a:

```txt
Project
→ Settings
→ Environment Variables
```

Agregar:

```txt
Name:
VITE_SALUDO

Value:
Hola desde Vercel 🚀
```

Guardar y realizar un nuevo despliegue.

```txt
Deployments
→ Redeploy
```

o hacer un nuevo push a GitHub.














<br>
<br>
<br>
<br>
<br>
<br>

---

## En GitHub Pages + GitHub Actions

Ingresar a:

```txt
Repositorio
→ Settings
→ Secrets and variables
→ Actions
→ Variables
```

Agregar:

```txt
Name:
VITE_SALUDO

Value:
Hola desde GitHub Pages 🚀
```

Guardar

<br>
<br>
<br>

**Configurar el workflow**

<br>
<br>

Crear archivo ->  **.github/workflows/deploy.yml** con 

**env:**
**VITE_SALUDO: ${{ vars.VITE_SALUDO }}**

```yml
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
        env:
          VITE_SALUDO: ${{ vars.VITE_SALUDO }}
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

o  Agregar la variable en el paso de build:

```yaml
- name: Build
  run: npm run build
  env:
    VITE_SALUDO: ${{ vars.VITE_SALUDO }}
```




