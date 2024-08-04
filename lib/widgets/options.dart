import 'package:flutter/material.dart';

// answer choices
class Options extends StatelessWidget {
  const Options({super.key, required this.option, required this.color, required this.wrongA});
  final String option;
  final Color color;
  final Color wrongA;
  // final Color test;
  @override
  Widget build(BuildContext context) {
      return Card(
        color:  color,
        child: ListTile(
          title: Text(
            option,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize:32.0
            ),
            ),
        ),
      );
  }
}
