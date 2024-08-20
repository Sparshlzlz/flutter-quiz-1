import 'package:flutter/material.dart';
import 'package:app3/answer_button.dart';
import 'package:app3/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';
class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onselectAnswer});
  final void Function(String answer) onselectAnswer;
  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var quesIndex=0;
  void nextques(String selectedAnswer){
    widget.onselectAnswer(selectedAnswer);
    setState(() {
      quesIndex++;
    });
  }
  @override
  Widget build(context) {
    final currentQuestion = questions[quesIndex];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            ...currentQuestion.getShuffledAnswers().map((e) {
              return AnswerButton(answerText: e, 
                ontap: (){
                  nextques(e);
                });
            })
          ],
        ),
      ),
    );
  }
}
