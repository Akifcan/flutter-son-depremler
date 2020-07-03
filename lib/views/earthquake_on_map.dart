import 'package:earthquakes/arguments/EarthquakeDetail.dart';
import 'package:earthquakes/helpers/map_helpers.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class EarthquakeOnMap extends StatefulWidget {
  @override
  _EarthquakeOnMapState createState() => _EarthquakeOnMapState();
}

class _EarthquakeOnMapState extends State<EarthquakeOnMap> {
  @override
  Widget build(BuildContext context) {
    final EarthquakeDetail args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
            target: LatLng(args.latitude, args.longitude), zoom: 8),
        markers: {
          Marker(
              markerId: MarkerId(args.place),
              position: LatLng(args.latitude, args.longitude),
              infoWindow: InfoWindow(
                title: args.place,
                snippet: 'Şiddet: ${args.ml}, Derilink: ${args.depth}',
                  onTap: () {
                showDetailsOnBrowser(args.place);
              }
              ),
            )
        },
      ),
    );
  }
}
