// import 'package:flutter/material.dart';
// import 'package:videoPlayer/main_screen.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: MainScreen(),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:videoPlayer/main_screen.dart';
//import 'package:mu/my_app.dart';
// import 'package:videoPlayer/my_app.dart'; on ho raha hai?hn ok video wala kaam hua?emulator hi nhi chlra tha to fir kaise krti to fir kiya kya?
/*
*/
void main() => runApp(MusicApp());

class MusicApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Musica",
     // theme: ThemeData.dark(),
      home: MainScreen(),
      // MyApp(),
    );
  }
}
