// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/pages/pages.dart';
import 'package:qr_reader/providers/scan_list_provider.dart';
import 'package:qr_reader/providers/ui_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UiProvider()),
        ChangeNotifierProvider(create: (_) => ScanListProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'QR Reader',
        initialRoute: 'home',
        routes: {
          'home': (_) => HomePage(),
          'map': (_) => MapPage(),
        },
        theme: ThemeData(
          primaryColor: Colors.deepPurple,
          colorScheme: const ColorScheme.light().copyWith(
            primary: Colors.deepPurple,
          ),
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
              backgroundColor: Colors.deepPurple),
        ),
      ),
    );
  }
}
