import 'package:flutter/material.dart';
import 'package:app3/data/questions.dart';
import 'package:app3/questions_summary.dart';
class ResultsScreen extends StatelessWidget{
  const ResultsScreen({super.key,required this.chosenAnswers, required this.restart});
  
  final List<String> chosenAnswers;
  final void Function() restart;

  List<Map<String,Object>> getSummaryData(){
    final List<Map<String,Object>> summary=[];
    for(var i=0;i<chosenAnswers.length;i++)
    {
      summary.add({
        'question_index':i,
        'question': questions[i].text,
        'correct_answer':questions[i].answers[0],
        'user_answer':chosenAnswers[i]
      });
    }
    return summary;
  }

  @override
  Widget build(context){
    final summaryData=getSummaryData();
    final numTotalQuestions=questions.length;
    final numCorrectQuestions=summaryData.where((element) {
      return element['user_answer']==element['correct_answer'];
    },).length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('You answered $numCorrectQuestions out of $numTotalQuestions questions correctly',
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20
                    ), textAlign: TextAlign.center,),
              const SizedBox(
                height: 30,
              ),
              QuestionsSummary(summaryData),
              const SizedBox(
                height: 30,
              ),
              FloatingActionButton.extended(
                  onPressed: restart,
                  label: const Text('Restart Quiz'),
                  backgroundColor: const  Color.fromARGB(225, 129, 67, 180),
                  foregroundColor: Colors.white,
                  icon: const Icon(Icons.restart_alt),
                )
            ]),
      ),
    );
  }
}