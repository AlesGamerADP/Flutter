class Gestor {
  List<dynamic> elementos = [];

  void agregar(dynamic elem) {
    elementos.add(elem);
  }

  void quitar(dynamic elem) {
    elementos.remove(elem);
  }

  void ejecutarTodos() {
    for (var e in elementos) {
      e.ejecutar();
    }
  }
}

class ItemA {
  void ejecutar() {
    print("ItemA hace su trabajo.");
  }
}

class ItemB {
  void ejecutar() {
    print("ItemB hace otra cosa.");
  }
}

void main() {
  var gestor = Gestor();

  var a = ItemA();
  var b = ItemB();

  gestor.agregar(a);
  gestor.agregar(b);

  print("Ejecutando todo:");
  gestor.ejecutarTodos();

  gestor.quitar(a);
  print("\nDespués de quitar A:");
  gestor.ejecutarTodos();
}
