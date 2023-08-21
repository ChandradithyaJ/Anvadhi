import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map/plugin_api.dart';
import './art_details.dart';

class MapPage extends StatefulWidget {
  Map<String, dynamic> selectedArtForm;
  List<Map<String, dynamic>> ArtForms;

  MapPage({required this.ArtForms, required this.selectedArtForm}) : super();

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final TextEditingController artController = TextEditingController();

  // configure year range
  RangeValues yearRange = const RangeValues(0, 2000);

  // change detector
  bool changedDropdown = true;

  @override
  Widget build(BuildContext context) {
    // sort all art forms lexicographically
    widget.ArtForms.sort((a, b) => a['artName'].compareTo(b['artName']));

    // filter art forms in the time range
    List<Map<String, dynamic>> currentArtForms = [];
    for (dynamic af in widget.ArtForms) {
      if (af['year'] >= yearRange.start && af['year'] <= yearRange.end) {
        currentArtForms.add(af);
      }
    }

    if (currentArtForms.isNotEmpty && !changedDropdown) {
      widget.selectedArtForm = currentArtForms[0];
    }

    /** Error Handling **/
    if (currentArtForms.isEmpty) {
      return Center(
        child: Column(
          children: [
            const SizedBox(
              height: 40.0,
            ),
            const Text(
              'No art forms to display',
              style: TextStyle(color: Colors.teal, fontSize: 30.0),
            ),
            SliderTheme(
              data: const SliderThemeData(
                  showValueIndicator: ShowValueIndicator.onlyForDiscrete),
              child: RangeSlider(
                values: yearRange,
                min: 0,
                max: 2000,
                divisions: 100,
                labels: RangeLabels(yearRange.start.round().toString(),
                    yearRange.end.round().toString()),
                onChanged: (RangeValues values) {
                  setState(() {
                    changedDropdown = false;
                    yearRange = values;
                  });
                },
              ),
            )
          ],
        ),
      );
    }

    // get latitude and longitude
    double lat = widget.selectedArtForm['latlong'].latitude;
    double lng = widget.selectedArtForm['latlong'].longitude;

    return Container(
      margin: const EdgeInsets.fromLTRB(0, 13.0, 0, 0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DropdownButton(
                hint: const Text('Art Form'),
                value: widget.selectedArtForm['artName'],
                onChanged: (newVal) {
                  if (newVal != null) {
                    setState(() {
                      changedDropdown = true;
                      widget.selectedArtForm = widget.ArtForms.firstWhere(
                          (element) => element['artName'] == newVal);
                    });
                  }
                },
                items: currentArtForms.map((af) {
                  return DropdownMenuItem(
                    value: af['artName'],
                    child: Text('${af['artName']}'),
                  );
                }).toList(),
              ),
              const SizedBox(width: 10.0,),
              Text(
                widget.selectedArtForm['year'].toString()
              ),
              const SizedBox(width: 20.0,),
              ElevatedButton(
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ArtDetails(artForm: widget.selectedArtForm),
                    ),
                  );
                },
                child: const Icon(
                  Icons.arrow_circle_right_outlined,
                  semanticLabel: 'Learn',
                ),
              )
            ],
          ),

          /** Flutter Map **/
          Flexible(
            child: FlutterMap(
              options: MapOptions(
                center: LatLng(lat, lng),
                zoom: 4.6,
              ),
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'com.example.app',
                ),
                MarkerLayer(markers: [
                  Marker(
                      point: LatLng(lat, lng),
                      builder: (context) => Icon(
                            Icons.pin_drop,
                            color: Colors.pinkAccent[400],
                            size: 30.0,
                          ))
                ])
              ],
            ),
          ),

          /** Year Slider **/
          SliderTheme(
            data: const SliderThemeData(
                showValueIndicator: ShowValueIndicator.onlyForDiscrete),
            child: RangeSlider(
              values: yearRange,
              min: 0,
              max: 2000,
              divisions: 100,
              labels: RangeLabels(yearRange.start.round().toString(),
                  yearRange.end.round().toString()),
              onChanged: (RangeValues values) {
                setState(() {
                  changedDropdown = false;
                  yearRange = values;
                });
              },
            ),
          )
        ],
      ),
    );
  }
}
