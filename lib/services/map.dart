import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map/plugin_api.dart';

class Map extends StatefulWidget {
  const Map({super.key});

  @override
  State<Map> createState() => _MapState();
}

class _MapState extends State<Map> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Flexible(
        child: FlutterMap(
          options: MapOptions(
            center: LatLng(13.629065, 79.424446),
            zoom: 4.6,
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'com.example.app',
            ),
            MarkerLayer(
              markers: [
                Marker(
                  point: LatLng(13.629065, 79.424446),
                  builder: (context) => Icon(
                    Icons.pin_drop,
                    color: Colors.pinkAccent[400],
                    size: 30.0,
                  )
                )
              ]
            )
          ],
        ),
      ),
    );
  }
}