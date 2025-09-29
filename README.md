# Programación Orientada a Objetos en Dart

Este repositorio resume conceptos fundamentales de **POO** (Programación Orientada a Objetos) aplicados en Dart.

---

## ¿Qué es la Programación Orientada a Objetos?
Es un paradigma que organiza el código en **objetos** que combinan datos (atributos) y comportamientos (métodos).  
En Dart usamos **clases** para definir esos objetos.

---

## Conceptos principales en Dart

### 1. Clase
Una **clase** es la plantilla para crear objetos.  
Define atributos (propiedades) y métodos (acciones).  

### 2. Objeto
Un **objeto** es una instancia de una clase.  
Ejemplo: a partir de la clase `Vehiculo` puedo crear un objeto `auto`.

### 3. Herencia
Permite que una clase herede atributos y métodos de otra.  
Sirve para compartir lo común y especializar con lo propio.

### 4. Polimorfismo
Significa que distintas clases pueden responder de manera diferente al mismo método.  
Ejemplo: `ejecutar()` puede imprimir cosas distintas según la clase.

### 5. Abstracción
Se centra en lo esencial y oculta los detalles internos.  
En Dart, se puede usar con **clases abstractas** o **interfaces**.

### 6. Encapsulamiento
Controla el acceso a los datos internos de una clase.  
En Dart, se logra con getters, setters o con el prefijo `_` para atributos privados.

### 7. Mixins
Son “poderes adicionales” que se pueden **pegar** a clases sin necesidad de heredar.  
Útiles para capacidades transversales, como registrar eventos o reportar ubicación.

### 8. Composición (contener)
En vez de heredar, una clase puede **contener** otras como atributos.  
Se usa cuando queremos reutilizar código sin depender de una jerarquía rígida.

---

## Resumen
En Dart, la POO nos permite:
- Definir **clases** como base de objetos.  
- Reutilizar lo común con **herencia**.  
- Diferenciar comportamientos con **polimorfismo**.  
- Organizar y proteger datos con **encapsulamiento**.  
- Agregar “poderes” con **mixins**.  
- Construir sistemas flexibles con **composición**.  

---
