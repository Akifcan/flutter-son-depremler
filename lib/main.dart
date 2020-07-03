import 'package:earthquakes/views/earthquake_on_map.dart';
import 'package:earthquakes/views/home.dart';
import 'package:earthquakes/views/show_all_earthquakes.dart';
import 'package:earthquakes/views/what_is_earthquake.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Depremler',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.red[900]
      ),
      home: Home(),
      routes: {
        '/show-all-earthquakes': (context) => ShowAllEarthquakes(),
        '/earthquake-on-map': (context) => EarthquakeOnMap(),
        '/what-is-earthquake': (context) => WhatIsEarthquake()
      },
    );
  }
}
