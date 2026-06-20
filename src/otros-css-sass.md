# SASS


---

## Instalación

```sh
npm install -D sass
```





---

## Código para crear carpetas

```sh
mkdir src/assets/sass/abstracts,

src/assets/sass/base,
src/assets/sass/theme,
src/assets/sass/vendors

ni src/assets/sass/main.scss,
src/assets/sass/abstracts/_variables.scss,
src/assets/sass/abstracts/_mixins.scss,
src/assets/sass/abstracts/_functions.scss,
src/assets/sass/base/_reset.scss,
src/assets/sass/base/_typography.scss,
src/assets/sass/base/_general.scss,
src/assets/sass/theme/_dark.scss,
src/assets/sass/vendors/_bootstrap.scss
src/assets/sass/vendors/_animate.scss
```

estructura 

```sh
src/
├── assets/
│   └── scss/
│       ├── abstracts/
│       │   ├── _variables.scss
│       │   ├── _mixins.scss
│       │   └── _functions.scss
│       │
│       ├── base/
│       │   ├── _reset.scss
│       │   └── _typography.scss
│       │
│       └── main.scss
│
└── components/
    ├── AppButton.vue
    ├── Navbar.vue
    └── Card.vue
```

