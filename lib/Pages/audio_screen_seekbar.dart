// import 'package:MusicApp/controls.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AudioPage extends StatefulWidget {
  @override
  _AudioPageState createState() => _AudioPageState();
}

class _AudioPageState extends State<AudioPage> {
  Duration _duration = Duration();
  Duration _position = Duration();
  AudioPlayer advancedPlayer;
  AudioCache audioCache;
  // AnimationController _animationIconController1;
  int favourite = 0;
  int shuffle = 0;
  int loop = 0;
  double stop = 0.0;
  IconData iconDataFavourite = Icons.favorite_border;
  IconData iconDataShuffle = Icons.shuffle;
  String msg;
  @override
  void initState() {
    super.initState();
    initPlayer();
  }

  void initPlayer() {
    // _animationIconController1 = AnimationController(
    //   vsync: this,
    // );

    advancedPlayer = new AudioPlayer();
    audioCache = new AudioCache(fixedPlayer: advancedPlayer);

    advancedPlayer.durationHandler = (d) => setState(() {
          _duration = d;
        });

    advancedPlayer.positionHandler = (p) => setState(() {
          _position = p;
        });
  }

  Widget slider() {
    return Slider(
        value: _position.inSeconds.toDouble(),
        min: 0.0,
        max: _duration.inSeconds.toDouble(),
        onChanged: (double value) {
          setState(() {
            seekToSecond(value.toInt());
            value = value;
          });
        });
  }

  void seekToSecond(int second) {
    Duration newDuration = Duration(seconds: second);

    advancedPlayer.seek(newDuration);
  }

  toastFun(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.white,
        textColor: Color(0xff0581CC),
        fontSize: 16.0);
  }

  @override
  void deactivate() {
    super.deactivate();
    print('deactivated');
    advancedPlayer.stop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    size: 30.0,
                  ),
                  color: Colors.blue,
                  onPressed: () {
                    Navigator.pop(context);
                    print('back');
                  },
                ),
                Text(
                  'Audio Player',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(
                  Icons.more_vert,
                  color: Colors.blue,
                  size: 30.0,
                ),
              ],
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: EdgeInsets.all(6.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(),
                  
                  image: DecorationImage(
                    image: AssetImage('images/music_logo1.png'),
                    fit: BoxFit.cover,
                  ),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.loop_rounded,
                    size: 35,
                    color: Colors.cyan,
                  ),
                  onPressed: () {
                    setState(() {
                      if (loop == 1) {
                        toastFun('Loop On');
                        loop = 0;
                      } else {
                        toastFun('Loop Off');
                        loop = 1;
                      }
                    });
                  },
                ),
                IconButton(
                  icon: Icon(
                    iconDataShuffle,
                    size: 35,
                    color: shuffle == 1 ? Colors.amber : Colors.cyan,
                  ),
                  onPressed: () {
                    setState(() {
                      if (shuffle == 0) {
                        iconDataShuffle = Icons.shuffle_rounded;
                        shuffle = 1;
                        toastFun('Shuffle On');
                      } else {
                        iconDataShuffle = Icons.shuffle;
                        shuffle = 0;
                        toastFun('Shuffle Off');
                      }
                    });
                  },
                ),
                IconButton(
                  icon: Icon(
                    iconDataFavourite,
                    size: 35,
                    color: Colors.cyan,
                  ),
                  onPressed: () {
                    print('favourite');
                    setState(() {
                      if (favourite == 0) {
                        iconDataFavourite = Icons.favorite;
                        favourite = 1;
                        toastFun('Added To Favourite');
                      } else {
                        iconDataFavourite = Icons.favorite_border;
                        favourite = 0;
                        toastFun('Removed From Favourite');
                      }
                    });
                  },
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
            slider(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                      "${_position.inMinutes.toInt().remainder(60)}:${_position.inSeconds.toInt().remainder(60)}"),
                  Text(
                      "${_duration.inMinutes.toInt().remainder(60)}:${_duration.inSeconds.toInt().remainder(60)}"),
                ],
              ),
            ),
              ],
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.skip_previous_sharp,
                      color: Colors.cyan,
                      size: 40,
                    ),
                    onPressed: () {
                      audioCache.play('afreen_afreen.mp3');
                      toastFun('Previous Song');
                    },
                  ),
                  IconButton(
                      icon: Icon(
                        // Icons.pause_circle_filled,
                        Icons.pause,
                        color: Colors.cyan,
                        size: 40,
                      ),
                      onPressed: () {
                        advancedPlayer.pause();
                        toastFun('Paused');
                      }),
                  IconButton(
                    icon: Icon(
                      Icons.play_circle_outline,
                      color: Colors.cyan,
                      size: 40,
                    ),
                    onPressed: () {
                      audioCache.play('nokia.mp3');
                      toastFun('Playing');
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.stop_circle_outlined,
                      color: Colors.cyan,
                      size: 40,
                    ),
                    onPressed: () {
                      advancedPlayer.stop();
                      toastFun('Stopped');
                      setState(() {
                        stop = 1;
                      });
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.skip_next_sharp,
                      color: Colors.cyan,
                      size: 40,
                    ),
                    onPressed: () {
                      audioCache.play('nit_khair_manga.mp3');
                      toastFun('Next Song Playing');
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}