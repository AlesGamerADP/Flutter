# lab_08

Este proyecto es una aplicación Flutter que incluye un sistema básico de login, un menú principal, un formulario para registrar productos tecnológicos y una lista de productos tecnológicos.

## Funcionalidades

- Pantalla de login con validación básica.
- Menú principal con opciones para registrar productos, ver la lista de productos tecnológicos y cerrar sesión.
- Formulario para registrar productos con campos para nombre y precio.
- Lista dinámica de productos tecnológicos predefinidos.
- Navegación fluida entre las pantallas con gestión adecuada del historial.

## Funciones utilizadas

Se utilizaron funciones de Flutter para la navegación como `Navigator.push`, `Navigator.pushReplacement` y `Navigator.pushAndRemoveUntil` para controlar la transición entre pantallas y el manejo del stack de navegación. También se usaron `TextEditingController` para controlar y limpiar los campos de texto en los formularios. Para mostrar mensajes al usuario se usó `ScaffoldMessenger.of(context).showSnackBar`. Además, se emplearon widgets como `TextField`, `ElevatedButton`, `ListView.builder`, `Card`, y `ListTile` para construir la interfaz de usuario.

## Cómo ejecutar el proyecto

1. Asegúrate de tener Flutter instalado y configurado. Puedes seguir la guía oficial [Flutter Installation](https://docs.flutter.dev/get-started/install).
2. Clona este repositorio.
3. Abre una terminal en la carpeta raíz del proyecto.
4. Ejecuta `flutter pub get` para instalar las dependencias.
5. Ejecuta `flutter run` para lanzar la aplicación en un dispositivo o emulador conectado.

## Recursos útiles

- [Documentación oficial de Flutter](https://docs.flutter.dev/)
- [Primeros pasos con Flutter](https://docs.flutter.dev/get-started/codelab)
- [Ejemplos y recetas útiles](https://docs.flutter.dev/cookbook)
