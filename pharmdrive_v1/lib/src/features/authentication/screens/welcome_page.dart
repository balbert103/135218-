import 'package:flutter/material.dart';
import 'package:pharmdrive_v1/src/features/authentication/screens/login_page.dart';
import 'package:pharmdrive_v1/src/features/authentication/screens/registration_selection_page.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                // Implement login logic here
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginPage(),
                  ),
                );
              },
              child: Text('Login'),
            ),
            SizedBox(height: 20), // Add spacing between buttons
            ElevatedButton(
              onPressed: () {
                // Navigate to the RegistrationSelectionPage
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RegistrationSelectionPage(),
                  ),
                );
              },
              child: Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}
