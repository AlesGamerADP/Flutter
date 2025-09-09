class Descripcion {
  String titulo;

  Descripcion(this.titulo);

  String mostrar() {
    return "Título: $titulo";
  }
}

class DescripcionConAutor extends Descripcion {
  String autor;

  DescripcionConAutor(String titulo, this.autor) : super(titulo);

  @override
  String mostrar() {
    String base = super.mostrar();
    return "$base\nAutor: $autor";
  }
}

void main() {
  var simple = Descripcion("Manual de usuario");
  var extendida = DescripcionConAutor("Guía de Flutter", "Ana Pérez");

  print("=== DESCRIPCIÓN SIMPLE ===");
  print(simple.mostrar());

  print("\n=== DESCRIPCIÓN EXTENDIDA ===");
  print(extendida.mostrar());
}
