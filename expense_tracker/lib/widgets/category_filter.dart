import 'package:flutter/material.dart';

import 'package:expense_tracker/models/expense.dart';

class CategoryFilter extends StatelessWidget {
  const CategoryFilter({
    super.key,
    required this.selected,
    required this.onSelected,
  });

  final Category? selected;
  final void Function(Category?) onSelected;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Row(
        children: [
          ChoiceChip(
            label: const Text('All'),
            selected: selected == null,
            onSelected: (_) => onSelected(null),
          ),
          for (final category in Category.values) ...[
            const SizedBox(width: 8),
            ChoiceChip(
              avatar: Icon(categoryIcons[category], size: 18),
              label: Text(category.name),
              selected: selected == category,
              onSelected: (_) => onSelected(category),
            ),
          ],
        ],
      ),
    );
  }
}