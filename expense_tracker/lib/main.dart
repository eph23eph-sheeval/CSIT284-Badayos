import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

import 'package:expense_tracker/widgets/expenses.dart';

// Iron Man palette
const kIronRed = Color(0xFFB71C1C);
const kDeepRed = Color(0xFF7B0D0D);
const kArcGold = Color(0xFFFFC72C);
const kPaleGold = Color(0xFFFFEBB3);

final kColorScheme = ColorScheme.fromSeed(seedColor: kIronRed).copyWith(
  primary: kIronRed,
  onPrimary: Colors.white,
  primaryContainer: kArcGold,
  onPrimaryContainer: kDeepRed,
  secondary: const Color(0xFFC9971C),
  secondaryContainer: kPaleGold,
  onSecondaryContainer: kDeepRed,
  surface: const Color(0xFFFFF8E7),
);

final kDarkColorScheme = ColorScheme.fromSeed(
  seedColor: kIronRed,
  brightness: Brightness.dark,
).copyWith(
  primary: kArcGold,
  onPrimary: kDeepRed,
  primaryContainer: kIronRed,
  onPrimaryContainer: kArcGold,
  secondary: kArcGold,
  secondaryContainer: const Color(0xFF3A1212),
  onSecondaryContainer: kArcGold,
  surface: const Color(0xFF140707),
);

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  // ]).then((fn) {
  runApp(
    MaterialApp(
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: kDarkColorScheme,
        scaffoldBackgroundColor: kDarkColorScheme.surface,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kDeepRed,
          foregroundColor: kArcGold,
        ),
        cardTheme: const CardThemeData().copyWith(
          color: kDarkColorScheme.secondaryContainer,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: const BorderSide(color: kArcGold, width: 1),
          ),
          margin: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kIronRed,
            foregroundColor: kArcGold,
          ),
        ),
        textTheme: ThemeData.dark().textTheme.copyWith(
              titleLarge: const TextStyle(
                fontWeight: FontWeight.bold,
                color: kArcGold,
                fontSize: 16,
              ),
            ),
      ),
      theme: ThemeData().copyWith(
        colorScheme: kColorScheme,
        scaffoldBackgroundColor: kColorScheme.surface,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kIronRed,
          foregroundColor: kArcGold,
        ),
        cardTheme: const CardThemeData().copyWith(
          color: kColorScheme.secondaryContainer,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: const BorderSide(color: kIronRed, width: 1),
          ),
          margin: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kIronRed,
            foregroundColor: kArcGold,
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: const TextStyle(
                fontWeight: FontWeight.bold,
                color: kDeepRed,
                fontSize: 16,
              ),
            ),
      ),
      themeMode: ThemeMode.dark, // change to ThemeMode.system to follow the device
      home: const Expenses(),
    ),
  );
  // });
}