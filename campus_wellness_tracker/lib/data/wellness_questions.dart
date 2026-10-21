import '../models/question.dart';
 
const List<Question> wellnessQuestions = [
  Question(
    text: 'How many hours of sleep do you average per night?',
    answers: [
      AnswerOption(text: 'Less than 4 hours', score: 1),
      AnswerOption(text: '4 – 6 hours', score: 2),
      AnswerOption(text: '7 – 8 hours', score: 4),
      AnswerOption(text: 'More than 8 hours', score: 3),
    ],
  ),
  Question(
    text: 'How often do you take study breaks during long sessions?',
    answers: [
      AnswerOption(text: 'Rarely / Never', score: 1),
      AnswerOption(text: 'Every few hours', score: 2),
      AnswerOption(text: 'Every 45–60 minutes', score: 4),
      AnswerOption(text: 'Every 25 minutes (Pomodoro)', score: 3),
    ],
  ),
  Question(
    text: 'How well do you manage academic stress?',
    answers: [
      AnswerOption(text: 'Overwhelmed frequently', score: 1),
      AnswerOption(text: 'Stressed but managing', score: 2),
      AnswerOption(text: 'Generally calm and organized', score: 4),
      AnswerOption(text: 'Extremely confident and relaxed', score: 3),
    ],
  ),
  Question(
    text: 'How many glasses of water do you drink daily?',
    answers: [
      AnswerOption(text: 'Less than 3 glasses', score: 1),
      AnswerOption(text: '3 – 5 glasses', score: 2),
      AnswerOption(text: '6 – 8 glasses', score: 4),
      AnswerOption(text: 'More than 8 glasses', score: 3),
    ],
  ),
  Question(
    text: 'How frequently do you engage in physical exercise?',
    answers: [
      AnswerOption(text: 'Never / Rarely', score: 1),
      AnswerOption(text: '1 – 2 days a week', score: 2),
      AnswerOption(text: '3 – 4 days a week', score: 4),
      AnswerOption(text: '5+ days a week', score: 3),
    ],
  ),
];
 