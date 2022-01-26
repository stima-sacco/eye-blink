import "package:flutter/material.dart";

class CustomListTile extends StatelessWidget {
  final IconData icon;
  final String text;

  // ignore: use_key_in_widget_constructors
  const CustomListTile({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        children: <Widget>[
          Icon(icon, color: Colors.blue),
          const SizedBox(width: 15.0),
          Text(text, style: const TextStyle(fontSize: 16.0))
        ],
      ),
    );
  }
}
