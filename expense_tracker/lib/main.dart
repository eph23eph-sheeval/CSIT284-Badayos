import 'package:flutter/material.dart';

import 'package:expense_tracker/widgets/expenses.dart';

const kIronRed = Color(0xFFE53935);
const kDeepRed = Color(0xFF8E0000);
const kGold = Color(0xFFFFC107);
const kDarkBg = Color(0xFF140606);

const kIronScheme = ColorScheme.dark(
  primary: kIronRed,
  onPrimary: Colors.white,
  primaryContainer: kDeepRed,
  onPrimaryContainer: Color(0xFFFFD54F),
  secondary: kGold,
  onSecondary: Colors.black,
  secondaryContainer: Color(0xFF3A0D0D),
  onSecondaryContainer: Color(0xFFFFD54F),
  surface: kDarkBg,
  onSurface: Color(0xFFFFF3E0),
);

ThemeData buildIronTheme() {
  return ThemeData.dark().copyWith(
    useMaterial3: true,
    colorScheme: kIronScheme,
    scaffoldBackgroundColor: kDarkBg,
    appBarTheme: const AppBarTheme(
      backgroundColor: kDeepRed,
      foregroundColor: kGold,
      elevation: 6,
      shape: Border(bottom: BorderSide(color: kGold, width: 2)),
    ),
    cardTheme: CardThemeData(
      color: kIronScheme.secondaryContainer,
      elevation: 4,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
        side: BorderSide(color: kGold.withValues(alpha: 0.5), width: 1),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: kIronRed,
        foregroundColor: kGold,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: kGold),
    ),
    textTheme: ThemeData.dark().textTheme.copyWith(
          titleLarge: const TextStyle(
            fontWeight: FontWeight.bold,
            color: kGold,
            fontSize: 17,
          ),
        ),
  );
}

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: buildIronTheme(),
      darkTheme: buildIronTheme(),
      themeMode: ThemeMode.dark,
      home: const Expenses(),
    ),
  );
}