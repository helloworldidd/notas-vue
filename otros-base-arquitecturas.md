# Arquitecturas y Metodologías en Vue

---

## Índice

- [Qué son las arquitecturas](#qué-son-las-arquitecturas)
- [Ejemplos de Arquitecturas](#ejemplos-de-arquitecturas)

---

## Qué son las arquitecturas

Las arquitecturas son formas de organizar el código y los componentes de una aplicación.

Su objetivo es mantener el proyecto ordenado, facilitar el mantenimiento y permitir que otros desarrolladores entiendan rápidamente la estructura del sistema.

No existe una única arquitectura correcta; la elección depende del tamaño y la complejidad del proyecto.

---






## Ejemplos de Arquitecturas

1. **Estructura Simple** (Apps pequeñas): Ideal para proyectos de aprendizaje, prototipos o aplicaciones pequeñas.
    <br>
    
    - **Ventajas**: Fácil de entender, Rápida de implementar, Poca complejidad

    ```txt
    src/
    │
    ├── assets/
    │   ├── images/
    │   └── styles/
    │       └── main.scss
    │
    ├── components/
    │   ├── HeaderComponent.vue
    │   ├── FooterComponent.vue
    │   ├── CardComponent.vue
    │   └── ButtonComponent.vue
    │
    ├── views/
    │   ├── HomeView.vue
    │   └── AboutView.vue
    │
    ├── App.vue
    └── main.js
    ```

1. **Atomic Design** (Muy utilizado): Se basa en dividir la interfaz en componentes reutilizables de distintos niveles.
    <br>
    - **Ventajas**: Alta reutilización de componentes,  Facilita la creación de Design Systems, Mantiene una UI consistente
    <br>

    - **Niveles**

        - **Átomos**: Componentes básicos:
            - Botones
            - Inputs
            - Iconos
            - Imágenes
        <br>

        - **Moléculas**: Combinación de varios átomos.
            - Barra de búsqueda
            - Tarjetas
            - Ítems de navegación
        <br>

        - **Organismos**: Conjunto de moléculas que forman secciones completas.
            - Header
            - Sidebar
            - Listados
        <br>

        - **Templates**: Estructuras de página reutilizables.

            ```txt
            src/
            │
            ├── assets/
            │   ├── images/
            │   └── sass/
            │
            ├── components/
            │   |
            │   ├── atoms/
            │   │   ├── AppButton.vue
            │   │   ├── AppInput.vue
            │   │   ├── AppImage.vue
            │   │   └── AppIcon.vue
            │   │
            │   ├── molecules/
            │   │   ├── SearchBar.vue
            │   │   ├── CardItem.vue
            │   │   └── NavItem.vue
            │   │
            │   ├── organisms/
            │   │   ├── AppHeader.vue
            │   │   ├── ProductList.vue
            │   │   └── Sidebar.vue
            │   │
            │   └── templates/
            │       ├── MainLayout.vue
            │       └── DashboardLayout.vue
            │
            ├── views/
            │   ├── HomeView.vue
            │   └── DashboardView.vue
            │
            ├── App.vue
            └── main.js
            ```

1. **Feature-Based Architecture** (Apps grandes): Organiza el proyecto por funcionalidades (features) en lugar de por tipo de archivo. Es una arquitectura muy utilizada en aplicaciones empresariales y equipos grandes.

    <br>

    - **Ventajas**: Escalable, Modular, Fácil de mantener, Permite trabajar a varios equipos simultáneamente

    ```txt
    src/
    │
    ├── assets/
    │   ├── images/
    │   └── sass/
    │
    ├── features/
    │   │
    │   ├── auth/
    │   │   ├── components/
    │   │   │   ├── LoginForm.vue
    │   │   │   └── RegisterForm.vue
    │   │   │
    │   │   ├── stores/
    │   │   │   └── authStore.js
    │   │   │
    │   │   ├── services/
    │   │   │   └── authApi.js
    │   │   │
    │   │   └── views/
    │   │       └── LoginView.vue
    │   │
    │   ├── products/
    │   │   ├── components/
    │   │   │   ├── ProductCard.vue
    │   │   │   └── ProductList.vue
    │   │   │
    │   │   ├── stores/
    │   │   │   └── productStore.js
    │   │   │
    │   │   ├── services/
    │   │   │   └── productApi.js
    │   │   │
    │   │   └── views/
    │   │       └── ProductsView.vue
    │   │
    │   └── dashboard/
    │       ├── components/
    │       ├── stores/
    │       ├── services/
    │       └── views/
    │
    ├── router/
    │   └── index.js
    │
    ├── App.vue
    └── main.js
    ```
