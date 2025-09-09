abstract class Operacion {
  void ejecutar();
}

class PagoTarjeta implements Operacion {
  @override
  void ejecutar() {
    print("Pago con tarjeta validado y cobrado.");
  }
}

class PagoEfectivo implements Operacion {
  @override
  void ejecutar() {
    print("Pago en efectivo recibido.");
  }
}

mixin Registrable {
  void registrarEvento(String msg) {
    print("Registrado: $msg");
  }
}

mixin ConUbicacion {
  String? ubicacion;
  void reportarUbicacion() {
    if (ubicacion != null) {
      print("Ubicación: $ubicacion");
    } else {
      print("Sin ubicación definida.");
    }
  }
}

class Gestor {
  List<Operacion> _items = [];

  void agregar(Operacion o) => _items.add(o);
  void ejecutarTodo() {
    for (var o in _items) {
      o.ejecutar();
    }
  }
}

void generarReporte(List<Operacion> items) {
  for (var o in items) {
    print(">>> ${o.runtimeType} ejecutando:");
    o.ejecutar();
    print("---");
  }
}

class Sensor with Registrable, ConUbicacion {}
class Vehiculo with ConUbicacion {}

void main() {
  var tarjeta = PagoTarjeta();
  var efectivo = PagoEfectivo();

  var gestor = Gestor();
  gestor.agregar(tarjeta);
  gestor.agregar(efectivo);

  print("=== GESTOR ===");
  gestor.ejecutarTodo();

  print("\n=== REPORTE ===");
  generarReporte([tarjeta, efectivo]);

  print("\n=== PODERES TRANSVERSALES ===");
  var s = Sensor()..ubicacion = "Sala 3";
  s.registrarEvento("Sensor activado");
  s.reportarUbicacion();

  var v = Vehiculo()..ubicacion = "Av. Central";
  v.reportarUbicacion();
}
