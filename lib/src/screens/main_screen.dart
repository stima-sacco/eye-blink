import 'package:flutter/material.dart';
import 'package:eye_blink_reminder/src/pages/home_page.dart';
import 'package:eye_blink_reminder/src/pages/about_page.dart';
import 'package:eye_blink_reminder/src/pages/settings_page.dart';

// ignore: use_key_in_widget_constructors
class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late List<Widget> pages;
  late Widget currentPage;
  int currentTabIndex = 0;
  late HomePage homePage;
  late SettingsPage settingsPage;
  late AboutPage aboutPage;

  @override
  void initState() {
    homePage = HomePage();
    aboutPage = AboutPage();
    settingsPage = SettingsPage();

    pages = [homePage, settingsPage, aboutPage];
    currentPage = homePage;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
            fontFamily: "Ubuntu",
          ),
        ),
        leading: IconButton(
          alignment: Alignment.center,
          icon: Image.asset('assets/images/eye-bg.png'),
          onPressed: () {},
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          setState(() {
            currentTabIndex = index;
            currentPage = pages[index];
          });
        },
        currentIndex: currentTabIndex,
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: "About",
          ),
        ],
      ),
      body: currentPage,
    );
  }
}
