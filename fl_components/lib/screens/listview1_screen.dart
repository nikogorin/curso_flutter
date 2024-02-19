import 'package:flutter/material.dart';

class Listview1Screen extends StatelessWidget {
  const Listview1Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final options = ['Megaman', 'Metal Gear', 'Super Smash', 'Final Fantasy'];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Listview Tipo 1'),
      ),
      body: ListView(
        children: [
          ...options
              .map((game) => ListTile(
                    leading: const Icon(Icons.access_alarm_outlined),
                    title: Text(game),
                    trailing: const Icon(Icons.arrow_forward_ios_outlined),
                  ))
              .toList(),
        ],
      ),
    );
  }
}
