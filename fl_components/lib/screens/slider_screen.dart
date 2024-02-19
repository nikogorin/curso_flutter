import 'package:fl_components/theme/app_theme.dart';
import 'package:flutter/material.dart';

class SliderScreen extends StatefulWidget {
  const SliderScreen({Key? key}) : super(key: key);

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  double _sliderValue = 100;
  bool _sliderEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Slider & Checks'),
      ),
      body: Column(
        children: [
          Slider.adaptive(
              min: 50,
              max: 400,
              activeColor: AppTheme.primary,
              value: _sliderValue,
              onChanged: _sliderEnabled
                  ? (value) {
                      _sliderValue = value;
                      setState(() {});
                    }
                  : null),
          // Checkbox(
          //     value: _sliderEnabled,
          //     activeColor: AppTheme.primary,
          //     onChanged: (value) {
          //       _sliderEnabled = value ?? true;
          //       setState(() {});
          //     }),
          // Switch(
          //   value: _sliderEnabled,
          //   activeColor: AppTheme.primary,
          //   onChanged: (value) => setState(() {
          //     _sliderEnabled = value;
          //   }),
          // ),
          CheckboxListTile(
            title: const Text('Habilitar Slider'),
            value: _sliderEnabled,
            activeColor: AppTheme.primary,
            onChanged: (value) => setState(() {
              _sliderEnabled = value ?? true;
            }),
          ),
          SwitchListTile.adaptive(
            title: const Text('Habilitar Slider'),
            value: _sliderEnabled,
            activeColor: AppTheme.primary,
            onChanged: (value) => setState(() {
              _sliderEnabled = value;
            }),
          ),
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              width: 200,
              child: ListTile(
                onTap: () => setState(() {
                  _sliderEnabled = !_sliderEnabled;
                }),
                trailing: const Text('Habilitar Slider 2'),
                leading: Checkbox(
                  //title: const Text('Habilitar Slider 2'),
                  value: _sliderEnabled,
                  activeColor: AppTheme.primary,
                  onChanged: (value) => setState(() {
                    _sliderEnabled = value ?? true;
                  }),
                ),
              ),
            ),
          ),
          const AboutListTile(),
          Expanded(
            child: SingleChildScrollView(
              child: Image(
                image: const NetworkImage(
                    'https://www.pngplay.com/wp-content/uploads/6/Comic-Batman-Standing-Vector-Transparent-PNG.png'),
                fit: BoxFit.contain,
                width: _sliderValue,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
