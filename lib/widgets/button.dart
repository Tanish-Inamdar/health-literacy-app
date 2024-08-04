import 'package:flutter/material.dart';
import '../screens/constants.dart';

// next question button
class Button extends StatelessWidget {
  const Button({super.key, required this.nextQuestion});
  final VoidCallback nextQuestion;
  @override
  Widget build(BuildContext context) {
   return GestureDetector( 
    onTap: nextQuestion,
    child: Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: neut,
        borderRadius: BorderRadius.circular(10.0),
      ),
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: const Text(
        'Next Question',
        textAlign: TextAlign.center,
      ),
    ),
   );
  }
}
