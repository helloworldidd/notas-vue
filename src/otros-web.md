# Estrategias de Renderizado

>En Nuxt, Next.js y otros frameworks modernos aparecen mucho estos conceptos:

| Sigla | Nombre                          | ¿Cuándo se genera el HTML?         |
| ----- | ------------------------------- | ---------------------------------- |
| SSR   | Server Side Rendering           | En cada petición                   |
| SSG   | Static Site Generation          | Durante el build                   |
| CSR   | Client Side Rendering           | En el navegador                    |
| ISR   | Incremental Static Regeneration | Estático, pero se regenera después |


















<br>
<br>
<br>
<br>
<br>
<br>

---

## SSR (Server Side Rendering)

El servidor genera el HTML cada vez que alguien visita la página.

```txt
Usuario
   ↓
Servidor Nuxt
   ↓
Genera HTML
   ↓
Entrega HTML
```

Ejemplo:

```vue
<script setup>
const { data } = await useFetch('/api/products')
</script>
```

Cada visita consulta nuevamente los datos.

### Ventajas

✅ SEO excelente

✅ Datos siempre actualizados

✅ Mejor para e-commerce

### Desventajas

❌ Más carga al servidor

❌ Puede ser más lento


















<br>
<br>
<br>
<br>
<br>
<br>

---

## SSG (Static Site Generation)

Las páginas se generan una sola vez cuando haces:

```bash
npm run build
```

Nuxt crea archivos HTML estáticos.

```txt
about.html
contacto.html
productos.html
```

Luego el servidor simplemente entrega esos archivos.

```txt
Usuario
   ↓
HTML ya generado
   ↓
Se muestra inmediatamente
```

### Ventajas

✅ Muy rápido

✅ Barato de alojar

✅ Excelente SEO

### Desventajas

❌ Los datos no cambian hasta un nuevo build

---

### Ejemplo ideal de SSG

```txt
Inicio
Nosotros
Contacto
Blog
Landing page
Portafolio
```

Contenido que cambia poco.


















<br>
<br>
<br>
<br>
<br>
<br>

---

## CSR (Client Side Rendering)

Es el comportamiento clásico de Vue.

El servidor envía casi una página vacía:

```html
<div id="app"></div>
```

Luego JavaScript construye toda la interfaz.

```txt
Usuario
   ↓
HTML vacío
   ↓
Carga JS
   ↓
Vue renderiza
```

### Ventajas

✅ Muy interactivo

✅ Menos trabajo en el servidor

### Desventajas

❌ SEO peor

❌ Primera carga más lenta


















<br>
<br>
<br>
<br>
<br>
<br>

---

## ISR (Incremental Static Regeneration)

Mezcla SSR y SSG.

La página se genera estáticamente pero se puede regenerar después.

```txt
Build
 ↓
Página estática
 ↓
10 minutos después
 ↓
Nuxt la vuelve a generar
```

Ideal para:

```txt
Blogs
Noticias
Catálogos
Documentación
```


















<br>
<br>
<br>
<br>
<br>
<br>

---

## Comparación rápida

| Característica     | CSR  | SSR   | SSG      |
| ------------------ | ---- | ----- | -------- |
| SEO                | 😐   | ✅     | ✅        |
| Velocidad inicial  | 😐   | ✅     | 🚀       |
| Datos actualizados | ✅    | ✅     | ❌        |
| Carga servidor     | Baja | Alta  | Muy baja |
| Complejidad        | Baja | Media | Baja     |


















<br>
<br>
<br>
<br>
<br>
<br>

---

## ¿Qué usa Nuxt por defecto?

Nuxt usa **SSR** por defecto.

```bash
npm run dev
```

La aplicación se renderiza en el servidor.

Si quieres generar un sitio estático:

```bash
npm run generate
```

Obtienes una aplicación **SSG**.





<br>
<br>
<br>
<br>
<br>
<br>

---

## Regla simple para recordar

```txt
CSR = Vue tradicional

SSR = HTML generado en cada visita

SSG = HTML generado durante el build

ISR = HTML estático que se regenera después
```

Por eso Nuxt se hizo tan popular: te permite usar Vue y elegir si una página será SSR, SSG o incluso CSR según lo que necesites.
