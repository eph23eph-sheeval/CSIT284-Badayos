import 'package:flutter/material.dart';

import 'package:expense_tracker/models/expense.dart';

class SummaryCard extends StatelessWidget {
  const SummaryCard({super.key, required this.expenses});

  final List<Expense> expenses;

  double get _total => expenses.fold(0.0, (sum, e) => sum + e.amount);

  Category? get _topCategory {
    if (expenses.isEmpty) return null;
    final totals = <Category, double>{};
    for (final e in expenses) {
      totals[e.category] = (totals[e.category] ?? 0) + e.amount;
    }
    return totals.entries.reduce((a, b) => a.value >= b.value ? a : b).key;
  }

  String _capitalize(String s) => s[0].toUpperCase() + s.substring(1);

  @override
  Widget build(BuildContext context) {
    final top = _topCategory;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _Stat(label: 'Total', value: '\$${_total.toStringAsFixed(2)}'),
            _Stat(label: 'Items', value: '${expenses.length}'),
            _Stat(
              label: 'Top category',
              value: top == null ? '-' : _capitalize(top.name),
            ),
          ],
        ),
      ),
    );
  }
}

class _Stat extends StatelessWidget {
  const _Stat({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(value, style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 4),
        Text(label, style: Theme.of(context).textTheme.bodySmall),
      ],
    );
  }
}