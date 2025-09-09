mixin RegistradorEventos {
  List<String> _eventos = [];

  void registrar(String evento) {
    _eventos.add(evento);
    print("Evento registrado: $evento");
  }

  void mostrarEventos() {
    print("Eventos: $_eventos");
  }
}

mixin Encendible on DispositivoBase {
  void encender() {
    encendido = true;
    print("$nombre encendido.");
  }

  void apagar() {
    encendido = false;
    print("$nombre apagado.");
  }
}

abstract class DispositivoBase {
  String nombre;
  bool encendido = false;

  DispositivoBase(this.nombre);
}

class Lampara extends DispositivoBase with RegistradorEventos, Encendible {
  Lampara(String nombre) : super(nombre);
}


class Camara extends DispositivoBase with RegistradorEventos, Encendible {
  Camara(String nombre) : super(nombre);
}

class Usuario with RegistradorEventos {
  String nombre;
  Usuario(this.nombre);
}

void main() {
  var lampara = Lampara("Lámpara Sala");
  var camara = Camara("Cámara Patio");
  var usuario = Usuario("Ana");

  print("=== USANDO LÁMPARA ===");
  lampara.encender();
  lampara.registrar("Luz encendida en la sala");
  lampara.mostrarEventos();

  print("\n=== USANDO CÁMARA ===");
  camara.encender();
  camara.registrar("Movimiento detectado");
  camara.apagar();
  camara.mostrarEventos();

  print("\n=== USANDO USUARIO ===");
  usuario.registrar("Usuario inició sesión");
  usuario.registrar("Usuario cambió contraseña");
  usuario.mostrarEventos();
}
