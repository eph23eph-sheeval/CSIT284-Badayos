import 'package:flutter/material.dart';
 
class HomeScreen extends StatelessWidget {
  final VoidCallback onStart;
  final bool isDarkMode;
  final ValueChanged<bool> onToggleDarkMode;
 
  const HomeScreen({
    super.key,
    required this.onStart,
    required this.isDarkMode,
    required this.onToggleDarkMode,
  });
 
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final mediaQuery = MediaQuery.of(context);
    final isLandscape = mediaQuery.orientation == Orientation.landscape;
 
    Widget headerSection = Column(
      children: [
        Icon(
          Icons.health_and_safety_outlined,
          size: isLandscape ? 60 : 80,
          color: theme.colorScheme.primary,
        ),
        const SizedBox(height: 12),
        Text(
          'Campus Wellness Tracker',
          style: theme.textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Text(
          'Evaluate your current study-life balance.',
          style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.colorScheme.onSurface.withAlpha(180),
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
 
    Widget studentInfoCard = Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            const CircleAvatar(
              radius: 24,
              child: Icon(Icons.person),
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Johanne Igor Badayos',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'BSIT-3',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.secondary,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
 
    Widget actionArea = Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Dark Mode'),
            const SizedBox(width: 8),
            Switch.adaptive(
              value: isDarkMode,
              onChanged: onToggleDarkMode,
            ),
          ],
        ),
        const SizedBox(height: 12),
        ElevatedButton(
          onPressed: onStart,
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 50),
          ),
          child: const Text('Start Assessment'),
        ),
      ],
    );
 
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: isLandscape
              ? Row(
                  children: [
                    Expanded(child: headerSection),
                    const SizedBox(width: 24),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          studentInfoCard,
                          const SizedBox(height: 20),
                          actionArea,
                        ],
                      ),
                    ),
                  ],
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    headerSection,
                    studentInfoCard,
                    actionArea,
                  ],
                ),
        ),
      ),
    );
  }
}
 