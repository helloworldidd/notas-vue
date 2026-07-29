# Git
_Sistema de control de versiones para gestionar cambios en el código_

[INDICE]



## 1. Git

### 1.1. Qué es Git

<img src="https://helloworldidd.github.io/sourceinvaders/assets/source/brands/git-original-wordmark.svg" width="70px">

**Git** es un sistema de **control de versiones** que permite registrar los cambios realizados en un proyecto a lo largo del tiempo.

Con Git podemos:

* guardar el historial del proyecto
* recuperar versiones anteriores
* trabajar en equipo
* controlar cambios en el código

Git fue creado por **Linus Torvalds** en 2005.

### 1.2. Enlaces de interés

- https://git-scm.com/
- https://es.wikipedia.org/wiki/Git
- https://git-scm.com/docs



### 1.4. Control de versiones

El **control de versiones** es un sistema que registra los cambios realizados en archivos.

Permite:

* volver a versiones anteriores
* comparar cambios
* colaborar en equipo

Ejemplo:

```
versión 1
versión 2
versión 3
```

Cada cambio queda registrado en el historial del proyecto.



### 1.4. Repositorio

Un **repositorio** es el lugar donde se almacenan los archivos de un proyecto y su historial de cambios.

Puede ser:

- **Local** Está en tu computador.

- **Remoto** Está en internet:

| | |
|-|-|
| <img src="https://helloworldidd.github.io/sourceinvaders/assets/source/brands/github-original-wordmark.svg" width="70px"> | https://github.com/ |
| <img src="https://helloworldidd.github.io/sourceinvaders/assets/source/brands/gitlab-original-wordmark.svg" width="70px"> | https://gitlab.com/ |
| <img src="https://helloworldidd.github.io/sourceinvaders/assets/source/brands/bitbucket-original-wordmark.svg" width="70px"> | https://bitbucket.org/ |


## 2. Terminal

La **terminal** es una interfaz de texto que permite ejecutar comandos.

Se utiliza para interactuar con Git.

Ejemplos de terminal según sistema:

* Linux → Terminal
* Mac → Terminal
* Windows → Git Bash





### 2.1. ¿Qué es el terminal?

El **terminal** es una ventana donde puedes darle instrucciones al computador escribiendo comandos.

En vez de hacer clic con el mouse, **escribes lo que quieres que el sistema haga**.

Ejemplos de cosas que puede hacer:

* crear carpetas
* mover archivos
* instalar programas
* ejecutar programas
* programar
* conectarse a servidores



### 2.2. Cómo funciona

```
Sistema Operativo
    ↓
Terminal (ventana)
    ↓
Shell (interpreta comandos)
       por ejemplo: Bash, Zsh, PowerShell
```

El **shell** es el programa que **interpreta los comandos que escribes** y se los envía al sistema operativo.



### 2.3. Mostrar que no da miedo

Abrir terminal y mostrar cosas simples.

Estos comandos funcionan en **Linux, macOS y la mayoría de terminales modernas (Bash, Zsh, PowerShell)**.

* `pwd` → ver dónde estamos
* `ls` → ver archivos
* `mkdir proyecto` → crear carpeta
* `cd proyecto` → entrar a la carpeta
* `rm -r proyecto` → eliminar carpeta

| Acción             | Bash / Zsh / Linux / Mac | PowerShell | CMD        |
| ------------------ | ------------------------ | ---------- | ---------- |
| ver carpeta actual | `pwd`                    | `pwd`      | `cd`       |
| ver archivos       | `ls`                     | `ls`       | `dir`      |
| crear carpeta      | `mkdir`                  | `mkdir`    | `mkdir`    |
| entrar carpeta     | `cd`                     | `cd`       | `cd`       |
| eliminar carpeta   | `rm -r`                  | `rm -r`    | `rmdir /s` |

💡 Idea clave para estudiantes:

> **El terminal no es peligroso. Solo ejecuta exactamente lo que le dices.**



### 2.4. Tipos de shell

```
CMD        → Windows antiguo
PowerShell → Windows moderno

Bash       → Linux / Unix
Zsh        → macOS moderno
```


### 2.5. Explicación detallada

```
1) Windows, macOS o Linux     (Sistema Operativo)
      │
      ▼
2) Terminal    (Ventana donde escribes comandos)
      │
      ▼
3) Shell       (Programa que interpreta los comandos)

Tipos de Shell:

    Bash        - Clásico de Unix / Linux y antiguo en macOS
                  uso: viene instalado en Linux y macOS
                       en Windows se usa con Git Bash o WSL

    PowerShell  - Shell moderno de Windows
                  uso: viene instalado en Windows
                       Win + X → Windows PowerShell
                       buscador → PowerShell o Terminal

    CMD         - Shell antiguo de Windows (Command Prompt)
                  uso: viene instalado en Windows
                       Win + R → cmd

    Zsh         - Shell moderno usado hoy en macOS
                  uso: viene instalado en macOS
                       abrir Terminal y ya se ejecuta Zsh
                       verificar con → echo $SHELL
```



### 2.6. Gestores de paquetes

Los gestores de paquetes permiten **instalar programas desde la terminal**.

```
macOS   → Homebrew (brew)
Linux   → apt / dnf / pacman
Windows → winget / choco
```

Ejemplos:

* macOS

  ```
  brew install git
  ```

* Linux

  ```
  sudo apt install git
  ```

* Windows

  ```
  winget install git
  ```









## 3. Instalación de Git

### 3.1 Instalación

Para instalar Git se debe descargar desde:


[https://git-scm.com/downloads](https://git-scm.com/downloads)



Después de instalar se puede verificar con:

```bash
git --version
```



### 3.2 Configuración

Antes de usar Git debemos configurar nuestro usuario.

```bash
git config --global user.name "Tu Nombre"
git config --global user.email "correo@email.com"
```

Para ver la configuración:

```bash
git config --global --list
```



## 4. Flujo de Git

### 4.1. Flujo

El flujo de trabajo de Git es:


1. editar archivos
2. git add
3. git commit
4. git push



| | |
|-|-|
|`git init`                     | **inicializa** un repositorio en la carpeta |
|`git add .`                    | **agrega** todos los archivos al repositorio |
|`git commit -m "primer commit"`| **guarda** un _commit_ en el historial. |
|`git status`                   | **ver el estado** del repositorio |




## 5. Operaciones básicas en Git

### 5.1. Cambiar nombre de archivos

Git permite renombrar archivos:

```bash
git mv archivo.txt nuevo.txt
```



### 5.2. Ignorar archivos

El archivo `.gitignore` indica qué archivos **no deben subirse al repositorio**.

Ejemplo:

```
node_modules
.env
dist
```






### 5.3. Historial de cambios

Para ver el historial de commits:

```bash
git log
```

Versión resumida:

```bash
git log --oneline
```



### 5.4. Tags (versiones)

Los **tags** permiten marcar versiones importantes.

Ejemplo:

```bash
git tag v1.0
```

Enviar etiqueta al repositorio remoto:

```bash
git push origin v1.0
```














### 5 Ramas y trabajo paralelo

### 5.1. Ramas (branches)

Las **ramas** permiten trabajar en funcionalidades separadas.

La rama principal suele ser:

```
main
```

Crear una rama:

```bash
git branch nueva-rama
```

Cambiar de rama:

```bash
git checkout nueva-rama
```



### 5.2. Fusionar ramas

Para unir una rama con otra:

```bash
git merge nombre-rama
```

A veces pueden aparecer **conflictos**, que deben resolverse manualmente.



### 5.3. Rebase

El **rebase** reorganiza el historial de commits para mantenerlo más limpio.

Ejemplo:

```bash
git rebase main
```




### 5.4. Stash

El comando **stash** guarda cambios temporales.

```bash
git stash
```

Recuperar cambios guardados:

```bash
git stash pop
```











## 7. GitHub

### 7.1. GitHub

**GitHub** es una plataforma que permite almacenar repositorios Git en la nube.

Permite:

* compartir código
* colaborar en proyectos
* controlar versiones
* publicar proyectos

Sitio oficial:

```
https://github.com
```



### 7.2. Clonar repositorio

Para copiar un repositorio remoto a tu computador:

```bash
git clone https://github.com/usuario/proyecto.git
```



### 7.4. Push y Pull

**Push**: Envía cambios al repositorio remoto.

```bash
git push origin main
```



**Pull**: Descarga cambios del repositorio remoto.

```bash
git pull
```



### 7.4. Fetch vs Pull

**git fetch**

Descarga cambios pero **no los fusiona**.

**git pull**

Descarga cambios **y los fusiona automáticamente**.



### 7.5. Pull Request

Un **Pull Request (PR)** permite proponer cambios en un repositorio.

Proceso típico:

1. crear rama
2. realizar cambios
3. subir cambios
4. abrir Pull Request
5. revisión del código
6. merge



### 7.6. Markdown en GitHub

**Markdown** es un formato de texto ligero usado para documentar proyectos.

Ejemplo de archivo:

```
README.md
```

Permite escribir documentación con formato simple.



### 7.7. GitHub Pages

GitHub permite **publicar páginas web directamente desde un repositorio**.

Esto se llama:

```
GitHub Pages
```

Se utiliza para:

* portafolios
* documentación
* proyectos web




# 8. Trabajo colaborativo



### 8.1. Trabajo colaborativo con Git

Flujo común en equipos:

```
fork del repositorio
↓
clone en computador
↓
crear rama
↓
realizar cambios
↓
commit
↓
push
↓
pull request
```




## 9. 🔖 Resumen


### 9.1 🔖 Resumen comandos

<div class="block-code">

```bash
# Básico
pwd      # ver directorio actual
ls       # listar archivos
cd       # cambiar directorio
mkdir    # crear carpeta
touch    # crear archivo
cp       # copiar archivos
mv       # mover o renombrar
rm       # eliminar archivos

# Crear carpeta y archivo
mkdir prueba                  # crea una carpeta llamada "prueba"
cd prueba                     # entra a la carpeta "prueba"
echo "Hola Git" > README.md   # crea un archivo README.md con el texto "Hola Git"

# Configurar Git
git --version                                       # ver versón Git
git config --global user.name "Tu Nombre"           # definir nombre
git config --global user.email "tucorreo@gmail.com" # definir correo
git config --global init.defaultBranch main         # definir "main" rama principal
git config --global color.ui auto                   # activa colores en la terminal
git config --global --list                          # ver configuraciones

# Iniciar repositorio y agregar cambios
git init                  # inicia un repo (en la carpeta actual)
git status                # muestra el estado del repo
git add .                 # agrega TODOS los archivos
git commit -m "mensaje"   # guarda los cambios en el historial con un mensaje
git log --oneline         # muestra el historial



# Conectar a repo remoto (GitHub)
# Antes: debes **crear el repo en GitHub**.

# renombra la rama actual a "main"
git branch -M main

# conecta el repo-LOCAL con repo-REMOTO
git remote add origin https://github.com/hellowworld/frontend-v1.git

# subir cambios
git push -u origin main





# Bajar cambios
git status     # muestra el estado
git pull       # descargar

# Ramas 🌱
git branch              # ver ramas existentes
git branch feature1     # crear nueva rama "feature1"
git checkout feature1   # cambiar a feature1
git checkout main       # cambiar a main
git merge feature1      # fusionar feature1 con actual


# Volver a un punto anterior 🚗⚡🔥🔥🔥
git log --oneline         # muestra el historial
git checkout 55b22d8      # mueve el proyecto temporalmente a ese commit
git reset --hard 55b22d8  # vuelve el repositorio EXACTAMENTE a ese commit
                          # y se eliminan cambios posteriores
                          
                          
                          
                          
                          

# Trabajo en equipo 👥

git clone https://github.com/usuario/proyecto.git   # clonar el repositorio
cd proyecto                                         # entrar a la carpeta

git remote -v           # ver repo remotos

# OPCIÓN 1
git fetch               # descarga referencias remotas como:
                        # origin/main
                        # origin/prueba1
                        # origin/prueba2
                        # pero NO FUSIONA NI CREA RAMAS LOCALES
git branch -r           # ver ramas remotas descargadas

# OPCIÓN 2
git pull origin main    # descarga y fusiona cambios de la rama main
                        # en tu rama local actual


# Trabajar con ramas creadas por otros usuarios
# Supongamos que otros usuarios subieron:
                                        # origin/prueba1
                                        # origin/prueba2
git checkout -b prueba1 origin/prueba1  # crear rama local prueba1 basada en remota
git checkout -b prueba2 origin/prueba2  # crear rama local prueba2 basada en remota
git checkout main                       # volver a main


# Crear tu propia rama de trabajo
git checkout -b nueva-funcion                       # crear y cambiar a una nueva rama local
git push -u origin nueva-funcion                    # subir tu rama al remoto y dejarla vinculada

# Unir cambios (merge)
git checkout main                                   # volver a la rama principal
git merge nueva-funcion                             # fusionar nueva-funcion dentro de main
git push origin main                                # subir main actualizada


# Resolver conflictos (cuando 2 personas cambian lo mismo)
git pull origin main                                # traer cambios recientes y fusionarlos

# Git puede marcar archivos con conflicto
# debes abrirlos y elegir qué código conservar

git add .                                           # marcar archivos corregidos
git commit -m "fix: resuelve conflictos"            # guardar resolución de conflictos
git push origin main                                # subir cambios corregidos












# Editar commits ✏️

# Cambiar el mensaje del ÚLTIMO commit
git commit --amend -m "Nuevo mensaje del commit"    # modifica el último commit
                                                    # permite cambiar mensaje o agregar archivos olvidados
git push --force-with-lease                         # actualizar GitHub porque cambió el historial


# Cambiar el mensaje de un commit anterior
# ejemplo: modificar el antepenúltimo commit
git rebase -i HEAD~3                                # abre rebase interactivo de los últimos 3 commits

# Git mostrará algo como:
# pick a1b2c3 commit antiguo
# pick d4e5f6 commit 2
# pick g7h8i9 commit 3

# cambiar "pick" por "reword" en el commit que quieres editar

# ejemplo
# reword a1b2c3 commit antiguo
# pick d4e5f6 commit 2
# pick g7h8i9 commit 3

# Git abrirá el editor para cambiar el mensaje
# guardar y cerrar

git rebase --continue                               # continuar el rebase si Git se detiene
git push --force-with-lease                         # subir cambios reescritos al repositorio remoto


# Qué hace rebase
git rebase origin/main                              # mueve tus commits al final del historial actual
                                                     # reescribe la historia para mantenerla lineal


# Ver estado corto (menos verboso)
git status -s                                       # muestra cambios de forma resumida


# Si un rebase queda a medio camino
git rebase --continue                               # continuar rebase
git rebase --skip                                   # saltar el commit actual
git rebase --abort                                  # cancelar rebase y volver al estado anterior



```

</div>


### 9.2 🔖 Resumen Commits

<div class="block-doc">

**Mostrar archivos ocultos**
- Windows: **Explorador de archivos -> Ver -> Mostrar -> Elementos ocultos**
- macOS: **Finder -> Cmd + Shift + .**
<br>
<br>
<br>


**Cómo escribir un commit**: ámbito:  + verbo en presente + descripción breve

- **feat:** Nueva funcionalidad
- **fix:** Corrección de errores
- **docs:** Cambios en la documentación
- **style:** Cambios visuales (CSS, formato, espacios)
- **refactor:** Reorganización del código sin cambiar funcionalidad
- **test:** Agregar o modificar pruebas (tests)
- **chore:** Tareas internas del proyecto (dependencias, configuración)
- **perf:** Mejora de rendimiento
- **build:** Cambios en el sistema de build o compilación
- **ci:** Cambios en integración continua
- **revert:** Revertir un commit anterior
- **init:** Inicialización del proyecto

Ejemplo:
- **feat:** agrega sistema de reservas
- **fix:** corrige error en validación de formulario
- **docs:** actualiza README
- **style:** mejora estilos del navbar
- **refactor:** reorganiza funciones de la API
- **chore:** actualiza dependencias

</div>


