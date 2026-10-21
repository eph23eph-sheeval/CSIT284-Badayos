import 'package:flutter/material.dart';
 
class QuestionDisplay extends StatelessWidget {
  final String questionText;
  final int questionIndex;
  final int totalQuestions;
 
  const QuestionDisplay({
    super.key,
    required this.questionText,
    required this.questionIndex,
    required this.totalQuestions,
  });
 
  @override
  Widget build(BuildContext meContext) {
    final theme = Theme.of(meContext);
    final isCompact = MediaQuery.of(meContext).size.width < 600;
 
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Question ${questionIndex + 1} of $totalQuestions',
          style: theme.textTheme.labelLarge?.copyWith(
            color: theme.colorScheme.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          questionText,
          style: theme.textTheme.headlineSmall?.copyWith(
            fontSize: isCompact ? 18 : 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
 