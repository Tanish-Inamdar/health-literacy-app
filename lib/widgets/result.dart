import 'package:flutter/material.dart';


// Shows the result panel
// which is a chart showing you how many questions you got write or wrong

class Results extends StatelessWidget {
  const Results({super.key, required this.result, required this.questionLength, required this.ReviewCall});
  final int result;
  final int questionLength;
  final VoidCallback ReviewCall;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.black,
      content: Padding(
        padding: const EdgeInsets.all(70.0),
        child: Column(
          mainAxisSize:MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Score: ', style:TextStyle(fontSize: 35.0, color: Colors.green)),
            
            const SizedBox(height: 20.0),
             Container(color:Colors.red),
            CircleAvatar(child: Text('$result/$questionLength', style:TextStyle(fontSize: 40.0)), radius: 70.0,
            
            ),
        const SizedBox(height: 20.0),
         Container(
          alignment: Alignment.center,
          child: GestureDetector(
          onTap: ReviewCall,
          child: Hero(
          tag: 'tag-rev',
          child: const Text('More Info', style: TextStyle(fontSize: 30.0, color: Colors.blue, ),)
          
          ),
          
          )
          
        ),
        
        ],

      
        )
        
        )
  
  );
  }
}
