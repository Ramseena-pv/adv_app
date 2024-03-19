import 'package:flutter/material.dart';
import 'package:adv_app/data/questions.dart';
import 'package:adv_app/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.chosenAnswers, required onRestart,
    });

    final List<String> chosenAnswers;
  List<Map<String, Object>> get SummaryData {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index':i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswers[i]

      },
      );
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = SummaryData.where(
      (data) => data['user_answer'] == data['correct_answer'] 
    )
    .length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
              Text(
                'You answered $numCorrectQuestions out of $numTotalQuestions questions correctly',),
             const SizedBox(
              height: 30,
              ),
             QuestionsSummary(SummaryData),
             const SizedBox(
              height: 30,
              ),

            TextButton(
             onPressed: () {},
             child: const Text('Restart Quiz!'), 
            )
          ],
        ),
      ),
    ); 
  }
}