





---

---

# Preguntas importantes

## ¿Por qué las imágenes del JSON deben ir en public?

Porque el JSON normalmente guarda rutas como texto.

Ejemplo:

```json
{
  "imagen": "/img/pastel.webp"
}
```

Vue no puede hacer `import` automático desde un texto dentro del JSON.

Por eso, para imágenes dinámicas, es más simple usar `public/`.

---

## ¿Qué va en public?

```text
imágenes llamadas por URL
imágenes desde JSON
imágenes desde API
archivos descargables
favicon
robots.txt
```

---

## ¿Qué va en src/assets?

```text
logos
iconos de interfaz
imágenes importadas en componentes
fondos usados en componentes
recursos que Vue procesa al hacer build
```

---


## ¿Puedo guardar imágenes en Vercel?

No como almacenamiento permanente.

Vercel sirve tu proyecto publicado, pero no es una base de datos ni una carpeta para subir imágenes desde usuarios.

Para guardar imágenes de verdad se puede usar:

```text
Supabase
Firebase
Cloudinary
WordPress API
Strapi
Sanity
```

---

## ¿Y si las imágenes están en otro servidor?

También sirve.

Ejemplo:

```json
{
  "imagen": "https://mi-servidor.com/img/pastel.webp"
}
```

En Vue:

```vue
<img :src="producto.imagen" :alt="producto.nombre">
```














---

# Resumen rápido

```text
src/assets/
Para imágenes que importas en componentes.

public/
Para imágenes que usas con rutas directas.

JSON/API
Mejor guardar rutas hacia public o hacia otro servidor.

Sharp
Sirve para optimizar imágenes.

Vercel
Publica tu proyecto, pero no guarda imágenes de usuarios.

Supabase/Firebase/Cloudinary
Sirven para guardar imágenes y datos reales.

Nuxt
Mejor opción cuando necesitas SEO real.
```

































# Imágenes

Regla simple 👀
Si viene desde JSON/API 😎  ->   public/
Si importas en componente 👀  ->  src/assets/



Caso  Lugar
imágenes importadas componente  src/assets
archivos públicos dinámicos public
logos UI  src/assets
imágenes JSON/API public










npm install --save-dev --include=optional sharp


node optimize.js


src/assets/img-originales/
public/img/



{
  script: 
    "optimize": "node optimize.js"
}




optimize.js

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








































## Prettier y ESLint

Prettier: cómo se VE el código
ESLint: calidad y reglas JavaScript





npm install --save-dev eslint @eslint/js eslint-plugin-vue prettier eslint-config-prettier
- eslint
- eslint/js
- eslint-plugin-vue
- prettier
- eslint-config-prettier                                                 






eslint.config.js
import js from '@eslint/js';
import pluginVue from 'eslint-plugin-vue';
import eslintConfigPrettier from 'eslint-config-prettier';
import globals from 'globals';

export default [
  js.configs.recommended,

  ...pluginVue.configs['flat/recommended'],

  eslintConfigPrettier,

  {
    files: ['**/*.{js,vue}'],

    languageOptions: {
      globals: {
        ...globals.browser,
      },
    },

    rules: {
      'no-unused-vars': 'warn',
      'no-console': 'off',
      'vue/multi-word-component-names': 'off',
      'vue/require-default-prop': 'off',
    },
  },
];





.prettierrc
{
  "semi": true,
  "singleQuote": true,
  "tabWidth": 2,
  "printWidth": 100,
  "singleAttributePerLine": true,
  "trailingComma": "es5",
  "bracketSpacing": true,
  "arrowParens": "always",
  "endOfLine": "lf"
}



.prettierignore
node_modules
dist
build







en vsc:
CTRL + SHIFT + P
Preferences: Open Settings (UI)



en package.json:
"scripts": {
  "format": "prettier . --write",
  "format:check": "prettier . --check",
  "lint": "eslint ."
}












































# p72-vue-pasteles





src/
├── data/
│   └── productos.json
├── views/
│   ├── Home.vue
│   ├── ProductoDetalle.vue
│   ├── About.vue
│   └── Contacto.vue
├── components/
│   └── ProductCard.vue
└── router/
    └── index.js




Preferences: Open Settings (UI)

  -- poq debe ir en public
  -- q   va en public
  -- como guradan optimizadamente la img
  -- puedo usar en vercel el guardado de img

-- deploy en github  
-- hacer transaccion
-- gusradadpo de fav
-- plugin whatsaap o chat


Supabase
Firebase
WordPress API
Strapi
Sanity






- practicar
- no es todo junto
- url img en otro server
- guardar peticion


. La solución pro: Nuxt
Para SEO real, lo mejor es usar:
Nuxt
Nuxt permite:
SSR o SSG
y como publico asi com o lo hizo vercel el repo orighinal
















