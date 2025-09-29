import 'package:flutter/material.dart';

void main() {
  runApp(const CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      home: const CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _output = "0";
  String _expression = "";

  void _onButtonPressed(String buttonText) {
    setState(() {
      if (buttonText == "C") {
        _output = "0";
        _expression = "";
      } else if (buttonText == "=") {
        try {
          // Reemplazar 'x' por '*' para evaluar
          String finalExpression = _expression.replaceAll('x', '*');
          finalExpression = finalExpression.replaceAll('÷', '/');

          // Usamos la librería "expression_language" o "math_expressions"
          // pero aquí hacemos un "eval" sencillo con Dart (NO en prod real).
          _output = _evaluate(finalExpression).toString();
          _expression = _output;
        } catch (e) {
          _output = "Error";
        }
      } else {
        if (_expression.isEmpty && "/*x+-".contains(buttonText)) {
          // No permitir empezar con operador
          return;
        }
        _expression += buttonText;
        _output = _expression;
      }
    });
  }

  /// Evaluador básico de expresiones
  double _evaluate(String expression) {
    // NOTA: en un proyecto real usar librerías como "math_expressions"
    try {
      final exp = expression;
      final result = _simpleEval(exp);
      return result;
    } catch (e) {
      throw Exception("Invalid Expression");
    }
  }

  double _simpleEval(String expr) {
    // Pequeño parser simplificado
    expr = expr.replaceAll(" ", "");
    List<String> tokens = _tokenize(expr);

    // primero * y /
    for (int i = 0; i < tokens.length; i++) {
      if (tokens[i] == "*" || tokens[i] == "/") {
        double left = double.parse(tokens[i - 1]);
        double right = double.parse(tokens[i + 1]);
        double res = tokens[i] == "*" ? left * right : left / right;
        tokens.replaceRange(i - 1, i + 2, [res.toString()]);
        i = 0;
      }
    }

    // luego + y -
    double result = double.parse(tokens[0]);
    for (int i = 1; i < tokens.length; i += 2) {
      String op = tokens[i];
      double val = double.parse(tokens[i + 1]);
      if (op == "+") result += val;
      if (op == "-") result -= val;
    }
    return result;
  }

  List<String> _tokenize(String expr) {
    final regex = RegExp(r"(\d+\.?\d*|\+|\-|\*|/)");
    return regex.allMatches(expr).map((m) => m.group(0)!).toList();
  }

  Widget _buildButton(String buttonText, {Color? color}) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: color ?? Colors.blue,
            padding: const EdgeInsets.all(20),
          ),
          onPressed: () => _onButtonPressed(buttonText),
          child: Text(
            buttonText,
            style: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Responsive con MediaQuery
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          // Pantalla
          Expanded(
            flex: 2,
            child: Container(
              width: double.infinity,
              color: Colors.black87,
              padding: const EdgeInsets.all(16.0),
              alignment: Alignment.bottomRight,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                reverse: true,
                child: Text(
                  _output,
                  style: TextStyle(
                    fontSize: screenHeight * 0.05,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.right,
                ),
              ),
            ),
          ),

          // Botones
          Expanded(
            flex: 5,
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    _buildButton('7'),
                    _buildButton('8'),
                    _buildButton('9'),
                    _buildButton('÷', color: Colors.orange),
                  ],
                ),
                Row(
                  children: <Widget>[
                    _buildButton('4'),
                    _buildButton('5'),
                    _buildButton('6'),
                    _buildButton('x', color: Colors.orange),
                  ],
                ),
                Row(
                  children: <Widget>[
                    _buildButton('1'),
                    _buildButton('2'),
                    _buildButton('3'),
                    _buildButton('-', color: Colors.orange),
                  ],
                ),
                Row(
                  children: <Widget>[
                    _buildButton('C', color: Colors.red),
                    _buildButton('0'),
                    _buildButton('=', color: Colors.green),
                    _buildButton('+', color: Colors.orange),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
