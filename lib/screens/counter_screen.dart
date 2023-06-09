import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int counter = 0;

  void decrease() => setState(() => counter--);
  void reset() => setState(() => counter = 0);
  void increase() => setState(() => counter++);

  @override
  Widget build(BuildContext context) {
    TextStyle fontSize30 = const TextStyle(fontSize: 30);

    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          "Counter Screen",
          style: fontSize30,
        )),
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Número de clicks: ",
              style: fontSize30,
            ),
            Text("$counter", style: fontSize30),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CustomFloatingActions(
        decreaseFn: decrease,
        resetFn: reset,
        increaseFn: increase,
      ),
    );
  }
}

class CustomFloatingActions extends StatelessWidget {
  final Function decreaseFn;
  final Function resetFn;
  final Function increaseFn;

  const CustomFloatingActions({
    super.key,
    required this.decreaseFn,
    required this.resetFn,
    required this.increaseFn,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        FloatingActionButton(
          child: const Icon(Icons.exposure_minus_1_outlined),
          onPressed: () => decreaseFn(),
        ),
        FloatingActionButton(
          child: const Icon(Icons.restart_alt),
          onPressed: () => resetFn(),
        ),
        FloatingActionButton(
          child: const Icon(Icons.exposure_plus_1_outlined),
          onPressed: () => increaseFn(),
        ),
      ],
    );
  }
}
