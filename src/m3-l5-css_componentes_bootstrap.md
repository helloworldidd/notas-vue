# CSS Componentes de Bootstrap
_Interfaces con Bootstrap_

[INDICE]

## Getting started
Primeros pasos
- **Introduction**: Presenta qué es Bootstrap, para qué sirve y cómo se utiliza en el desarrollo web.
- **Download**: Explica las distintas formas de obtener Bootstrap, como CDN, descarga directa o instalación con npm.
- **Contents**: Describe qué archivos incluye Bootstrap, como CSS, JavaScript, iconos y documentación.
- **Browsers & devices**: Indica qué navegadores y dispositivos son compatibles con Bootstrap.
- **JavaScript**: Explica cómo Bootstrap utiliza JavaScript para agregar interactividad a ciertos componentes.
- **Webpack**: Guía para integrar Bootstrap dentro de proyectos que usan el bundler Webpack.
- **Parcel**: Explica cómo usar Bootstrap en proyectos que utilizan el empaquetador Parcel.
- **Vite**: Muestra cómo integrar Bootstrap en proyectos modernos que usan Vite.
- **Accessibility**: Describe cómo Bootstrap implementa buenas prácticas de accesibilidad para usuarios con distintas capacidades.
- **RFS**: Sistema que ajusta automáticamente el tamaño del texto según el tamaño de la pantalla.
- **RTL**: Soporte para idiomas que se leen de derecha a izquierda, como árabe o hebreo.
- **Contribute**: Explica cómo cualquier persona puede contribuir al desarrollo del proyecto Bootstrap.





## Customize
Personalizar Bootstrap:
- **Overview**: Explica cómo adaptar Bootstrap modificando variables, componentes y configuración del framework.
- **Sass**: Permite personalizar Bootstrap usando Sass para cambiar variables, estilos y generar CSS propio.
- **Options**: Configuraciones que activan o desactivan ciertas características del framework.
- **Color**: Sistema de variables que permite modificar la paleta de colores de Bootstrap.
- **Color modes**: Permite implementar distintos temas de color como modo claro y modo oscuro.
- **Components**: Explica cómo modificar el diseño y comportamiento de los componentes del framework.
- **CSS variables**: Bootstrap utiliza variables CSS para permitir cambios dinámicos de estilos.
- **Optimize**: Técnicas para reducir el tamaño del CSS y mejorar el rendimiento del proyecto.










## Layout
Estructura de diseño:
- **Breakpoints**: Puntos de tamaño de pantalla que permiten adaptar el diseño a distintos dispositivos (responsive).
- **Containers**: Contenedores que centran y limitan el ancho del contenido dentro de la página.
- **Grid**: Sistema de columnas basado en filas que permite organizar el layout de forma responsiva.
- **Columns**: Clases que definen cómo se distribuye el espacio entre columnas dentro del grid.
- **Gutters**: Espacios entre columnas y filas dentro del sistema de grid.
- **Utilities**: Clases que ayudan a controlar comportamientos del layout directamente desde el HTML.
- **Z-index**: Define la profundidad de los elementos cuando se superponen en la interfaz.
- **CSS Grid**: Alternativa moderna al grid tradicional que utiliza la tecnología nativa CSS Grid.














## Content
Content: contenido base:
- **Reboot**: Conjunto de estilos base que normalizan el comportamiento de los elementos HTML entre distintos navegadores.
- **Typography**: Clases y estilos para controlar la apariencia del texto, como tamaños, pesos y jerarquía de títulos.
- **Images**: Clases que ayudan a hacer imágenes responsivas y adaptarlas correctamente al diseño.
- **Tables**: Estilos para mejorar la apariencia y organización visual de las tablas HTML.
- **Figures**: Permite mostrar imágenes con una leyenda o descripción asociada.








## Forms
Formularios
- **Overview**: Explica cómo Bootstrap estiliza y organiza los formularios para crear interfaces de entrada de datos claras y consistentes.
- **Form control**: Clases para estilizar campos de entrada como textos, correos, contraseñas y áreas de texto.
- **Select**: Permite estilizar menús desplegables (`select`) para elegir opciones dentro de un formulario.
- **Checks & radios**: Estilos para casillas de verificación (checkbox) y botones de opción (radio).
- **Range**: Control deslizante que permite seleccionar valores dentro de un rango numérico.
- **Input group**: Permite combinar inputs con elementos adicionales como botones, iconos o texto.
- **Floating labels**: Etiquetas que se desplazan dentro del campo de entrada cuando el usuario escribe.
- **Layout**: Herramientas para organizar y alinear los campos del formulario dentro de la página.
- **Validation**: Sistema para mostrar mensajes visuales cuando los datos ingresados en un formulario son válidos o incorrectos.







## Components
Elementos de interfaz
- **Accordion**: Componente que permite mostrar y ocultar secciones de contenido en forma de paneles desplegables.
- **Alerts**: Mensajes visuales que informan al usuario sobre estados o acciones (éxito, error, advertencia, información).
- **Badge**: Pequeñas etiquetas que muestran información breve como notificaciones o conteos.
- **Breadcrumb**: Navegación que muestra la ruta jerárquica dentro de un sitio web.
- **Buttons**: Botones estilizados para ejecutar acciones dentro de la interfaz.
- **Button group**: Agrupa varios botones en una sola línea para representar acciones relacionadas.
- **Card**: Contenedor flexible que permite organizar contenido como imágenes, texto y botones.
- **Carousel**: Componente que permite mostrar una serie de elementos rotativos como imágenes o contenido.
- **Close button**: Botón pequeño usado para cerrar componentes como modales o alertas.
- **Collapse**: Permite mostrar u ocultar contenido dinámicamente mediante animación.
- **Dropdowns**: Menú desplegable que muestra opciones al hacer clic en un botón o enlace.
- **List group**: Lista estilizada de elementos que puede incluir enlaces, botones o contenido.
- **Modal**: Ventana emergente que aparece sobre la página para mostrar información o formularios.
- **Navbar**: Barra de navegación principal que contiene enlaces, menús y elementos del sitio.
- **Navs & tabs**: Sistema de navegación que organiza contenido en pestañas o secciones.
- **Offcanvas**: Panel lateral que aparece desde el borde de la pantalla para mostrar navegación o contenido.
- **Pagination**: Controles para navegar entre diferentes páginas de contenido.
- **Placeholders**: Elementos temporales que simulan contenido mientras este se carga.
- **Popovers**: Pequeñas ventanas emergentes que muestran información adicional al interactuar con un elemento.
- **Progress**: Barra visual que muestra el progreso de una tarea o proceso.
- **Scrollspy**: Sistema que detecta el desplazamiento en la página y actualiza automáticamente la navegación.
- **Spinners**: Indicadores animados que muestran que una acción está cargando.
- **Toasts**: Notificaciones breves que aparecen temporalmente en la interfaz.
- **Tooltips**: Pequeños mensajes que aparecen al pasar el cursor sobre un elemento.










## Helpers
Ayudas de comportamiento
- **Clearfix**: Permite que un contenedor reconozca la altura de elementos flotantes (`float`) dentro de él.
- **Color & background**: Clases que aplican simultáneamente color de texto y fondo a un elemento.
- **Colored links**: Utilities para aplicar colores predefinidos a enlaces.
- **Focus ring**: Controla el estilo visual que aparece cuando un elemento recibe foco (accesibilidad).
- **Icon link**: Permite crear enlaces que incluyen iconos alineados con el texto.
- **Position**: Helpers para posicionar elementos dentro de un contenedor de forma precisa.
- **Ratio**: Mantiene proporciones fijas en elementos como videos o imágenes (ej: 16:9).
- **Stacks**: Permite organizar elementos en filas o columnas con separación automática.
- **Stretched link**: Hace que todo un contenedor sea clickeable cuando contiene un enlace.
- **Text truncation**: Recorta texto largo y agrega puntos suspensivos cuando excede el espacio disponible.
- **Vertical rule**: Crea una línea vertical para separar elementos.
- **Visually hidden**: Oculta contenido visualmente pero lo mantiene accesible para lectores de pantalla.











## Utilities
Clases rápidas de estilo
- **API**: Sistema que permite generar o personalizar utilities de Bootstrap usando Sass.
- **Background**: Clases para aplicar colores o fondos a los elementos.
- **Borders**: Clases para agregar, quitar o modificar bordes en los elementos.
- **Colors**: Clases para cambiar el color del texto según la paleta de Bootstrap.
- **Display**: Clases que controlan cómo se muestra un elemento (block, flex, none, etc.).
- **Flex**: Utilities para trabajar con layouts basados en Flexbox.
- **Float**: Clases para hacer que un elemento flote a la izquierda o derecha.
- **Interactions**: Clases que controlan cómo el usuario puede interactuar con un elemento (selección, pointer events, etc.).
- **Link**: Clases para estilizar enlaces y aplicar colores consistentes.
- **Object fit**: Controla cómo una imagen o video se ajusta dentro de su contenedor.
- **Opacity**: Clases para modificar el nivel de transparencia de un elemento.
- **Overflow**: Controla qué ocurre cuando el contenido supera el tamaño del contenedor.
- **Position**: Clases para definir el posicionamiento de un elemento (relative, absolute, fixed, etc.).
- **Shadows**: Clases para aplicar diferentes niveles de sombra a los elementos.
- **Sizing**: Clases para controlar el ancho y alto de los elementos.
- **Spacing**: Utilities para manejar márgenes y padding de forma rápida.
- **Text**: Clases para modificar alineación, peso, transformación y estilo del texto.
- **Vertical align**: Controla la alineación vertical de elementos inline o inline-block.
- **Visibility**: Clases para mostrar u ocultar elementos sin eliminarlos del layout.
- **Z-index**: Controla el orden de superposición de elementos en el eje Z.














## Extend
Ampliar el framework
- **Approach**: Explica la filosofía de Bootstrap para extender o agregar nuevas funcionalidades sin romper la estructura del framework.
- **Icons**: Describe cómo integrar bibliotecas de iconos externas o usar Bootstrap Icons dentro de un proyecto.






## About
Sobre el proyecto
- **Overview**: Descripción general de qué es Bootstrap, para qué sirve y cuáles son sus principales características como framework front-end.
- **Team**: Presenta al equipo principal y a los colaboradores que desarrollan y mantienen el proyecto Bootstrap.
- **Brand**: Explica cómo usar correctamente la marca Bootstrap, incluyendo su logo, identidad visual y reglas de uso.
- **License**: Indica la licencia del proyecto (MIT), que permite usar, modificar y distribuir Bootstrap libremente.
- **Translations**: Muestra las traducciones disponibles de la documentación de Bootstrap a distintos idiomas.










