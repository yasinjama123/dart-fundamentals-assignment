import 'dart:async';

// Bonus: Custom Exception for Input Validation
class InvalidOperationException implements Exception {
  final String message;
  InvalidOperationException(this.message);
  @override
  String toString() => 'InvalidOperationException: $message';
}

class Calculator {
  final String name;
  // Bonus: History Log (2 pts)
  final List<String> history = [];

  Calculator(this.name);

  // Synchronous Methods
  double add(double a, double b) => a + b;
  double subtract(double a, double b) => a - b;
  double multiply(double a, double b) => a * b;
  double divide(double a, double b) {
    if (b == 0) throw ArgumentError('Cannot divide by zero.');
    return a / b;
  }

  // Bonus: Chain Operations (3 pts)
  Future<double> computeChained(List<double> values, String op) async {
    if (values.isEmpty) return 0.0;
    double total = values[0];
    for (int i = 1; i < values.length; i++) {
      total = await computeAsync(total, values[i], op);
    }
    return total;
  }

  Future<double> computeAsync(double a, double b, String operation) async {
    double result;
    
    // Bonus: Input Validation (2 pts)
    final validOps = ['add', 'subtract', 'multiply', 'divide'];
    if (!validOps.contains(operation.toLowerCase())) {
      throw InvalidOperationException('"$operation" is not a supported operation.');
    }

    switch (operation.toLowerCase()) {
      case 'add': result = add(a, b); break;
      case 'subtract': result = subtract(a, b); break;
      case 'multiply': result = multiply(a, b); break;
      case 'divide': result = divide(a, b); break;
      default: result = 0.0;
    }

    await Future.delayed(Duration(seconds: 1, milliseconds: 500));
    
    // Log to history
    history.add('$operation($a, $b) = $result');
    return result;
  }

  Future<void> displayResult(String operation, double a, double b) async {
    try {
      double result = await computeAsync(a, b, operation);
      print('[$name] $a ${operation.toUpperCase()} $b = $result');
    } catch (e) {
      print('[$name] Error: ${e.toString()}');
    }
  }

  // Bonus: History Print (2 pts)
  void printHistory() {
    print('\n--- Calculation History ---');
    if (history.isEmpty) print('No history recorded.');
    for (var entry in history) print(entry);
  }
}

void main() async {
  final myCalc = Calculator('Pro-Calc');
  final stopwatch = Stopwatch()..start();

  print('--- Executing Parallel Futures ---');
  // Bonus: Parallel Futures (3 pts)
  // Instead of awaiting one by one, we run them simultaneously.
  await Future.wait([
    myCalc.displayResult('add', 10, 5),
    myCalc.displayResult('multiply', 4, 3),
    myCalc.displayResult('divide', 20, 4),
    myCalc.displayResult('subtract', 50, 10),
  ]);

  stopwatch.stop();
  print('Total time taken: ${stopwatch.elapsed.inSeconds} seconds.');
  print('Note: Running 4 tasks (1.5s each) in parallel takes ~1.5s total.');

  // Test Chained Operation
  double chainSum = await myCalc.computeChained([1, 2, 3, 4], 'add');
  print('\nChained Addition Result: $chainSum');

  myCalc.printHistory();
}
