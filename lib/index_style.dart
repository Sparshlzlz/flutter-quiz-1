import 'package:flutter/material.dart';

class QuestionIndex extends StatelessWidget{
  const QuestionIndex({super.key,required this.questionInfo});
  final Map<String,Object> questionInfo;
  @override
  Widget build(context){
    return Container(
      width: 30,
      decoration: BoxDecoration(
      color: (questionInfo['user_answer']==questionInfo['correct_answer'])?const Color.fromARGB(255, 121, 162, 122):const Color.fromARGB(255, 177, 57, 49),
      shape: BoxShape.circle,
      
      ),
      child: Text(((questionInfo['question_index'] as int) + 1).toString(), textAlign: TextAlign.center,
      style: const TextStyle(fontWeight: FontWeight.bold),),
    );
  }
}