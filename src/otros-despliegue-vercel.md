# Despliegue Vercel + GitHub

## Objetivo

Publicar una aplicación Vue + Vite en Vercel y configurar despliegue automático cada vez que se realice un `git push`.

---

## ¿Qué es Vercel?

Vercel es una plataforma de hosting moderna enfocada en aplicaciones frontend.

Permite conectar un repositorio GitHub y desplegar automáticamente cada vez que se actualiza el proyecto.

```txt
Desarrollador
      ↓
git push
      ↓
GitHub
      ↓
Vercel
      ↓
npm install
npm run build
      ↓
Sitio actualizado
````

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

## 2. Verificar el build

Antes de publicar:

```bash
npm run build
```

Si todo funciona correctamente se generará:

```txt
dist/
```

---

## 3. Crear repositorio en GitHub

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

Conectar repositorio:

```bash
git branch -M main
git remote add origin URL_REPOSITORIO
git push -u origin main
```

---

## 4. Crear cuenta en Vercel

Ingresar a:

```txt
https://vercel.com
```

Iniciar sesión utilizando GitHub.

---

## 5. Importar el proyecto

En el panel principal:

```txt
Add New
→ Project
```

Seleccionar el repositorio recién creado.

---

## 6. Configuración automática

Vercel detectará Vue + Vite automáticamente.

Normalmente mostrará:

```txt
Framework Preset:
Vite
```

Configuración esperada:

```txt
Build Command:
npm run build

Output Directory:
dist

Install Command:
npm install
```

Generalmente no es necesario modificar nada.

---

## 7. Deploy

Presionar:

```txt
Deploy
```

Vercel comenzará a:

```txt
✓ Clonar repositorio
✓ Instalar dependencias
✓ Ejecutar build
✓ Publicar aplicación
```

Después de unos segundos aparecerá una URL similar a:

```txt
https://mi-proyecto.vercel.app
```

---

## 8. Actualizaciones automáticas

Cada vez que realices cambios:

```bash
git add .
git commit -m "nueva funcionalidad"
git push
```

Vercel automáticamente:

```txt
✓ Descarga cambios
✓ Instala dependencias
✓ Ejecuta build
✓ Publica nueva versión
```

No es necesario volver a entrar al panel.

---

## 9. Ver historial de despliegues

Dentro de Vercel:

```txt
Project
→ Deployments
```

Podrás ver:

```txt
Fecha
Autor
Commit
Estado
URL
```

Incluso es posible volver a una versión anterior.

---

## Variables de entorno (.env)

Si utilizas:

```env
VITE_API_KEY=123456
```

No debes subir el archivo `.env`.

Agregar a:

```txt
.gitignore
```

```txt
.env
```

Luego configurar la variable en:

```txt
Project Settings
→ Environment Variables
```

Ejemplo:

```txt
VITE_API_KEY = 123456
```

---

## Dominio personalizado (opcional)

Vercel permite conectar dominios propios.

Ejemplo:

```txt
www.midominio.cl
```

Desde:

```txt
Project Settings
→ Domains
```

---

## Estructura mínima

```txt
proyecto/
│
├── src/
├── public/
├── package.json
├── vite.config.js
└── README.md
```

No es necesario crear workflows ni archivos especiales.

---

## Ventajas

* Configuración muy simple
* Deploy automático
* HTTPS incluido
* Dominio gratuito
* Historial de despliegues
* Compatible con Vue, React, Angular, Nuxt y Next

---

## Comparación rápida

| Característica          | GitHub Pages         | Vercel     |
| ----------------------- | -------------------- | ---------- |
| Gratis                  | ✅                    | ✅          |
| Configuración inicial   | Media                | Muy simple |
| GitHub Actions          | Necesario para CI/CD | No         |
| Deploy automático       | ✅                    | ✅          |
| Variables de entorno    | Más complejo         | Muy simple |
| Dominios personalizados | ✅                    | ✅          |
| Facilidad de uso        | ⭐⭐⭐                  | ⭐⭐⭐⭐⭐      |

### Conclusión

Si quieres aprender CI/CD:

```txt
GitHub Pages + GitHub Actions
```

Si quieres desplegar proyectos Vue de forma rápida y profesional:

```txt
GitHub + Vercel
```

Es actualmente la opción más utilizada para proyectos frontend modernos.

```
