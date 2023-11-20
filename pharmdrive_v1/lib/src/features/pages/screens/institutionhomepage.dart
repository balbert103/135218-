import 'package:flutter/material.dart';
import 'package:latlng/latlng.dart';

import 'package:pharmdrive_v1/src/features/pages/screens/my_input.dart';
import 'package:geocoding/geocoding.dart';
import 'package:latlong2/latlong.dart' as Latlng;
import 'package:flutter_map/flutter_map.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class InstitutionHomePage extends StatelessWidget {
  const InstitutionHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final start = TextEditingController();
  final end = TextEditingController();
  bool isVisible = false;

  List<LatLng> routepoints = [LatLng(52.05884, -1.345583)];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('PharmaDrive')),
      backgroundColor: Colors.grey[300],
      body: SafeArea(
          child: Column(
        children: [
          myInput(controller: start, hint: 'Enter current location'),
          const SizedBox(
            height: 15,
          ),
          myInput(controller: end, hint: 'Enter destination'),
          const SizedBox(
            height: 15,
          ),
          ElevatedButton(
              style:
                  ElevatedButton.styleFrom(backgroundColor: Colors.grey[500]),
              onPressed: () async {
                List<Location> start_l = await locationFromAddress(start.text);
                List<Location> end_l = await locationFromAddress(end.text);

                var v1 = start_l[0].latitude;
                var v2 = start_l[0].longitude;
                var v3 = end_l[0].latitude;
                var v4 = end_l[0].longitude;

                var url = Uri.parse(
                    'http://router.project-osrm.org/route/v1/driving/$v2,$v1;$v4,$v3?steps=true&annotations=true&geometries=geojson');
                var response = await http.get(url);

                setState(() {
                  routepoints = [];

                  var ruter = jsonDecode(response.body)['routes'][0]['geometry']
                      ['coordinates'];

                  for (int i = 0; i < ruter.length; i++) {
                    var reep = ruter[i].toString();
                    reep = reep.replaceAll("[", "");
                    reep = reep.replaceAll("]", "");

                    var lat1 = reep.split(",");
                    var long1 = reep.split(",");
                    routepoints.add(
                        LatLng(double.parse(lat1[1]), double.parse(long1[1])));
                  }

                  print(routepoints);
                  isVisible = !isVisible;
                });
              },
              child: Text('Set')),
        ],
      )),
    );
  }
}
