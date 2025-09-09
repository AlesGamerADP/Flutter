abstract class MetodoCobro {
  void cobrar(double monto) {
    validar(monto);
    ejecutar(monto);
    confirmar(monto);
  }

  void validar(double monto) {
    print("Validando monto: \$$monto");
  }

  void confirmar(double monto) {
    print("Confirmando transacción de \$$monto\n");
  }

  void ejecutar(double monto); 
}


class CobroTarjeta extends MetodoCobro {
  @override
  void ejecutar(double monto) {
    print("Procesando pago con tarjeta por \$$monto...");
  }
}

class CobroPayPal extends MetodoCobro {
  @override
  void ejecutar(double monto) {
    print("Procesando pago con PayPal por \$$monto...");
  }
}

void procesarPago(MetodoCobro metodo, double monto) {
  metodo.cobrar(monto);
}

void main() {
  var tarjeta = CobroTarjeta();
  var paypal = CobroPayPal();

  print("=== PAGO 1 ===");
  procesarPago(tarjeta, 150.0);

  print("=== PAGO 2 ===");
  procesarPago(paypal, 75.0);
}
