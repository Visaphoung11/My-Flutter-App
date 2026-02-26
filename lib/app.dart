import 'package:flutter/material.dart';
import 'screens/home.screen.dart';
import 'screens/property_detail/property_detail_screen.dart';
import 'model/property.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
        '/login': (context) => Scaffold(body: Center(child: Text("Login Page"))),
        '/profile': (context) => Scaffold(body: Center(child: Text("Profile Page"))),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/propertyDetail') {
          final property = settings.arguments as Property?;
          return MaterialPageRoute(
            builder: (context) => PropertyDetailScreen(property: property),
          );
        }
        return null;
      },
    );
  }
}