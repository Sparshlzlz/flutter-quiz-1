import 'package:flutter/material.dart';
import 'package:app3/start_screen.dart';
import 'package:app3/questions.dart';
import 'package:app3/data/questions.dart';
import 'package:app3/results_screen.dart';
class Quiz extends StatefulWidget{
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }

}

class _QuizState extends State<Quiz>{
  var activeScreen='start-screen';
  List<String> selectedAnswers=[];
  //@override
  // void initState(){
  //   activeScreen= StartScreen(switchScreen);
  //   super.initState();
  // }  
  void switchScreen(){
    setState(() {
      activeScreen= 'questions-screen';
    });
  }
  void chooseAnswer(String answer)
  {
    selectedAnswers.add(answer);
    if(selectedAnswers.length==questions.length)
    {
      setState(() {
        activeScreen='results-screen';
      });
    }
  }
  void restartQuiz()
  {
    setState(() {
      activeScreen='start-screen';
      selectedAnswers=[];
    });
  }
  @override
  Widget build(context)
  {
    Widget screenWidget= StartScreen(switchScreen);
    if(activeScreen=='questions-screen')
    {
      screenWidget= QuestionsScreen(onselectAnswer: chooseAnswer);
    }
    if(activeScreen=='results-screen'){
      screenWidget= ResultsScreen(chosenAnswers: selectedAnswers, restart: restartQuiz,);
    }
    return MaterialApp(
      home: Scaffold(
        body: Container(
      decoration:const BoxDecoration(
        gradient: LinearGradient(colors: 
        [
          Color.fromARGB(239, 31, 3, 77), Color.fromARGB(226, 102, 47, 147)
        ], begin: Alignment.topLeft, end: Alignment.bottomRight)
      ),
          child: screenWidget,
          )
      )
    );
  }
}