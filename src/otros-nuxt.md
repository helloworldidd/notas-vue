# Nuxt: Página estándar con componentes

> Nuxt es un framework basado en Vue que permite crear aplicaciones web modernas usando una estructura ordenada de carpetas, rutas automáticas, componentes y archivos reutilizables.

En este ejemplo crearemos una página estándar con:

```txt
Header
Hero
Contenido principal
Footer
```















<br>
<br>
<br>
<br>
<br>
<br>

---

## 1. Crear proyecto

```bash
npm create nuxt@latest mi-pagina-nuxt
```

Entrar al proyecto:

```bash
cd mi-pagina-nuxt
```

Instalar dependencias:

```bash
npm install
```

Levantar servidor:

```bash
npm run dev
```

Abrir:

```txt
http://localhost:3000
```















<br>
<br>
<br>
<br>
<br>
<br>

---

## 2. Estructura del proyecto

Crearemos esta estructura:

```txt
mi-pagina-nuxt/
├── app/
│   ├── app.vue
│   ├── pages/
│   │   └── index.vue
│   └── components/
│       ├── AppHeader.vue
│       ├── HeroSection.vue
│       └── AppFooter.vue
│
├── nuxt.config.ts
└── package.json
```















<br>
<br>
<br>
<br>
<br>
<br>

---

## 3. Archivo principal `app.vue`

Ruta:

```txt
app/app.vue
```

Código:

```vue
<template>
  <div>
    <AppHeader />

    <NuxtPage />

    <AppFooter />
  </div>
</template>
```

`app.vue` funciona como la base general de la aplicación.

Aquí colocamos elementos que se repiten en todas las páginas, por ejemplo:

```txt
Header
Footer
Menú
Layout general
```

`<NuxtPage />` es el espacio donde Nuxt muestra la página actual.

















<br>
<br>
<br>
<br>
<br>
<br>

---

## 4. Crear el Header

Ruta:

```txt
app/components/AppHeader.vue
```

Código:

```vue
<template>
  <header class="header">
    <h1>Mi sitio Nuxt</h1>

    <nav>
      <a href="#">Inicio</a>
      <a href="#">Servicios</a>
      <a href="#">Contacto</a>
    </nav>
  </header>
</template>

<style scoped>
.header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 24px;
  border-bottom: 1px solid #ddd;
}

nav {
  display: flex;
  gap: 16px;
}

a {
  color: #00a67d;
  text-decoration: none;
}
</style>
```

Este componente representa la parte superior de la página.

Nuxt importa automáticamente los componentes dentro de la carpeta `components`, por eso podemos usar:

```vue
<AppHeader />
```

sin escribir `import AppHeader from ...`.

















<br>
<br>
<br>
<br>
<br>
<br>

---

## 5. Crear el Hero

Ruta:

```txt
app/components/HeroSection.vue
```

Código:

```vue
<template>
  <section class="hero">
    <p class="tag">Desarrollo Web</p>

    <h2>Hello Nuxt 🚀</h2>

    <p>
      Esta es una página estándar creada con Nuxt, Vue y componentes reutilizables.
    </p>

    <button>Conocer más</button>
  </section>
</template>

<style scoped>
.hero {
  padding: 80px 24px;
  text-align: center;
  background: #f5f5f5;
}

.tag {
  color: #00a67d;
  font-weight: bold;
}

h2 {
  font-size: 48px;
  margin: 16px 0;
}

button {
  margin-top: 24px;
  padding: 12px 20px;
  border: none;
  background: #00a67d;
  color: white;
  cursor: pointer;
}
</style>
```

El componente `HeroSection` será la sección principal visible al entrar al sitio.

















<br>
<br>
<br>
<br>
<br>
<br>

---

## 6. Crear el Footer

Ruta:

```txt
app/components/AppFooter.vue
```

Código:

```vue
<template>
  <footer class="footer">
    <p>© 2026 - Mi sitio Nuxt</p>
  </footer>
</template>

<style scoped>
.footer {
  padding: 24px;
  text-align: center;
  border-top: 1px solid #ddd;
  color: #666;
}
</style>
```















<br>
<br>
<br>
<br>
<br>
<br>

---

## 7. Crear la página principal

Ruta:

```txt
app/pages/index.vue
```

Código:

```vue
<template>
  <main>
    <HeroSection />

    <section class="content">
      <h2>Servicios</h2>

      <div class="grid">
        <article>
          <h3>Diseño UI</h3>
          <p>Creación de interfaces claras, modernas y fáciles de usar.</p>
        </article>

        <article>
          <h3>Desarrollo Frontend</h3>
          <p>Construcción de sitios usando Vue, Nuxt, HTML, CSS y JavaScript.</p>
        </article>

        <article>
          <h3>Optimización Web</h3>
          <p>Mejoras de estructura, rendimiento y experiencia de usuario.</p>
        </article>
      </div>
    </section>
  </main>
</template>

<style scoped>
.content {
  max-width: 1000px;
  margin: 0 auto;
  padding: 64px 24px;
}

.grid {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 24px;
}

article {
  padding: 24px;
  border: 1px solid #ddd;
}
</style>
```

Esta es una página estándar.

Tiene:

```txt
Hero
Título
Sección de servicios
Tarjetas de contenido
```















<br>
<br>
<br>
<br>
<br>
<br>

---

## 8. Interacción entre archivos

En Nuxt los archivos se relacionan de forma automática por la estructura de carpetas.

```txt
app.vue
  usa NuxtPage

pages/index.vue
  se muestra dentro de NuxtPage

components/AppHeader.vue
  se usa como <AppHeader />

components/HeroSection.vue
  se usa como <HeroSection />

components/AppFooter.vue
  se usa como <AppFooter />
```















<br>
<br>
<br>
<br>
<br>
<br>

---

## 9. ¿Qué se exporta?

En componentes Vue con `<script setup>`, normalmente no escribimos:

```js
export default {}
```

Antes en Vue se usaba mucho:

```vue
<script>
export default {
  name: 'AppHeader'
}
</script>
```

Pero en Vue 3 y Nuxt moderno usamos:

```vue
<script setup>
</script>
```

Esto simplifica el código.

El componente se exporta automáticamente.

Por eso este archivo:

```txt
components/AppHeader.vue
```

puede usarse directamente así:

```vue
<AppHeader />
```















<br>
<br>
<br>
<br>
<br>
<br>

---

## 10. ¿Qué se importa?

En Vue normal muchas veces haríamos esto:

```vue
<script setup>
import AppHeader from './components/AppHeader.vue'
import AppFooter from './components/AppFooter.vue'
</script>
```

Pero en Nuxt no es necesario para componentes dentro de:

```txt
app/components/
```

Nuxt los autoimporta.

Por eso en `app.vue` podemos escribir:

```vue
<template>
  <div>
    <AppHeader />
    <NuxtPage />
    <AppFooter />
  </div>
</template>
```

sin importar manualmente.

















<br>
<br>
<br>
<br>
<br>
<br>

---

## 11. Flujo de funcionamiento

Cuando entras a:

```txt
http://localhost:3000
```

Nuxt busca la página:

```txt
app/pages/index.vue
```

Luego la muestra dentro de:

```vue
<NuxtPage />
```

que está en:

```txt
app/app.vue
```

El flujo queda así:

```txt
URL /
  ↓
app/pages/index.vue
  ↓
<NuxtPage />
  ↓
app/app.vue
  ↓
Pantalla final
```















<br>
<br>
<br>
<br>
<br>
<br>

---

## 12. Resultado final

El navegador mostrará una página con:

```txt
Mi sitio Nuxt
Inicio Servicios Contacto

Hello Nuxt 🚀
Esta es una página estándar creada con Nuxt...

Servicios
Diseño UI
Desarrollo Frontend
Optimización Web

© 2026 - Mi sitio Nuxt
```















<br>
<br>
<br>
<br>
<br>
<br>

---

## 13. Resumen

En este ejemplo aprendimos que:

- `app.vue` contiene la estructura general.
- `pages/index.vue` crea la ruta `/`.
- `<NuxtPage />` muestra la página actual.
- `components/` guarda partes reutilizables.
- Nuxt autoimporta los componentes.
- En `<script setup>` no se usa `export default`.
- La página se arma conectando componentes.

En resumen:

```txt
app.vue organiza.
pages define rutas.
components divide la interfaz.
Nuxt conecta todo automáticamente.
```