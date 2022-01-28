import 'package:android_alarm_manager/android_alarm_manager.dart';
import 'package:eye_blink_reminder/src/widgets/notification_helper.dart';
import 'package:eye_blink_reminder/src/widgets/shared_prefs.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

class CustomizedNotification extends StatefulWidget {
  const CustomizedNotification({Key? key}) : super(key: key);

  @override
  _CustomizedNotificationState createState() => _CustomizedNotificationState();
}

class _CustomizedNotificationState extends State<CustomizedNotification> {
  String startTime = "";
  String endTime = "";
  @override
  void initState() {
    super.initState();
    getTime();
  }

  static periodicCallback() {
    NotificationHelper().showNotificationBtweenInterval();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      "Notification Start From",
                      style: TextStyle(fontSize: 30),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      startTime,
                      style: const TextStyle(fontSize: 30),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      "Notification Stop From",
                      style: TextStyle(fontSize: 30),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      endTime,
                      style: const TextStyle(fontSize: 30),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 50,
                      // ignore: deprecated_member_use
                      child: RaisedButton(
                        color: Colors.blue,
                        onPressed: () async {
                          WidgetsFlutterBinding.ensureInitialized();
                          await AndroidAlarmManager.initialize();
                          onTimePeriodic();
                        },
                        child: const Text(
                          "Okay , Trigger Alarm",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  // getD(){
  //   SharedPreferences.getInstance().then((value) {
  //     var a = value.getString('dai');
  //     print(a);
  //   });
  // }

  //   Future sujan() async {
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   sharedPreferences.setString("dai", "lado");
  // }

  onTimePeriodic() {
    SharedPreferences.getInstance().then((value) async {
      var a = value.getBool('oneTimePeriodic') ?? false;
      if (!a) {
        await AndroidAlarmManager.periodic(
            const Duration(minutes: 1), 0, periodicCallback);
        onlyOneTimePeriodic();
      } else {
        // ignore: avoid_print
        print("Cannot run more than once");
      }
    });
  }

  getTime() {
    SharedPreferences.getInstance().then((value) {
      var a = value.getString('startTime');
      var b = value.getString('endTime');
      if (a != null && b != null) {
        setState(() {
          startTime = DateFormat('jm').format(DateTime.parse(a));
          endTime = DateFormat('jm').format(DateTime.parse(b));
        });
      }
    });
  }
}
