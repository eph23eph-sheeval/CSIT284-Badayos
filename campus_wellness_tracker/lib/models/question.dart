class AnswerOption {
  final String text;
  final int score;
 
  const AnswerOption({
    required this.text,
    required this.score,
  });
}
 
class Question {
  final String text;
  final List<AnswerOption> answers;
 
  const Question({
    required this.text,
    required this.answers,
  });
}
 