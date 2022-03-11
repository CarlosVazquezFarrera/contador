import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({Key? key}) : super(key: key);

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int total = 0;

  @override
  Widget build(BuildContext context) {
    const fontSize30 = TextStyle(fontSize: 30);

    /// Aumenta el valor
    void add() {
      setState(() {
        total++;
      });
    }

    ///Resta el valor
    void sustraction() {
      setState(() {
        total--;
      });
    }

    ///Restaura el valor
    void reset() {
      setState(() {
        total = 0;
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Contador'),
        elevation: 5,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Cantidad de taps', style: fontSize30),
            Text('$total', style: fontSize30),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActions(
        add: add,
        sustraction: sustraction,
        reset: reset,
      ),
    );
  }
}


class FloatingActions extends StatelessWidget {
  const FloatingActions({
    Key? key,
    required this.add,
    required this.sustraction,
    required this.reset,
  }) : super(key: key);

  final Function add;
  final Function sustraction;
  final Function reset;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () => add(),
        ),
        FloatingActionButton(
          child: const Icon(Icons.remove),
          onPressed: () => sustraction(),
        ),
        FloatingActionButton(
          child: const Icon(Icons.restore),
          onPressed: () => reset(),
        ),
      ],
    );
  }
}
