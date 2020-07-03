import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class WhatIsEarthquake extends StatefulWidget {
  WhatIsEarthquake({Key key}) : super(key: key);

  @override
  _WhatIsEarthquakeState createState() => _WhatIsEarthquakeState();
}

class _WhatIsEarthquakeState extends State<WhatIsEarthquake> {
  YoutubePlayerController _video1 = YoutubePlayerController(
    initialVideoId: 'DxS3RF2HOEs',
    flags: YoutubePlayerFlags(
      autoPlay: false,
      mute: false,
    ),
  );

  YoutubePlayerController _video2 = YoutubePlayerController(
    initialVideoId: 'h2etApVh7vI',
    flags: YoutubePlayerFlags(
      autoPlay: false,
      mute: false,
    ),
  );


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar,
      body: ListView(
        children: <Widget>[
          
          YoutubePlayerBuilder(
            player: YoutubePlayer(controller: _video1),
            builder: (context, player){
              return Container(
                child: player,
              );
            },
          ),
            SizedBox(height: 10),
           YoutubePlayerBuilder(
            player: YoutubePlayer(controller: _video2),
            builder: (context, player){
              return Container(
                child: player,
              );
            },
          ),

        ],
      ),
    );
  }

  Widget get _appBar => AppBar(
        title: Text('Deprem Nedir'),
        centerTitle: true,
      );
}
