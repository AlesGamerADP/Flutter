# Calendario Semanal Flutter

<div align="center">

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)

Una aplicación de calendario semanal simple y elegante hecha con Flutter

</div>

---

## Características

- Vista semanal de lunes a domingo
- Horario de 8:00 AM a 8:00 PM
- Agregar eventos con título, hora y color
- 8 colores diferentes para categorizar
- Interfaz moderna y fácil de usar
- Navegación entre semanas

---

## Tecnologías

**Framework:** Flutter & Dart

**Widgets principales:**
- `MaterialApp`, `Scaffold`, `AppBar`
- `StatefulWidget` para manejo de estado
- `Column`, `Row`, `Container` para layouts
- `GestureDetector` para interacciones
- `AlertDialog` para modales
- `TextField`, `DropdownButtonFormField` para formularios

**Conceptos:**
- State Management con `setState()`
- Manejo de fechas con `DateTime`
- Listas y colecciones de Dart
- Null Safety

---

## Instalación

```bash
# Clonar repositorio
git clone https://github.com/tu-usuario/calendario-semanal.git
cd calendario-semanal

# Instalar dependencias
flutter pub get

# Ejecutar app
flutter run
```

**Requisitos:** Flutter SDK >=3.0.0

---

## Uso

### Navegar
- `+` para cambiar de semana
- `📅` para volver a hoy

### Agregar evento
1. Presiona el botón `+`
2. Completa título, hora, día y color
3. Presiona "Agregar"

### Ver detalles
- Toca cualquier evento para ver más información

---

## Colores Disponibles

Purple • Blue • Green • Orange • Red • Teal • Pink • Indigo


## 🔧 Personalización

**Cambiar horario:**
```dart
List.generate(12, (hour) {  // Número de horas
  "${hour + 8}:00"  // Hora de inicio
```

**Agregar colores:**
```dart
[Colors.purple, Colors.blue, ..., Colors.tuColor]
```

**Cambiar fuente:**
```dart
theme: ThemeData(fontFamily: "TuFuente")
```

---

## Modelo Event

```dart
class Event {
  final String title;        // Título
  final String time;         // "HH:MM"
  final Color color;         // Color
  final int dayIndex;        // 0-6 (Lun-Dom)
  final int hour;            // 0-11
  final String description;  // Opcional
}
```

## Licencia

MIT License - usa libremente

---

<div align="center">

**Hecho con amor y Flutter**

Dale una estrella si te gustó

</div>
