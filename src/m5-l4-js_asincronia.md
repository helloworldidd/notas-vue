# JS Asincronía
_Programación asíncrona en JavaScript_

[INDICE]



## 1. Programación asíncrona

La **programación asíncrona** permite **diferir la ejecución de una función** mientras se espera que otra operación termine.

Esto permite que la aplicación **no se quede bloqueada** mientras espera resultados.

Ejemplos de operaciones que suelen ser asíncronas:

* consultas a una base de datos
* llamadas a una API
* lectura de archivos
* temporizadores

Ventaja principal:

✔ Mejora la **respuesta de la aplicación**
✔ Reduce el **tiempo de espera del usuario**



## 2. Qué es un Thread

Un **thread** es una unidad de ejecución dentro de un proceso.

Permite que una aplicación **realice varias tareas al mismo tiempo** (concurrencia).

Un thread puede:

* ejecutar instrucciones
* esperar resultados
* sincronizarse con otros threads
* detener o continuar procesos

⚠ Importante:

**Concurrencia ≠ Multitarea**

La concurrencia significa manejar múltiples procesos que pueden avanzar **sin bloquearse entre sí**.



## 3. Código bloqueante vs código asíncrono

En programación existen dos formas de ejecutar tareas.

## Código bloqueante

El programa **se detiene** hasta que la operación termina.

Ejemplo típico:

```javascript
leerArchivo();
procesarDatos();
mostrarResultado();
```

Cada línea espera a la anterior.



### Código asíncrono

El programa **no espera** a que termine la operación.

Puede seguir ejecutando otras tareas mientras tanto.

Ejemplo:

```javascript
leerArchivoAsync();
mostrarMensaje();
```

Esto mejora el rendimiento de aplicaciones web.



## 4. Funciones asíncronas en JavaScript

En JavaScript una función asíncrona trabaja junto al **event loop** y al **call stack**.

Ejemplo:

```javascript
function dos() {
  setTimeout(function () {
    console.log("Dos");
  }, 1000);
}

function uno() {
  setTimeout(function () {
    console.log("Uno");
  }, 0);

  dos();

  console.log("Tres");
}

uno();
```

Salida posible:

```
Tres
Uno
Dos
```

Esto ocurre porque **setTimeout es asíncrono**.



## 5. Callbacks

Un **callback** es una función que se ejecuta **después de que otra función termine**.

JavaScript usa muchos callbacks porque es **orientado a eventos**.

Ejemplo:

```javascript
function doHomework(subject, callback) {
  alert(`Starting my ${subject} homework.`);
  callback();
}

doHomework('math', function () {
  alert('Finished my homework');
});
```

Aquí la función callback se ejecuta **cuando termina la tarea principal**.



## 6. setTimeout

El método `setTimeout()` ejecuta una función **después de un tiempo determinado**.

El tiempo se expresa en **milisegundos**.

Ejemplo:

```javascript
setTimeout(function () {
  console.log("Esto va segundo en 2 segundos");
}, 2000);

console.log("Esto va primero");
```

Salida:

```
Esto va primero
Esto va segundo en 2 segundos
```



## 7. Ejemplo práctico de callback

Supongamos que tenemos un sistema que registra usuarios y luego envía un mensaje de bienvenida.

```javascript
function registrarUsuario(nombre, callback) {

  console.log("Registrando al usuario: " + nombre);

  setTimeout(function () {

    console.log("Usuario registrado exitosamente.");

    callback(nombre);

  }, 2000);
}

function enviarBienvenida(nombre) {
  console.log("¡Bienvenido/a, " + nombre + "!");
}

registrarUsuario("Pedro", enviarBienvenida);
```

Flujo:

1. Se registra el usuario
2. Se simula un proceso asíncrono
3. Se ejecuta el callback



## 8. Promesas (Promises)

Una **promesa** representa el resultado futuro de una operación asíncrona.

Puede tener **tres estados**:

```
Pending   → pendiente
Fulfilled → cumplida
Rejected  → rechazada
```

Ejemplo:

```javascript
let miPrimeraPromise = new Promise((resolve, reject) => {

  setTimeout(function () {
    resolve("¡Éxito!");
  }, 250);

});

miPrimeraPromise.then((successMessage) => {
  console.log("Sí! " + successMessage);
});
```



## 9. Ventajas de las promesas

Las promesas mejoran los callbacks porque:

* hacen el código **más limpio**
* facilitan el manejo de errores
* evitan el problema llamado **callback hell**



## 10. then() y catch()

Las promesas utilizan dos métodos principales:

```
.then()  → cuando la promesa se resuelve
.catch() → cuando ocurre un error
```

Ejemplo:

```javascript
Promise.resolve("Hi!")

.then(success)
.catch(error);

function success(value) {
  console.log("Resolved:", value);
}

function error(err) {
  console.log("Error:", err);
}
```



## 11. Ejemplo de promesa

```javascript
let promesa = new Promise((resolver, rechazar) => {

  setTimeout(() => {

    let numero = Math.random();

    if (numero >= 0.5) {
      resolver("Éxito");
    } else {
      rechazar("Error");
    }

  }, 2000);

});

promesa
  .then(data => console.log(data))
  .catch(data => console.log(data));
```



## 12. Async / Await

`async` y `await` permiten trabajar con promesas de forma **más clara y legible**.



### async

Una función declarada con `async` **siempre devuelve una promesa**.



### await

La palabra `await`:

* solo se usa dentro de funciones `async`
* **detiene la ejecución hasta que la promesa se resuelva**



## 13. Ejemplo con async / await

```javascript
function promesa() {

  return new Promise((resolver, rechazar) => {

    setTimeout(() => {

      let numero = Math.random();

      if (numero >= 0.5) {
        resolver("Éxito");
      } else {
        rechazar("Error");
      }

    }, 2000);

  });

}

async function ejecutarPromesa() {

  try {

    const resultado = await promesa();
    console.log(resultado);

  } catch (error) {

    console.log(error);

  }

}

ejecutarPromesa();
```



## 14. Manejo de errores con try / catch

Cuando usamos `async/await` podemos capturar errores con:

```
try
catch
```

Ejemplo:

```javascript
async function ejecutarPromesa() {

  try {

    const resultado = await promesa();
    console.log(resultado);

  } catch (error) {

    console.log(error);

  }

}
```

Esto evita tener que usar múltiples `.catch()`.



## Comparación rápida

| Método        | Características                               |
| ------------- | --------------------------------------------- |
| Callbacks     | Antiguo, puede generar código difícil de leer |
| Promises      | Más limpio y controlado                       |
| Async / Await | Más legible, parece código secuencial         |



Si quieres, en el siguiente paso puedo hacerte **una versión mejorada para tu bootcamp** con:

* explicación del **event loop**
* diagrama **Call Stack / Web APIs / Callback Queue**
* ejemplo con **fetch API**
* ejercicio para alumnos

porque **la asincronía es donde más se pierden los estudiantes de front-end**.
