import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:app3/index_style.dart';
class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});
  final List<Map<String, Object>> summaryData;
  
  @override
  Widget build(context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                QuestionIndex(questionInfo: data),
                const SizedBox(
                    width: 15,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(data['question'] as String, style: GoogleFonts.lato(
                        color: Colors.white,
                        fontSize: 15
                      )
                      ,),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(data['user_answer'] as String, style: const TextStyle(color: Color.fromARGB(255, 211, 110, 81)),),
                      Text(data['correct_answer'] as String, style: const TextStyle(color: Color.fromARGB(255, 45, 202, 51)),),
                    ],
                  ),
                )
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
