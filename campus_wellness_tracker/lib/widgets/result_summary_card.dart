import 'package:flutter/material.dart';
 
class ResultSummaryCard extends StatelessWidget {
  final int score;
  final String classification;
  final String recommendation;
 
  const ResultSummaryCard({
    super.key,
    required this.score,
    required this.classification,
    required this.recommendation,
  });
 
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
 
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Text(
              'Your Wellness Score',
              style: theme.textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Text(
              '$score / 20',
              style: theme.textTheme.displayMedium?.copyWith(
                color: theme.colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Divider(height: 32),
            Text(
              'Classification',
              style: theme.textTheme.labelMedium,
            ),
            const SizedBox(height: 4),
            Text(
              classification,
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.secondary,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Recommendation',
              style: theme.textTheme.labelMedium,
            ),
            const SizedBox(height: 4),
            Text(
              recommendation,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
 