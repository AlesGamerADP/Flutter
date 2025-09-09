mixin PoderA {
  void accion() {
    print("Acción desde PoderA");
  }
}

mixin PoderB {
  void accion() {
    print("Acción desde PoderB");
  }
}

class Entidad with PoderA, PoderB {
  @override
  void accion() {
    print("Acción final de Entidad (resolviendo el choque)");
  }
}

void main() {
  var e = Entidad();
  e.accion(); 
}
