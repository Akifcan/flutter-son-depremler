import 'dart:convert';

import 'package:http/http.dart' as http;

class Earthquake{
  final String date;
  final String hour;
  final String latitude;
  final String longitude;
  final String depth;
  final String md;
  final String ml;
  final String mw;
  final String place;
  final String solution;
  
  Earthquake({
    this.date, 
    this.hour,
    this.latitude,
    this.longitude,
    this.depth,
    this.md,
    this.ml,
    this.mw,
    this.place,
    this.solution
  });

  factory Earthquake.fromJson(Map json){
    return Earthquake(
      date: json['tarih'],
      hour: json['saat'],
      latitude: json['enlem'],
      longitude: json['boylam'],
      depth: json['derinlik'],
      md: json['md'],
      ml: json['ml'],
      mw: json['mw'],
      place: json['yer'],
      solution: json['solution']
    );
  }

  Future<List<Earthquake>> getAll() async{
    var response = await http.get('https://sea-api-backend.herokuapp.com/api/apis/son-depremler', headers: {
      "apikey": "Sea-Api-98d0cd1315878fc26d2d8470c5c1b7d50db1980380c063cfa3a646fac519cb433eac40274496eced81fe31f3f22fe843"
    });
    List json = jsonDecode(response.body);
    List<Earthquake> earthquakes = json.map(
      (item) => Earthquake.fromJson(item)
    ).toList();
    return earthquakes;
  }


}





