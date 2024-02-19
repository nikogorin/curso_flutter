import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int counter = 0;
    TextStyle fontSize30 = const TextStyle(fontSize: 30, color: Colors.blue);

    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeScreen'),
        elevation: 0.0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Número de tabs', style: fontSize30),
            Text('$counter', style: fontSize30)
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            counter++;
            print('Counter: $counter');
          }),
    );
  }
}
