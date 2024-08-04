

import 'package:groq_sdk/groq_sdk.dart';
import '../screens/review.dart';
import 'package:flutter/material.dart';
import '../models/wrongAns.dart';

// Using groq API to generate response
Future<String> getTotalTimeFromAI(List<wrongAns> wrongAnswers) async {
  final groq = Groq('YOURKEY');
  String printedMessage = "";
  if (wrongAnswers.isEmpty) {
    printedMessage = "hello";
  }
  

  if (!await groq.canUseModel(GroqModels.llama3_8b)) {
    print('Cannot use model');
    return '';
  }

  // creates chat
  final chat = groq.startNewChat(GroqModels.llama3_8b,
      settings: GroqChatSettings.defaults().copyWith(choicesCount: 2));

// 
  chat.stream.listen((event) {
    event.when(request: (requestEvent) {
      print('Request sent...');
      print(requestEvent.message.content);
    }, response: (responseEvent) {
      print(
          'Received response: ${responseEvent.response.choices.first.message}');
    });
  });
  
  
  
  // Sends the wrong answer to the AI
  final (response, usage) =
      await chat.sendMessage('''So hey Im giving you a list thing the first part of the list is the question the second part is the wrong answer. 
      Just give the User some resources or tips or ways to think about it btw keep it short and not too long maybe 100 words max or somethign like that. 
      MAKE SURE TO KEEP IT SHORT PLEASE. 4 SENTENCES MAX. also dont say the prompt again  ${wrongAnswers}''');


  // prints the message generated
  String totalTimeString = usage.totalTime.toString();
  printedMessage = response.choices.first.message;

  return printedMessage;
}
