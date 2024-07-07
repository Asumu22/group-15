// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart' as ll;

class DynamicMap extends StatefulWidget {
  const DynamicMap({
    super.key,
    this.width,
    this.height,
    this.points,
    required this.accessToken,
    required this.startingPoint,
    required this.startingZoom,
  });

  final double? width;
  final double? height;
  final List<LatLng>? points;
  final String accessToken;
  final LatLng startingPoint;
  final double startingZoom;

  @override
  State<DynamicMap> createState() => _DynamicMapState();
}

class DynamicMapState extends State<DynamicMap> {
  List<Marker> allMarkers = [];

  void initState() {
    //TODO: Implement initState
    super.initState();
    addMarkersToMap(widget.points);
  }

  void addMarkersToMap(List<LatLng>? points) {
    for (LatLng point in points!) {
      allMarkers.add(
        Marker(
          point: ll.latlong(point.latitude, point.longitude),
          height: 12,
          width: 12,
          builder: (BuildContext ctx) => Icon(
            Icons.location_pin,
            color: Colors.red,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        center: ll.LatLng(
            widget.startingPoint.latitude, widget.startingPoint.longitude),
        zoom: widget.startingZoom,
      ),
      children: <Widget>[
        TileLayer(
          urlTemplate:
              "https://api.mapbox.com/styles/v1/asumu/clybwijxe00jt01pi0g3n63o1/tiles/256/{z}/{x}/{y}@2x?access_token=${widget.accessToken}",
        ),
        MarkerLayer(
          markers: allMarkers,
        ),
      ],
    );
  }
}
