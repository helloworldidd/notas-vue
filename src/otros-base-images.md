# Imágenes en Vue

---

##  Indice

- [¿Dónde van las imágenes?](#dónde-van-las-imágenes)
- [Ejemplo con JSON](#ejemplo-con-json)
- [Optimizar imágenes](#optimizar-imágenes)


---
## ¿Dónde van las imágenes? 

1. Resumen
    - Si viene desde JSON/API ➡️ public/
    - Si importas en componente ➡️ src/assets/


1. Casos
    | Caso | Lugar |
    |---|---|
    | Imágenes importadas en un componente | `src/assets/` |
    | Logos de la UI | `src/assets/` |
    | Archivos públicos dinámicos | `public/` |
    | Imágenes usadas desde JSON/API | `public/` |


    <br>

1. **`src/assets/`**
    Se usa para imágenes que se importan directamente dentro de un componente.

    Ejemplo:

    ```vue
    <script setup>
    import logo from '@/assets/logo.png';
    </script>

    <template>
      <img :src="logo" alt="Logo">
    </template>
    ```

    **Ideal para**: logos, iconos propios, imágenes de interfaz, elementos visuales del diseño



    <br>


1. **`public/`**

    Se usa para imágenes que necesitas llamar por ruta directa.

    Ejemplo:

    ```html
    <img src="/img/pastel-chocolate.webp" alt="Pastel de chocolate">
    ```

    **Ideal para**: imágenes que vienen desde JSON, imágenes de productos, imágenes de una API, archivos públicos, fotos dinámicas







---
## Ejemplo con JSON

Archivo:

1. src/data/**productos.json**

    ```json
    [
      {
        "id": 1,
        "nombre": "Pastel de chocolate",
        "imagen": "/img/pastel-chocolate.webp"
      }
    ]
    ```

1. src/components/**Demo.vue**

    ```vue
    <script setup>
    import productos from "../data/productos.json";
    </script>

    <template>
      <div
        v-for="producto in productos"
        :key="producto.id"
      >
        <img
          :src="producto.imagen"
          :alt="producto.nombre"
        >

        <h2>
          {{ producto.nombre }}
        </h2>
      </div>
    </template>
    ```












---


## Optimizar imágenes


    ¿Qué hace este script?

    - Lee imágenes desde src/assets/img-originales/
    - Acepta .jpg, .jpeg y .png
    - Las reduce a máximo 1200px de ancho
    - No agranda imágenes pequeñas
    - Las convierte a .webp
    - Las guarda en public/img/


1. **Instalar Sharp** `npm install --save-dev --include=optional sharp`
1. **Carpetas** recomendadas
    - Las imágenes originales van en: `src/assets/img-originales/`
    - Las imágenes optimizadas quedan en: `public/img/`

1. **package.json** agregar Script para ejecuttar
    ```json
    {
      "scripts": {
        "optimize": "node optimize.js"
      }
    }
    ```
1. **optimize.js** en raiz

    ```js
    import sharp from 'sharp';
    import fs from 'fs';
    import path from 'path';

    const inputDir = './src/assets/img-originales';
    const outputDir = './public/img';

    if (!fs.existsSync(outputDir)) {
      fs.mkdirSync(outputDir, { recursive: true });
    }

    const formatosPermitidos = ['.jpg', '.jpeg', '.png'];

    const archivos = fs.readdirSync(inputDir);

    archivos.forEach(async (archivo) => {
      const extension = path.extname(archivo).toLowerCase();

      if (!formatosPermitidos.includes(extension)) {
        return;
      }

      const nombre = path.basename(archivo, extension);

      await sharp(path.join(inputDir, archivo))
        .resize({
          width: 1200,
          withoutEnlargement: true,
        })
        .webp({
          quality: 80,
        })
        .toFile(path.join(outputDir, `${nombre}.webp`));

      console.log(`Optimizada: ${archivo} → ${nombre}.webp`);
    });
    ```

1. **Ejecutar optimización** `npm run optimize` o `node optimize.js`

