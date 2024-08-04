import 'package:flutter/material.dart';
import '../screens/constants.dart';

class QuestionsWidget extends StatelessWidget {
  const QuestionsWidget({super.key,
  required this.question,
  required this.indexAction,
  required this.totalQuestions,
  });

  final String question;
  final int indexAction;
  final int totalQuestions; 

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Text(
        'Question ${indexAction + 1}/$totalQuestions: $question',
        style: TextStyle(
          fontSize:24.0,
          color: neut,
        )
        ),
      );
  }
}