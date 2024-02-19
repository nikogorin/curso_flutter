import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/pages/pages.dart';
import 'package:qr_reader/providers/scan_list_provider.dart';
import 'package:qr_reader/providers/ui_provider.dart';
import 'package:qr_reader/widgets/widgets.dart';

// ignore: use_key_in_widget_constructors
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Historial'),
        actions: [
          IconButton(
            onPressed: () => {
              Provider.of<ScanListProvider>(context, listen: false)
                  .borrarTodos()
            },
            icon: const Icon(Icons.delete_forever),
          )
        ],
      ),
      body: _HomePageBody(),
      bottomNavigationBar: CustomNavigationBar(),
      floatingActionButton: ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Obtener el selected menu opt
    final uiProvider = Provider.of<UiProvider>(context);
    final scanListProvider = Provider.of<ScanListProvider>(context);

    switch (uiProvider.selectedMenuOpt) {
      case 0:
        scanListProvider.cargarScanPorTipo('geo');
        return MapsPage();
      case 1:
        scanListProvider.cargarScanPorTipo('http');
        return DirectionsPage();
      default:
        scanListProvider.cargarScanPorTipo('geo');
        return MapsPage();
    }
  }
}
