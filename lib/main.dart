import 'package:flutter/material.dart';
import 'package:movie_search/Screens/home.dart';
import 'package:movie_search/Screens/splash_screen.dart';
import 'screens/search_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies ',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/home': (context) => const HomeScreen(),
        '/search': (context) => const SearchScreen(),
      },
    );
  }
}
