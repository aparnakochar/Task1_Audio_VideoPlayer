import 'package:flutter/material.dart';
import 'package:videoPlayer/Pages/audio_screen_seekbar.dart';
import 'package:videoPlayer/Pages/video_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Music'),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FlatButton(
                  color: Colors.lightBlue,
                  onPressed: () {
                    print('Audio Page');
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return AudioPage();
                        },
                      ),
                    );
                  },
                  child: Text(
                    'AudioPlayer',
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                FlatButton(
                  color: Colors.amber,
                  onPressed: () {
                    print('Video Page');
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return VideoPage();
                        },
                      ), 
                    );
                  },
                  child: Text(
                    'VideoPlayer',
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ); 
  }
}

