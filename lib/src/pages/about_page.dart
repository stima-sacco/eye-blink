import 'package:flutter/material.dart';
import 'package:eye_blink_reminder/src/widgets/custom_list_tile.dart';

// ignore: use_key_in_widget_constructors
class AboutPage extends StatefulWidget {
  // ignore: annotate_overrides
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  bool turnOnNotification = false;
  bool turnOnLocation = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Text(
                "Eye Blink Reminder",
                style: TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20.0),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 120.0,
                    width: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(60),
                      boxShadow: const [
                        BoxShadow(
                            blurRadius: 3.0,
                            offset: Offset(0, 4.0),
                            color: Colors.black12),
                      ],
                      image: const DecorationImage(
                        image: AssetImage("assets/images/eye-bg.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
              Card(
                elevation: 5.0,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: const <Widget>[
                      CustomListTile(icon: Icons.location_on, text: "Location"),
                      Divider(
                        height: 10.0,
                        color: Colors.grey,
                      ),
                      CustomListTile(
                          icon: Icons.visibility, text: "Change Password"),
                      Divider(
                        height: 10.0,
                        color: Colors.grey,
                      ),
                      Divider(
                        height: 10.0,
                        color: Colors.grey,
                      ),
                      CustomListTile(icon: Icons.payment, text: "Payment"),
                      Divider(
                        height: 10.0,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text("VERSION",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
              const Text("1.0.1",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }
}
