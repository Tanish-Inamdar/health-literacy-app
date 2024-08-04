

import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import '../models/ai.dart';

void main() {
  runApp(
    const Home(),
  );
}

class Home extends StatelessWidget{
  const Home({Key? key}) :super(key:key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false, 
      home: HomeScreen(),

    );
  } 
}
