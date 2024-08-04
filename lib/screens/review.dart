import 'package:flutter/material.dart';
import '../models/wrongAns.dart';
import 'package:groq/groq.dart';
import 'package:groq_sdk/groq_sdk.dart';


class Review extends StatefulWidget {
  final List<wrongAns> wrongAnswers;
  final String totalTime; // Used for the AI response
  
  const Review({super.key, required this.wrongAnswers, required this.totalTime});

  @override
  _ReviewScreenState createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<Review> {
  int _currentIndex = 0;
  String _aiResponse = '';

// go between the questions in the review screen
  
  void _nextQuestion() {
    setState(() {
      if (_currentIndex < widget.wrongAnswers.length - 1) {
        _currentIndex++;
      }
    });
  }

  void _previousQuestion() {
    setState(() {
      if (_currentIndex > 0) {
        _currentIndex--;
      }
    });
  }

  // in the review screen displays Question and the wrong answer and the ai response to why that answer is wrong
  
  @override
  Widget build(BuildContext context) {
    var answer = widget.wrongAnswers[_currentIndex];
    
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Review Screen'),
        backgroundColor: Colors.greenAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), 
        child: Hero(
          tag: 'tag-rev',
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Wrong Questions:',
                  style: TextStyle(fontSize: 30.0, color: Colors.blue),
                ),
                const SizedBox(height: 20.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Question: ${answer.title}',
                        style: const TextStyle(fontSize: 40.0, color: Colors.white),
                      ),
                      const SizedBox(height: 20.0),
                      Text(
                        'Your Answer: ${answer.option}',
                        style: const TextStyle(fontSize: 30.0, color: Colors.red),
                      ),
                      const SizedBox(height:40.0),
                      Text(
                        'AI Response: $_aiResponse\nTotal Time: ${widget.totalTime}', 
                        style: const TextStyle(fontSize: 30.0, color: Colors.green),
                      ),
                      
                      const SizedBox(height: 150.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            onPressed: _previousQuestion,
                            child:const Text('Previous')
                          ),
                          ElevatedButton(
                            onPressed: _nextQuestion,
                            child: const Text("Next"),
                          ),

                        ],
                        ),
                    ],
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
