import 'package:flutter/material.dart';
import '../models/activity.dart';
import '../widgets/activity_card.dart';
import 'activity_detail_screen.dart';
 
class ActivitiesScreen extends StatelessWidget {
  const ActivitiesScreen({
    super.key,
    required this.title,
    required this.activities,
  });
 
  final String title;
  final List<Activity> activities;
 
  @override
  Widget build(BuildContext context) {
    Widget content;
 
    if (activities.isEmpty) {
      content = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.info_outline, size: 64, color: Colors.grey),
            const SizedBox(height: 16),
            Text(
              'No activities available in this category.',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Colors.grey[700],
                  ),
            ),
          ],
        ),
      );
    } else {
      content = ListView.builder(
        itemCount: activities.length,
        itemBuilder: (ctx, index) => ActivityCard(
          activity: activities[index],
          onSelectActivity: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ActivityDetailScreen(
                  activity: activities[index],
                ),
              ),
            );
          },
        ),
      );
    }
 
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: content,
    );
  }
}
 