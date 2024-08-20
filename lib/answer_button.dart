import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget{
  const AnswerButton({super.key, required this.answerText, required this.ontap});
  final String answerText;
  final void Function() ontap;
  @override
  Widget build(context){
    return ElevatedButton(onPressed: ontap,
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 35),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            backgroundColor:const Color.fromARGB(255, 64, 9, 104),
            foregroundColor: Colors.white
          ),    
           child: Text(answerText, textAlign: TextAlign.center,)
           );
  }
}