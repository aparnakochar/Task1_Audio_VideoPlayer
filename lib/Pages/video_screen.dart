import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPage extends StatefulWidget {
  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
    YoutubePlayerController _controller;
  String videoUrl = "https://www.youtube.com/watch?v=q-KBM5t45kc";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Video Player',style: TextStyle(color:Color.fromRGBO(0, 0, 255, 1) )),
        backgroundColor: Colors.white,
      ),
      body: Container(
          alignment: Alignment.center,
          height: double.infinity,
          width: double.infinity,
          color: Colors.yellow[300],
          margin: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Text(
              //   'Play Videos Online!',
              //   style: TextStyle(
              //       fontSize: 24,
              //       fontWeight: FontWeight.bold,
              //       color: Colors.black45),
              // ),
              Expanded(
                  child: Container(
                  // height: 310,
                  // width: 310,
                  child: YoutubePlayer(
                    controller: _controller = YoutubePlayerController(
                        initialVideoId: YoutubePlayer.convertUrlToId(videoUrl)),
                    showVideoProgressIndicator: true,
                  ),
                ),
              )
            ],
          ),
        ),
    );
  }
}
