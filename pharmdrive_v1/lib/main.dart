import 'package:flutter/material.dart';
import 'package:pharmdrive_v1/src/features/authentication/screens/welcome_page.dart';
import 'package:pharmdrive_v1/src/routing/approutes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

// Adjust the import path

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pharmdirve',
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
