import 'package:flutter/material.dart';
import 'package:my_first_app/screens/home.screen.dart';
import 'package:my_first_app/screens/login_screen.dart';
import 'package:my_first_app/screens/signup_screen.dart';
import 'package:my_first_app/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Zillow Clone',
      theme: ThemeData(
        // FIXED: Added 'ColorScheme' class name
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      // We use initialRoute instead of 'home:' when using a routes map
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/home': (context) => const Home(),
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignupScreen(),
      },
    );
  }
}