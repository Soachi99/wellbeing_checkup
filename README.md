# Wellbeing Checkup app

Proyecto que da solución a la prueba técnica para la empresa Vinnove.

## Para empezar

Para compilar y correr este projecto:
  1. Obtener e instalar Flutter si aún no lo tienes
  2. Clonar el repositorio
  3. Ejecutar el comando `flutter pub get`
  4. Y para correr el proyecto ejecutar el comando `flutter run`

## Acerca de la aplicación

Pantalla inicial del app, en donde se pueden encontrar las diferentes opciones que el usuario puede escoger para empezar los test

<img src= "https://i.postimg.cc/90x7k0KD/Screenshot-1697165012.png" height ="500">

Una vez el usuario escoga una opción el botón para continuar se activara y lo llevara a la siguiente pantalla donde se cargan todas las preguntas de la categoria escogida. Estas preguntas estan alojadas en una una base de datos por medio de Firebase

<img src= "https://i.postimg.cc/MZtVH3Hz/Screenshot-1697165020.png" height ="500">

El usuario debera ir escogiendo una opción para activar la siguiente pregunta sucesivamente, una vez complete todas las preguntas el botón se activará.

<img src= "https://i.postimg.cc/FsRcLbk3/Screenshot-1697165026.png" height ="500">

Finalmente y depende a las opciones escogidas se calculara el resultado y se mostrara en la siguiente pantalla.

<img src= "https://i.postimg.cc/L6bPBqj7/Screenshot-1697165029.png" height ="500">

## Firebase

El proyecto cuenta con el servicio de Firestore Database, donde se almacenan las preguntas dispuestas para cada test

<img src= "https://i.postimg.cc/7YsR3Nsk/imagen-2023-10-12-215041729.png" width ="700">
<img src= "https://i.postimg.cc/cCWpz4wG/imagen-2023-10-12-214952674.png" width ="700">

Donde:
 - `id` representa el id unico de la pregunta
 - `name` representa el nombre de la pregunta
