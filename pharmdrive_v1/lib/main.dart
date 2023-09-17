import 'package:flutter/material.dart';
import 'package:pharmdrive_v1/src/features/authentication/screens/welcome_page.dart';
import 'package:pharmdrive_v1/src/routing/approutes.dart';

// Adjust the import path

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App',
      initialRoute:
          AppRoutes.welcome, // Set the initial route to the WelcomePage
      routes: {
        AppRoutes.welcome: (context) =>
            WelcomePage(), // Define the WelcomePage route
        // Add more routes for other screens as needed
      },
    );
  }
}
