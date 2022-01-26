import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class SettingsPage extends StatefulWidget {
  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late int selectedValue = 5;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Row(
          children: [
            const SizedBox(
              height: 20.0,
            ),
            // ignore: avoid_unnecessary_containers
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: DropdownButton<String>(
                items: <String>['5', '10', '15', '20', '25', '30']
                    .map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (val) {
                  selectedValue = int.parse(val!);
                  // ignore: avoid_print
                  print(selectedValue);
                  setState(() {
                    selectedValue =
                        int.parse(val); //update the dropdown's value
                  });
                },
                hint: const Text('Select Duration (Minutes)'),
                isExpanded: false,
                iconSize: 30.0,
                value: selectedValue.toString(),
                style: const TextStyle(color: Colors.blue, fontSize: 20.0),
              ),
            )
          ],
        ),
      ),
    );
  }
}
