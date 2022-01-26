import 'package:eye_blink_reminder/src/screens/main_screen.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Eye Blinker",
      theme: ThemeData(primaryColor: Colors.blue[400], fontFamily: 'Open Sans'),
      home: MainScreen(),
    );
  }
}
