import 'package:flutter/material.dart';
import 'constants.dart';
import '../models/questions_models.dart';
import '../models/wrongAns.dart';
import '../widgets/questions_widgets.dart';
import '../widgets/button.dart';
import '../widgets/options.dart';
import '../widgets/result.dart';
import '../screens/review.dart';
import '../models/ai.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';


//stateful widget with functions and variables in it 
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  List<Question> _questions = [
    Question(id: "1", 
    title: "Which is an example of health literacy? (Choose all that apply)", 
    options: {'When people can read and understand health information.': true, 'When people can act on health information to make informed decisions': true, 
    'When organizations make sure that people can find the health information they need.': true , 'When organizations ensure that people can equitably access and use health services.': true},
    ),
    Question(id: "2", 
    title: "More people have low numeracy than low literacy True or False?", 
    options: {'true': true, 'false': false},
    ),
    Question(id: '3', 
    title: "What can happen when health literacy is not addressed?", 
    options: {'Medication errors': false, 'Fewer preventive services.': false, 'More hospitalizations.': false, 'All of the Above': true},
    ),
  ];
  
  List<wrongAns> wrongans = [];
  //index of question
  int index = 0;

  //score of quiz
  int score = 0;
  
  //if option is already pressed for score
  bool AlreadyPressed = false;

  //option button pressed
  bool Pressed = false;

  
  String totalTime = '';

  @override
  void initState() {
    super.initState();
    // getTotalTimeFromAI(wrongans).then((value) {
    //   setState(() {
    //     totalTime = value;
  }
  
  //function to disply next question
  void nextQuestion() {
    if(index == _questions.length - 1){
      showDialog(context: context, builder: (ctx) => Results(
        result: score,
        questionLength: _questions.length,
        ReviewCall: ReviewClass
        ));

      return;
    }else{
     if(Pressed){
      setState(() {
        index++;
        Pressed = false; //just changed this from false og
        AlreadyPressed =  false;
    });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: const Text("Please select an answer choice"),
        // behavior: SnackBarBehavior.floating, 
        // margin: EdgeInsets.symmetric(vertical: 20.0) 
        
        ));
    }
    }
  }

  void checkAnswer(bool value) { 
    if(AlreadyPressed){
      return;
    }else{
      if(value == true){
      score++;
      } else {
      //wrongans.add(wrongAns(id: _questions[index].id, title: _questions[index].options.keys.toList().firstWhere((k) => _questions[index].options[k] == value)));
      wrongans.add(wrongAns( 
      title: _questions[index].title, 
      option: _questions[index].options.keys.toList().firstWhere((k) => _questions[index].options[k] == value, 
      
      )));
    } //this code is usntable  i dunno why not working? will check later
      setState(() {
        Pressed = true;
        AlreadyPressed = true;
      });

      // Call AI function after adding a new wrong answer
      getTotalTimeFromAI(wrongans).then((value) {
        setState(() {
          totalTime = value; // Update totalTime with AI response
        });
      });
    }
  }
                  
  void ReviewClass() {
    print('Review button pressed');
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Review(wrongAnswers:  wrongans, totalTime: totalTime,),
      ),
    );
  }

  String getWrongAnswerDisplay() {
    if (wrongans.isNotEmpty) {
      var wrongAnswer = wrongans[0];
      return 'Question: ${wrongAnswer.title}\nYour Answer: ${wrongAnswer.option}';
    } else {
      return 'No wrong answers yet.';
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Health Literacy Quiz'),
        backgroundColor: back,
        shadowColor: Colors.transparent,
      ), 
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: SingleChildScrollView(  
          child: Column(
            children: [
              QuestionsWidget(
                question: _questions[index].title, 
                indexAction: index, 
                totalQuestions: _questions.length,
              ),
              const Divider(color: neut),
              //adds space for options
              const SizedBox(height: 25.0),
              for(int i =0; i < _questions[index].options.length; i++)
                GestureDetector(
                  onTap: () { checkAnswer(_questions[index].options.values.toList()[i]);
                  {print(wrongans);}
                  },
                  child: Options(
                    option: _questions[index].options.keys.toList()[i],
                    color: Pressed ? _questions[index].options.values.toList()[i] == true ? correct : wrong : neut,
                    wrongA: _questions[index].options.values.toList()[i] == false ? wrong : correct,
                    ),
                )

            ],
            ),
        ),
        ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child:Button(nextQuestion: nextQuestion,),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      
    );
  }
}