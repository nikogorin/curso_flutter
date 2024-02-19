import 'dart:async';

import 'package:flutter/material.dart';
import 'package:qr_reader/models/scan_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// ignore: use_key_in_widget_constructors
class MapPage extends StatefulWidget {
  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  Completer<GoogleMapController> _controller = Completer();
  MapType mapType = MapType.normal;
  @override
  Widget build(BuildContext context) {
    final ScanModel scan =
        ModalRoute.of(context)!.settings.arguments as ScanModel;
    final CameraPosition puntoInicial = CameraPosition(
      target: scan.getLatLng(),
      zoom: 17.5,
      tilt: 50,
    );

    // Marcadores
    Set<Marker> markers = new Set<Marker>();
    markers.add(Marker(
        markerId: MarkerId('geo-location-central'),
        position: scan.getLatLng()));

    return Scaffold(
      appBar: AppBar(
        title: Text('Mapa'),
        actions: [
          IconButton(
            onPressed: () async {
              final GoogleMapController controller = await _controller.future;
              controller.animateCamera(
                CameraUpdate.newCameraPosition(
                  CameraPosition(
                      target: scan.getLatLng(), zoom: 17.5, tilt: 50),
                ),
              );
            },
            icon: Icon(Icons.location_disabled),
          ),
        ],
      ),
      body: GoogleMap(
        myLocationButtonEnabled: false,
        markers: markers,
        mapType: mapType,
        initialCameraPosition: puntoInicial,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.layers,
          color: Colors.white,
        ),
        onPressed: () {
          if (mapType == MapType.normal) {
            mapType = MapType.satellite;
          } else {
            mapType = MapType.normal;
          }

          setState(() {});
        },
      ),
    );
  }
}
