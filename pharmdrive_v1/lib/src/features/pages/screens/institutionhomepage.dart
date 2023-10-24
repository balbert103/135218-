import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class InstitutionHomePage extends StatelessWidget {
  const InstitutionHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Institution Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Welcome to the Institution Home Page!',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Add logic for institution-specific actions here
              },
              child: const Text('Institution Action'),
            ),
            const SizedBox(height: 20),
            Container(
              width: 300,
              height: 300,
              child: FlutterMap(
                options: const MapOptions(
                  center: LatLng(51.5, -0.09),
                  zoom: 13.0,
                ),
                Layers: [
                  TileLayerOptions(
                    urlTemplate:
                        "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                    subdomains: ['a', 'b', 'c'],
                  ),
                ],
                children: [],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


