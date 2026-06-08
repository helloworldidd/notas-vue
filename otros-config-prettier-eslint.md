# Prettier y ESLint







---

## Diferencia simple

```text
Prettier -> cómo se VE el código
ESLint   -> calidad y reglas JavaScript/Vue
```


---

## Instalación

```bash
npm install --save-dev eslint @eslint/js eslint-plugin-vue prettier eslint-config-prettier globals
```

---

## Paquetes instalados

```text
eslint
@eslint/js
eslint-plugin-vue
prettier
eslint-config-prettier
globals
```

---

## eslint.config.js

```js
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
```

---

## .prettierrc

```json
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
```

---

## .prettierignore

```text
node_modules
dist
build
```

---

## Scripts en package.json

```json
{
  "scripts": {
    "format": "prettier . --write",
    "format:check": "prettier . --check",
    "lint": "eslint ."
  }
}
```

---

## Ejecutar Prettier

```bash
npm run format
```

---

## Revisar formato sin cambiar archivos

```bash
npm run format:check
```

---

## Ejecutar ESLint

```bash
npm run lint
```

---

# Configurar VSCode

Abrir configuración:

```text
CTRL + SHIFT + P
Preferences: Open Settings (UI)
```

Buscar:

```text
Format On Save
```

Activar:

```text
Editor: Format On Save
```

También puedes buscar:

```text
Default Formatter
```

Y elegir:

```text
Prettier - Code formatter
```



























































---
## 4. Prettier (formatear code)


```sh
npm install -D prettier
npm install -D prettier eslint-plugin-prettier
```


Ctrl + Shift + P

```
Preferences: Open User Settings (JSON)
```


```json
"editor.formatOnSave": true,


"[html]": {
    "editor.defaultFormatter": "vscode.html-language-features"
},

"[css]": {
    "editor.defaultFormatter": "esbenp.prettier-vscode"
},

"[javascript]": {
    "editor.defaultFormatter": "esbenp.prettier-vscode"
},

"[vue]": {
    "editor.defaultFormatter": "esbenp.prettier-vscode"
},

"editor.formatOnSave": true,
```



---
## 5. EsLint(corregir código)

```sh
npm install -D eslint
```




---





