import 'package:earthquakes/models/Earthquake.dart';
import 'package:earthquakes/widgets/earthquake_card.dart';
import 'package:flutter/material.dart';
import 'package:location_permissions/location_permissions.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Earthquake earthquake = Earthquake();
  Future earthquakes;

  loadEarthquakes(){
    setState(() {
      earthquakes = earthquake.getAll();
    });
  }

  askLocation() async {
    await LocationPermissions().requestPermissions();
  }

  @override
  void initState() {
    super.initState();
    loadEarthquakes();    
    askLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar,
      body: FutureBuilder(
        future: earthquakes,
        builder: (context, snapshot){
          if(snapshot.hasData){
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index){
                return EarthquakeCard(earthquake: snapshot.data[index]);
              },
            );
          }else{
            return Center(child: CircularProgressIndicator());
          }
        },
      )
    );
  }

  Widget get _appBar => AppBar(
        title: Text('Depremler'),
        actions: <Widget>[
          IconButton(
            tooltip: 'Harita Üzerinde Göster',
            icon: Icon(Icons.map),
            onPressed: () => Navigator.of(context).pushNamed('/show-all-earthquakes')
          ),
          IconButton(
            tooltip: 'Deprem Nedir?',
            icon: Icon(Icons.info),
            onPressed: () => Navigator.of(context).pushNamed('/what-is-earthquake'),
          )
        ],
      );
}
