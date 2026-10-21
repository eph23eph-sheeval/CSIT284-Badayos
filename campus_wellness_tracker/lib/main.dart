import 'package:flutter/material.dart';
import 'data/wellness_questions.dart';
import 'screens/home_screen.dart';
import 'screens/assessment_screen.dart';
import 'screens/results_screen.dart';
 
void main() {
  runApp(const CampusWellnessApp());
}
 
class CampusWellnessApp extends StatefulWidget {
  const CampusWellnessApp({super.key});
 
  @override
 
  State<CampusWellnessApp> createState() => _CampusWellnessAppState();
}
 
class _CampusWellnessAppState extends State<CampusWellnessApp> {
  int _activeScreenIndex = 0; // 0: Home, 1: Assessment, 2: Results
  int _currentQuestionIndex = 0;
  int _totalScore = 0;
  bool _isDarkMode = false;
 
  void _toggleDarkMode(bool value) {
    setState(() {
      _isDarkMode = value;
    });
  }
 
  void _startAssessment() {
    setState(() {
      _activeScreenIndex = 1;
      _currentQuestionIndex = 0;
      _totalScore = 0;
    });
  }
 
  void _answerQuestion(int score) {
    setState(() {
      _totalScore += score;
      if (_currentQuestionIndex + 1 < wellnessQuestions.length) {
        _currentQuestionIndex++;
      } else {
        _activeScreenIndex = 2;
      }
    });
  }
 
  void _restartAssessment() {
    setState(() {
      _activeScreenIndex = 0;
      _currentQuestionIndex = 0;
      _totalScore = 0;
    });
  }
 
  @override
  Widget build(BuildContext context) {
    const seedColor = Color.fromARGB(255, 162, 15, 34);
 
    final lightTheme = ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: seedColor,
        brightness: Brightness.light,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      cardTheme: const CardThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
      ),
    );
 
    final darkTheme = ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: seedColor,
        brightness: Brightness.dark,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      cardTheme: const CardThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
      ),
    ); // <-- Added the missing closing parenthesis and semicolon here
 
    Widget activeWidget;
    switch (_activeScreenIndex) {
      case 1:
        activeWidget = AssessmentScreen(
          currentQuestionIndex: _currentQuestionIndex,
          onSelectAnswer: _answerQuestion,
        );
        break;
      case 2:
        activeWidget = ResultsScreen(
          totalScore: _totalScore,
          onRestart: _restartAssessment,
        );
        break;
      case 0:
      default:
        activeWidget = HomeScreen(
          onStart: _startAssessment,
          isDarkMode: _isDarkMode,
          onToggleDarkMode: _toggleDarkMode,
        );
        break;
    }
 
    return MaterialApp(
      title: 'Campus Wellness Tracker',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: _isDarkMode ? ThemeMode.dark : ThemeMode.light,
      home: activeWidget,
    );
  }
}
 