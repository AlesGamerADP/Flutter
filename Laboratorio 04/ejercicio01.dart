class Vehiculo {
  String marca;
  String modelo;
  String origen;

  Vehiculo(this.marca, this.modelo, this.origen);

  String fichaTecnica() {
    return "Marca: $marca\nModelo: $modelo\nOrigen: $origen";
  }
}

class AutoElectrico extends Vehiculo {
  String energia;

  AutoElectrico(String marca, String modelo, String origen, this.energia)
      : super(marca, modelo, origen);

  @override
  String fichaTecnica() {
    String base = super.fichaTecnica();
    return "$base\nEnergía: $energia";
  }
}

class Camion extends Vehiculo {
  int capacidadCarga;

  Camion(String marca, String modelo, String origen, this.capacidadCarga)
      : super(marca, modelo, origen);

  @override
  String fichaTecnica() {
    String base = super.fichaTecnica();
    return "$base\nCapacidad de carga: $capacidadCarga toneladas";
  }
}

void main() {
  var tesla = AutoElectrico("Tesla", "Model 3", "Estados Unidos", "Batería de 75 kWh");
  var volvo = Camion("Volvo", "FH16", "Suecia", 25);

  print("=== FICHA 1 ===");
  print(tesla.fichaTecnica());
  print("\n=== FICHA 2 ===");
  print(volvo.fichaTecnica());
}
