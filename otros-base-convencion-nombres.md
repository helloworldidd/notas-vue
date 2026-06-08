# Convenciones de nombres en Vue

---

## Índice

- [Guía](#guía)
- [Resumen Convención](#resumen-convención)
<style>*{scroll-behavior: smooth}</style>
---

## Guía
Mantener una convención ayuda a que el proyecto sea más fácil de leer y mantener.

1.  **Componentes en general** usar **PascalCase**:
    - En carpetas: `UserCard.vue` `ProductList.vue` `AppHeader.vue`
    - En template: `<UserCard />` `<ProductList />`

    <br>

1.  **Views**: Las páginas suelen terminar en **View**.

    `HomeView.vue` `AboutView.vue` `ProductsView.vue` `LoginView.vue`

    <br>

1.  **Stores (Pinia)**
    `userStore.js` `productStore.js` `authStore.js`
    Ejemplo:

    ```js
    export const useUserStore = defineStore("user", {});
    ```

    <br>

1.  **Servicios / APIs** Se suele usar el sufijo `Api`
    `userApi.js` `authApi.js` `productApi.js
    Ejemplo:

    ```js
    export const getProducts = async () => {
    ...
    }
    ```

    <br>

1.  **Composables** Siempre comienzan con `use`.
    `useAuth.js` `useDarkMode.js` `useProducts.js`
    Ejemplo:

    ```js
    const { login } = useAuth();
    ```

    <br>

1.  **Assets**
    Imágenes: `logo.png` `hero-banner.jpg` `user-avatar.webp`
    Iconos: `icon-search.svg` `icon-user.svg` `icon-cart.svg`

    <br>
1. **Carpetas** Generalmente se usan nombres en minúscula.
    ```txt
    components/
    views/
    stores/
    router/
    assets/
    composables/
    services/
    ```

    <br>
1. **Variables JavaScript** Se utiliza **camelCase**.
    ```js
    const userName = "Patricio";
    const totalPrice = 1000;
    const isLogged = true;
    ```

    <br>
1. **Constantes** Opcionalmente pueden ir en mayúsculas.

    ```js
    const API_URL = "https://api.com";
    const MAX_USERS = 100;
    ```

    <br>
1. **Eventos personalizados (emit)** Normalmente se usan en kebab-case.

    ```js
    emit("add-product");
    emit("remove-user");
    emit("login-success");
    ```

    En el padre:
    ```vue
    <UserForm @login-success="onLogin" />
    ```

---

## Resumen Convención


| Elemento     | Convención        | Ejemplo         |
| ------------ | ----------------- | --------------- |
| Componentes  | PascalCase        | `UserCard.vue`  |
| Views        | PascalCase + View | `HomeView.vue`  |
| Stores       | camelCase + Store | `userStore.js`  |
| APIs         | camelCase + Api   | `productApi.js` |
| Composables  | use + PascalCase  | `useAuth.js`    |
| Carpetas     | minúsculas        | `components/`   |
| Variables    | camelCase         | `userName`      |
| Constantes   | MAYÚSCULAS        | `API_URL`       |
| Eventos emit | kebab-case        | `login-success` |

En proyectos Vue modernos:

```txt
src/
│
├── components/
│   ├── AppHeader.vue
│   ├── UserCard.vue
│   └── ProductList.vue
│
├── views/
│   ├── HomeView.vue
│   └── ProductsView.vue
│
├── stores/
│   ├── userStore.js
│   └── productStore.js
│
├── composables/
│   ├── useAuth.js
│   └── useProducts.js
│
├── services/
│   ├── authApi.js
│   └── productApi.js
│
├── router/
│   └── index.js
│
├── App.vue
└── main.js
```

