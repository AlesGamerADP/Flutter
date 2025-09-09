// Clase base simple
abstract class ItemReservable {
  String nombre;
  double precio;

  ItemReservable(this.nombre, this.precio);

  // Método que cada tipo debe implementar
  String mostrarInfo();
}

// Libro
class Libro extends ItemReservable {
  String autor;
  int paginas;

  Libro(String nombre, double precio, this.autor, this.paginas) 
      : super(nombre, precio);

  @override
  String mostrarInfo() {
    return "LIBRO: $nombre - Autor: $autor - Páginas: $paginas - Precio: \$$precio";
  }
}

// Pelicula
class Pelicula extends ItemReservable {
  String director;
  int duracion;

  Pelicula(String nombre, double precio, this.director, this.duracion) 
      : super(nombre, precio);

  @override
  String mostrarInfo() {
    return "PELÍCULA: $nombre - Director: $director - Duración: ${duracion}min - Precio: \$$precio";
  }
}

// Videojuego
class Videojuego extends ItemReservable {
  String plataforma;
  String genero;

  Videojuego(String nombre, double precio, this.plataforma, this.genero) 
      : super(nombre, precio);

  @override
  String mostrarInfo() {
    return "VIDEOJUEGO: $nombre - Plataforma: $plataforma - Género: $genero - Precio: \$$precio";
  }
}

// Función que procesa lista mezclada
void mostrarReporte(List<ItemReservable> items) {
  print("=== REPORTE DE ITEMS ===");
  for (var item in items) {
    print(item.mostrarInfo());
  }
}

void main() {
  // Lista mezclada de diferentes tipos
  List<ItemReservable> items = [
    Libro("El Quijote", 15.99, "Cervantes", 863),
    Pelicula("Titanic", 8.50, "James Cameron", 194),
    Videojuego("Mario Kart", 59.99, "Nintendo Switch", "Carreras"),
    Libro("1984", 12.00, "George Orwell", 328),
    Pelicula("Avatar", 9.99, "James Cameron", 162),
  ];

  // Mostrar reporte
  mostrarReporte(items);

  print("\n=== CADA ITEM SE IMPRIME DISTINTO ===");
  for (var item in items) {
    print(item.mostrarInfo());
  }
}
