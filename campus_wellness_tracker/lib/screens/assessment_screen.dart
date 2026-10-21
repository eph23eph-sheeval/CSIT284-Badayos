import 'package:flutter/material.dart';
import '../data/wellness_questions.dart';
import '../widgets/question_display.dart';
import '../widgets/answer_button.dart';
 
class AssessmentScreen extends StatelessWidget {
  final int currentQuestionIndex;
  final ValueChanged<int> onSelectAnswer;
 
  const AssessmentScreen({
    super.key,
    required this.currentQuestionIndex,
    required this.onSelectAnswer,
  });
 
  @override
  Widget build(BuildContext context) {
    final question = wellnessQuestions[currentQuestionIndex];
    final progress = (currentQuestionIndex + 1) / wellnessQuestions.length;
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
 
    Widget questionHeader = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        LinearProgressIndicator(value: progress),
        const SizedBox(height: 16),
        QuestionDisplay(
          questionText: question.text,
          questionIndex: currentQuestionIndex,
          totalQuestions: wellnessQuestions.length,
        ),
      ],
    );
 
    Widget answersList = ListView.builder(
      shrinkWrap: true,
      physics: isLandscape
          ? const BouncingScrollPhysics()
          : const NeverScrollableScrollPhysics(),
      itemCount: question.answers.length,
      itemBuilder: (ctx, index) {
        final answer = question.answers[index];
        return AnswerButton(
          text: answer.text,
          onTap: () => onSelectAnswer(answer.score),
        );
      },
    );
 
    return Scaffold(
      appBar: AppBar(title: const Text('Assessment')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: isLandscape
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: SingleChildScrollView(child: questionHeader)),
                    const SizedBox(width: 24),
                    Expanded(child: answersList),
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    questionHeader,
                    const SizedBox(height: 24),
                    Expanded(child: answersList),
                  ],
                ),
        ),
      ),
    );
  }
}
 