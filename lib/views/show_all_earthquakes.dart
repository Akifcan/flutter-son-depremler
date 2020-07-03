import 'dart:async';

import 'package:earthquakes/helpers/map_helpers.dart';
import 'package:earthquakes/models/Earthquake.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ShowAllEarthquakes extends StatefulWidget {
  ShowAllEarthquakes({Key key}) : super(key: key);

  @override
  _ShowAllEarthquakesState createState() => _ShowAllEarthquakesState();
}

class _ShowAllEarthquakesState extends State<ShowAllEarthquakes> {
  List<Marker> markers = [];
  Earthquake earthquake = Earthquake();

  @override
  void initState() {
    super.initState();
    earthquake.getAll().then((response) {
      response.forEach((value) {
        setState(() {
          markers.add(new Marker(
            markerId: MarkerId(UniqueKey().toString()),
            infoWindow: InfoWindow(
                title: value.place,
                snippet: 'Şiddet: ${value.ml}, Derinlik: ${value.depth}',
                onTap: () {
                  showDetailsOnBrowser(value.place);
                }),
            position: LatLng(
                double.parse(value.latitude), double.parse(value.longitude)),
          ));
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
          initialCameraPosition:
              CameraPosition(target: LatLng(38.423733, 27.142826), zoom: 8),
          mapType: MapType.terrain,
          myLocationEnabled: true,
          myLocationButtonEnabled: true,
          markers: Set.of(markers)),
    );
  }
}
