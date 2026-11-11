import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/favorites_provider.dart';
import 'screens/categories_screen.dart';
 
void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FavoritesProvider()),
      ],
      child: const CampusHubApp(),
    ),
  );
}
 
class CampusHubApp extends StatelessWidget {
  const CampusHubApp({super.key});
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CampusHub',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 34, 44, 194),
          primary: const Color(0xFF1E3C72),
          secondary: const Color(0xFF2A5298),
          surface: const Color(0xFFF8FAFC),
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: const Color(0xFFF4F6F9),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Color(0xFF1E3C72),
          iconTheme: IconThemeData(color: Colors.white),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
          ),
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(fontSize: 14, color: Color(0xFF334155)),
        ),
        cardTheme: CardThemeData(
          elevation: 6,
          shadowColor: const Color(0xFF1E3C72).withOpacity(0.15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
      home: const CategoriesScreen(),
    );
  }
}
