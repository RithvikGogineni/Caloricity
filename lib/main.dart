import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/games_page.dart';
import 'pages/diet_planner_page.dart';
import 'pages/resources_page.dart';
import 'pages/community_page.dart';

void main() {
  runApp(DietaryAwarenessApp());
}

class DietaryAwarenessApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Caloricity',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
        primaryColor: Colors.orange,
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white70),
          titleLarge: TextStyle(color: Colors.white),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.black,
            backgroundColor: Colors.orange,
            textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/games': (context) => GamesPage(),
        '/diet-planner': (context) => DietPlannerPage(),
        '/resources': (context) => ResourcesPage(),
        '/community': (context) => CommunityPage(),
      },
    );
  }
}
