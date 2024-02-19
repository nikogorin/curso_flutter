import 'package:fl_components/widgets/widgets.dart';
import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class InputsScreen extends StatefulWidget {
  @override
  State<InputsScreen> createState() => _InputsScreenState();
}

class _InputsScreenState extends State<InputsScreen> {
  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
      value: item,
      child: Text(item,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)));
  String? _value;
  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> myFormKey = GlobalKey<FormState>();

    final Map<String, String> formValues = {
      'first_name': 'Nicolas',
      'last_name': 'Password',
      'email': 'npiccolini@hexacta.com',
      'password': '123456',
      'role': 'Admin',
    };
    final items = ['No Item', 'Item 1', 'Item 2', 'Item 3'];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Inputs y Forms'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          child: Form(
            key: myFormKey,
            child: Column(
              children: [
                CustomInputField(
                  labelText: 'Nombre',
                  hintText: 'Nombre del usuario',
                  formProperty: 'first_name',
                  formValues: formValues,
                ),
                const SizedBox(height: 30),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      border: Border.all(color: Colors.indigo, width: 1)),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      value: _value,
                      isExpanded: true,
                      iconSize: 36,
                      icon: const Icon(Icons.arrow_drop_down,
                          color: Colors.indigo),
                      items: items.map(buildMenuItem).toList(),
                      onChanged: (String? value) =>
                          {setState(() => _value = value), print(_value)},
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                CustomInputField(
                  labelText: 'Apellido',
                  hintText: 'Apellido del usuario',
                  formProperty: 'last_name',
                  formValues: formValues,
                ),
                const SizedBox(height: 30),
                CustomInputField(
                  labelText: 'Correo',
                  hintText: 'Correo del usuario',
                  textInputType: TextInputType.emailAddress,
                  formProperty: 'email',
                  formValues: formValues,
                ),
                const SizedBox(height: 30),
                CustomInputField(
                  labelText: 'Contraseña',
                  hintText: 'Contraseña del usuario',
                  obscureText: true,
                  formProperty: 'password',
                  formValues: formValues,
                ),
                const SizedBox(height: 30),
                DropdownButtonFormField<String>(
                    items: const [
                      DropdownMenuItem(value: 'Admin', child: Text('Admin')),
                      DropdownMenuItem(
                          value: 'Superuser', child: Text('Superuser')),
                      DropdownMenuItem(
                          value: 'Development', child: Text('Development')),
                    ],
                    onChanged: (value) {
                      formValues['role'] = value ?? 'Admin';
                    }),
                const SizedBox(height: 30),
                ElevatedButton(
                  child: const SizedBox(
                    width: double.infinity,
                    child: Text('Guardar'),
                  ),
                  onPressed: () {
                    FocusScope.of(context).requestFocus(FocusNode());
                    if (!myFormKey.currentState!.validate()) {
                      print('Formulario no valido!');
                      return;
                    }
                    // imprimir valores del formulario
                    print(formValues);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
