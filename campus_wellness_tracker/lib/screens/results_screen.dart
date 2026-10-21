import 'package:flutter/material.dart';
import '../widgets/result_summary_card.dart';
 
class ResultsScreen extends StatelessWidget {
  final int totalScore;
  final VoidCallback onRestart;
 
  const ResultsScreen({
    super.key,
    required this.totalScore,
    required this.onRestart,
  });
 
  String get classification {
    if (totalScore >= 16) return 'Excellent Wellness Habits';
    if (totalScore >= 11) return 'Moderate Wellness Habits';
    return 'Needs Improvement';
  }
 
  String get recommendation {
    if (totalScore >= 16) {
      return 'Keep maintaining your current healthy routine and study-life balance.';
    } else if (totalScore >= 11) {
      return 'Consider improving your sleep and taking more structured study breaks.';
    } else {
      return 'Prioritize rest, hydration, and exercise to prevent burnout.';
    }
  }
 
  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
 
    Widget summaryCard = ResultSummaryCard(
      score: totalScore,
      classification: classification,
      recommendation: recommendation,
    );
 
    Widget restartButton = ElevatedButton.icon(
      onPressed: onRestart,
      icon: const Icon(Icons.refresh),
      label: const Text('Restart Assessment'),
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 50),
      ),
    );
 
    return Scaffold(
      appBar: AppBar(title: const Text('Results')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: isLandscape
              ? Row(
                  children: [
                    Expanded(child: SingleChildScrollView(child: summaryCard)),
                    const SizedBox(width: 24),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [restartButton],
                      ),
                    ),
                  ],
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    summaryCard,
                    restartButton,
                  ],
                ),
        ),
      ),
    );
  }
}
 