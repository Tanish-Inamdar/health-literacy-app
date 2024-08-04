// import 'package:flutter/material.dart';
// import 'screens/home_screen.dart';
// import '../models/ai.dart';
// // import 'package:firebase_core/firebase_core.dart';  

// Future<void> main() async{
//   WidgetsFlutterBinding.ensureInitialized();
//   runApp(
//     const Home(),
//   );
// }

// class Home extends StatelessWidget{
//   const Home({Key? key}) :super(key:key);

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false, 
//       home: HomeScreen(),
//       //home: Home() //MAKE SURE TO CHANGE BACK
//     );
//   } 
// }


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