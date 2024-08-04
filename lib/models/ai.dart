// import 'package:groq_sdk/groq_sdk.dart';

// void main(List<String> arguments) async {
//   final groq = Groq('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');

//   //Checking model availability
//   if (!await groq.canUseModel(GroqModels.llama3_8b)) {
//     print('Cannot use model');
//     return;
//   }

//   //Creating a new chat
//   final chat = groq.startNewChat(GroqModels.llama3_8b,
//       settings: GroqChatSettings.defaults().copyWith(choicesCount: 2));

//   //Listening to chat events
//   chat.stream.listen((event) {
//     event.when(request: (requestEvent) {
//       print('Request sent...');
//       print(requestEvent.message.content);
//     }, response: (responseEvent) {
//       print(
//           'Received response: ${responseEvent.response.choices.first.message}');
//     });
//   });

//   //Sending a message which will add new data to the listening stream
//   final (response, usage) =
//       await chat.sendMessage('Explain LLMs to me please.');

//   //Printing some information
//   print(response.choices.length);
//   print("Total tokens used: ${usage.totalTokens}");
//   print("Total time taken: ${usage.totalTime}");
//   print("Rate limit information: ${chat.rateLimitInfo.toString()}");
//   print("-------------------");
//   await Future.delayed(Duration(seconds: 2));
//   await chat.sendMessage('What is the difference between LLM and GPT-3?');
//   await Future.delayed(Duration(seconds: 5));
// }



// import 'package:groq_sdk/groq_sdk.dart';
// import '../screens/review.dart';
// import 'package:flutter/material.dart';
// import '../models/wrongAns.dart';

// void gorban(List<String> arguments) async {
//   final groq = Groq('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');

//   // Checking model availability
//   if (!await groq.canUseModel(GroqModels.llama3_8b)) {
//     print('Cannot use model');
//     return;
//   }

//   // Creating a new chat
//   final chat = groq.startNewChat(GroqModels.llama3_8b,
//       settings: GroqChatSettings.defaults().copyWith(choicesCount: 2));

//   // Listening to chat events
//   chat.stream.listen((event) {
//     event.when(request: (requestEvent) {
//       print('Request sent...');
//       print(requestEvent.message.content);
//     }, response: (responseEvent) {
//       print(
//           'Received response: ${responseEvent.response.choices.first.message}');
//     });
//   });

//   // Sending a message which will add new data to the listening stream
//   final (response, usage) =
//       await chat.sendMessage('Explain LLMs to me please.');


//   String totalTimeString = usage.totalTime.toString();
  
//   // Printing some information
//   print(response.choices.length);
//   print("Total tokens used: ${usage.totalTokens}");
//   print("Total time taken: ${usage.totalTime}");
//   print("Rate limit information: ${chat.rateLimitInfo.toString()}");
//   print("-------------------");

//   // Assuming you have wrongAnswers list available here
//   List<wrongAns> wrongAnswers = []; // Initialize with your actual wrongAnswers list

//   runApp(MaterialApp(
//     home: Review(wrongAnswers: wrongAnswers, totalTime: totalTimeString),
//   ));

//   await Future.delayed(Duration(seconds: 2));
//   await chat.sendMessage('What is the difference between LLM and GPT-3?');
//   await Future.delayed(Duration(seconds: 5));
// }




import 'package:groq_sdk/groq_sdk.dart';
import '../screens/review.dart';
import 'package:flutter/material.dart';
import '../models/wrongAns.dart';

Future<String> getTotalTimeFromAI(List<wrongAns> wrongAnswers) async {
  final groq = Groq('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');
  String printedMessage = "";
  if (wrongAnswers.isEmpty) {
    printedMessage = "hello";
  }
  
  // Checking model availability
  if (!await groq.canUseModel(GroqModels.llama3_8b)) {
    print('Cannot use model');
    return '';
  }

  // Creating a new chat
  final chat = groq.startNewChat(GroqModels.llama3_8b,
      settings: GroqChatSettings.defaults().copyWith(choicesCount: 2));

    // Listening to chat events
  chat.stream.listen((event) {
    event.when(request: (requestEvent) {
      print('Request sent...');
      print(requestEvent.message.content);
    }, response: (responseEvent) {
      print(
          'Received response: ${responseEvent.response.choices.first.message}');
    });
  });
  
  
  
  // Sending a message which will add new data to the listening stream
  final (response, usage) =
      await chat.sendMessage('''So hey Im giving you a list thing the first part of the list is the question the second part is the wrong answer. 
      Just give the User some resources or tips or ways to think about it btw keep it short and not too long maybe 100 words max or somethign like that. 
      MAKE SURE TO KEEP IT SHORT PLEASE. 4 SENTENCES MAX. also dont say the prompt again  ${wrongAnswers}''');


  // Convert Duration to String
  String totalTimeString = usage.totalTime.toString();
  printedMessage = response.choices.first.message;

  return printedMessage;
}
