import 'package:flutter/material.dart';
import '../data/dummy_data.dart';
import '../models/activity_category.dart';
import '../widgets/category_grid_item.dart';
import 'activities_screen.dart';
import 'favorites_screen.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  void _selectCategory(BuildContext context, ActivityCategory category) {
    final filteredActivities = dummyActivities
        .where((activity) => activity.categories.contains(category.id))
        .toList();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => ActivitiesScreen(
          title: category.title,
          activities: filteredActivities,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CampusHub Categories'),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (ctx) => const FavoritesScreen()),
              );
            },
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (ctx, constraints) {
          int crossAxisCount = constraints.maxWidth > 600 ? 3 : 2;
          
          return GridView(
            padding: const EdgeInsets.all(24),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
            ),
            children: [
              for (final category in availableCategories)
                CategoryGridItem(
                  category: category,
                  onSelectCategory: () => _selectCategory(context, category),
                ),
            ],
          );
        },
      ),
    );
  }
}
