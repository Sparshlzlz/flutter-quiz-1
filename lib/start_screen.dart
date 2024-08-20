import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz,{super.key});
  final void Function() startQuiz; 
  @override
  Widget build(context) {
    return Center(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset('assets/images/quiz-logo.png', 
        width: 300,
        color: const Color.fromARGB(151, 255, 255, 255),
        ),
        const SizedBox(
          height: 60,
        ),
        const Text(
          'Learn Flutter the Fun way!',
          style: TextStyle(color: Colors.white, fontSize: 26),
        ),
        const SizedBox(
          height: 25,
        ),
        FloatingActionButton.extended(
          onPressed: (){
              startQuiz();
          },
          label: const Text('Start Quiz'),
          backgroundColor: const  Color.fromARGB(225, 129, 67, 180),
          foregroundColor: Colors.white,
          icon: const Icon(Icons.arrow_right_alt),
        )
      ],
    ));
  }
}
