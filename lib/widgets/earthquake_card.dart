import 'package:earthquakes/arguments/EarthquakeDetail.dart';
import 'package:earthquakes/models/Earthquake.dart';
import 'package:flutter/material.dart';

class EarthquakeCard extends StatelessWidget {
  final Earthquake earthquake;

  EarthquakeCard({@required this.earthquake});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red[100],
      child: ListTile(
        title: Text(
          earthquake.place,
          style: TextStyle(fontSize: 20),
        ),
        subtitle: RichText(
          text: TextSpan(
              style: TextStyle(color: Colors.black, fontSize: 18),
              children: [
                TextSpan(text: 'Şiddet: '),
                TextSpan(
                    text: earthquake.ml,
                    style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text: ' Derinlik: '),
                TextSpan(
                    text: earthquake.depth,
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ]),
        ),
        trailing: IconButton(
          color: Theme.of(context).primaryColor,
          icon: Icon(Icons.map),
          onPressed: () => Navigator.of(context).pushNamed('/earthquake-on-map', arguments: EarthquakeDetail(
            depth: earthquake.depth,
            ml: earthquake.ml,
            place: earthquake.place,
            latitude: double.parse(earthquake.latitude),
            longitude: double.parse(earthquake.longitude)
          )),
          tooltip: 'Harita Üzerinde Göster',
        ),
      ),
    );
  }
}
