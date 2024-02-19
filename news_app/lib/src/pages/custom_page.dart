import 'package:flutter/material.dart';

class CustomPage extends StatelessWidget {
  const CustomPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('DropdownButtonFormField con valor inicial'),
        ),
        body: MyForm(),
      ),
    );
  }
}

class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  List<DropdownMenuItem<int>> asd = [
      DropdownMenuItem(value: 2, child: Text("Femenino")),
      DropdownMenuItem(value: 1, child: Text("Masculino")),
      DropdownMenuItem(value: 3, child: Text("No binario")),
      DropdownMenuItem(value: 0, child: Text("Prefiero no decirlo")),
    ];
  DropdownMenuItem<int> _selectedItem = DropdownMenuItem<int>(value: 3, child: Text("No binario")); // Valor inicial

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(16.0),
          child: DropdownButtonFormField<int>(
            value: _selectedItem.value, // Valor inicial
            onChanged: (int? newValue) {
              var asd2 = asd.firstWhere((element) => element.value == 1);
            },
            items: [
              DropdownMenuItem(value: 2, child: Text("Femenino")),
              DropdownMenuItem(value: 1, child: Text("Masculino")),
              DropdownMenuItem(value: 3, child: Text("No binario")),
              DropdownMenuItem(value: 0, child: Text("Prefiero no decirlo")),
            ],
            decoration: InputDecoration(
              labelText: 'Selecciona una opción',
              border: OutlineInputBorder(),
            ),
          ),
        ),
        
      ],
    );
  }
}