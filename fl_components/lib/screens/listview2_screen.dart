import 'package:flutter/material.dart';

class Listview2Screen extends StatelessWidget {
  const Listview2Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final options = ['Megaman', 'Metal Gear', 'Super Smash', 'Final Fantasy'];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Listview Tipo 1'),
      ),
      body: ListView.separated(
          itemBuilder: (context, index) => ListTile(
                leading: const Icon(
                  Icons.access_alarm_outlined,
                  color: Colors.indigo,
                ),
                title: Text(options[index]),
                trailing: const Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: Colors.indigo,
                ),
                onTap: () {
                  final game = options[index];
                  print(game);
                },
              ),
          separatorBuilder: (_, __) => const Divider(),
          itemCount: options.length),
    );
  }
}
