# Despliegue


<br>

---

## Índice

- [Deployment](#deployment)
    + [El proceso](#el-proceso)
    + [Tipos](#Tipos)
        + [Sitios estáticos](#sitios-estáticos)
        + [Aplicaciones Frontend](#aplicaciones-frontend)
        + [Aplicaciones Backend](#aplicaciones-backend)
        + [Aplicaciones Full Stack](#aplicaciones-full-stack)
        + [CMS](#cms)
- [Plataformas](#plataformas)
    + [Tabla de plataformas](#tabla-de-plataformas)
    + [Comparación rápida](#comparación-rápida)
    + [Ejemplos reales](#ejemplos-reales)
    + [Proceso mas facil](#proceso-mas-facil)
- [Tips GitHub](#tips-gitHub)



<br>

---

## Deployment

> El despliegue es el proceso de publicar una aplicación o sitio web para que pueda ser accesible por otras personas a través de internet.

<br>
<br>

### El proceso

> Durante el desarrollo, una aplicación funciona de manera local en el computador del desarrollador.

Por ejemplo:

```txt
http://localhost:5173
```

Sin embargo, otras personas no pueden acceder a esa dirección.

Para que el proyecto esté disponible públicamente, debe ser desplegado en un servidor o plataforma de hosting.

Ejemplo:

```txt
Computador del desarrollador
        ↓
      Build
        ↓
Servidor / Hosting
        ↓
Internet
        ↓
Usuarios
```





<br>

<br>
<br>
<br>

### Tipos

Existen distintas formas de desplegar una aplicación dependiendo de la tecnología utilizada.


<br>

#### Sitios estáticos

Son aplicaciones compuestas principalmente por:

* HTML
* CSS
* JavaScript

No requieren un servidor propio para ejecutarse.

Ejemplos:

* Landing pages
* Portafolios
* Sitios corporativos
* Aplicaciones Vue o React compiladas

Plataformas comunes:

* GitHub Pages
* Netlify
* Vercel
* Cloudflare Pages




<br>
<br>

#### Aplicaciones Frontend

Corresponden a proyectos desarrollados con frameworks modernos como:

* Vue
* React
* Angular
* Svelte

Generalmente se compilan para generar archivos estáticos antes de ser publicados.

Plataformas comunes:

* Vercel
* Netlify
* Cloudflare Pages


<br>
<br>

#### Aplicaciones Backend

Son aplicaciones que ejecutan lógica de negocio en un servidor.

Ejemplos:

* APIs REST
* Autenticación
* Gestión de usuarios
* Procesamiento de datos

Tecnologías comunes:

* Node.js
* Express
* PHP
* Laravel
* Django
* Spring Boot
* .NET

Plataformas comunes:

* Railway
* Render
* Fly.io
* Heroku






<br>
<br>

#### Aplicaciones Full Stack

Combinan frontend, backend y base de datos.

Ejemplo:

```txt
Vue
  ↓
API Express
  ↓
PostgreSQL
```

Plataformas comunes:

* Railway
* Render
* Firebase
* Supabase
* Vercel + Supabase



<br>
<br>

#### CMS

> Content Management System
> Permiten crear y administrar sitios web sin desarrollar toda la aplicación desde cero.

Ejemplos:

* WordPress
* Webflow
* Wix

Normalmente se despliegan en:

* Hosting compartido
* VPS
* WordPress Hosting
* Cloud Hosting




















<!-- 

<br><br>
<br><br>
<br><br>

### Servicios

Durante un despliegue moderno pueden participar varios servicios:

```txt
Repositorio
└─ GitHub

Frontend
└─ Vercel

Backend
└─ Railway

Base de Datos
└─ PostgreSQL

Dominio
└─ midominio.com
```

 -->


















<br>
<br>
<br>
<br>
<br>
<br>

---

## Plataformas



<br>
<br>


### Tabla de plataformas

| Plataforma | Tipo | Ideal para | Tecnologías comunes | Base de datos incluida | Plan gratuito | Dificultad |
|------------|--------|------------|---------------------|----------------------|----------------|------------|
| GitHub Pages | Frontend | Portafolios y sitios estáticos | HTML, CSS, JS, Vite | ❌ | ✅ | ⭐ |
| Netlify | Frontend | Sitios web y SPA | Vue, React, Angular, Vite | ❌ | ✅ | ⭐ |
| Vercel | Frontend / Full Stack | Aplicaciones modernas | Vue, React, Next.js, Nuxt | ❌ | ✅ | ⭐ |
| Cloudflare Pages | Frontend | Sitios estáticos y SPA | Vue, React, Astro, Vite | ❌ | ✅ | ⭐ |
| Firebase Hosting | Frontend | Aplicaciones conectadas a Firebase | Vue, React, Angular | Firestore | ✅ | ⭐⭐ |
| Railway | Backend / Full Stack | APIs y aplicaciones completas | Node.js, Express, NestJS | PostgreSQL, MySQL | ✅ | ⭐⭐ |
| Render | Backend / Full Stack | APIs y servicios web | Node.js, Python, PHP | PostgreSQL | ✅ | ⭐⭐ |
| Fly.io | Backend | Aplicaciones distribuidas | Node.js, Go, Python | ❌ | ✅ | ⭐⭐⭐ |
| Heroku | Backend | APIs y aplicaciones web | Node.js, Java, Python | Complementos | ⚠️ Limitado | ⭐⭐ |
| Supabase | Backend as a Service | Aplicaciones con autenticación y datos | Vue, React, Angular | PostgreSQL | ✅ | ⭐⭐ |
| WordPress Hosting | CMS | Blogs y sitios corporativos | WordPress | MySQL | Depende | ⭐ |
| Wix | CMS | Sitios sin programación | Constructor visual | Interna | ✅ | ⭐ |
| Webflow | CMS | Sitios visuales profesionales | Constructor visual | Interna | ⚠️ Limitado | ⭐⭐ |

<br>
<br>

### Comparación rápida

| Necesidad                       | Plataforma recomendada |
| ------------------------------- | ---------------------- |
| Portafolio HTML/CSS/JS          | GitHub Pages           |
| Proyecto Vue 3                  | Vercel o Netlify       |
| Proyecto React                  | Vercel                 |
| Proyecto Nuxt                   | Vercel                 |
| API Node.js                     | Railway o Render       |
| Base de datos PostgreSQL        | Supabase o Railway     |
| Firebase completo               | Firebase Hosting       |
| Sitio WordPress                 | Hosting WordPress      |
| Sitio sin programar             | Wix o Webflow          |
| Proyecto Full Stack             | Vercel + Supabase      |
| Proyecto Full Stack con Express | Railway + PostgreSQL   |



<br>
<br>

### Ejemplos reales

<br>

**Portafolio Frontend**
**Flujo**: GitHub ➡️ Vercel ➡️ Internet
**Tecnologías**: HTML, CSS, JavaScript, Vue 3

<br>

**Aplicación Full Stack**
- **flujo**: Vue➡️Express➡️PostgreSQL
- **Despliegue**:
    - Frontend ➡️ Vercel
    - Backend ➡️ Railway
    - Base de Datos ➡️ PostgreSQL


<br>

**Aplicación con Firebase**
- **flujo** Vue➡️Firebase Auth➡️Firestore
- **Despliegue**:
    - Frontend ➡️ Firebase Hosting
    - Backend ➡️ Firebase Functions
    - Base de Datos ➡️ Firestore


<br>
<br>

### Proceso mas facil

- **Repositorio** → GitHub
- **Frontend** → Vercel
- **Backend** → Firebase o Supabase
- **Base de Datos** → Firestore o PostgreSQL
































<br>
<br>
<br>
<br>
<br>
<br>

---

## Tips GitHub

<br>

- [ ] Nombres claros de repositorios

    por ejemplo:
    - proyecto-clima
    - todo-app-vue
    - portafolio-personal

    Evitar nombres como:
    - prueba
    - test123
    - nuevo-proyecto
    
<br>

- [ ] README claro

    incluir:
    - nombre del proyecto
    - descripción
    - tecnologías utilizadas
    - cómo ejecutar el proyecto
    - capturas o demo

<br>

- [ ] Usar topics o etiquetas
    Las etiquetas permiten que
    sea más fácil:
    - vue
    - javascript
    - frontend
    - api
    - portfolio

<br>

- [ ] Código limpio y estructura ordenada

    mostrar:
    - estructura clara
    - código organizado
    - nombres comprensibles


## ★
