import 'package:flutter/material.dart';
import 'package:pharmdrive_v1/src/features/authentication/screens/institution_registration.dart';
import 'package:pharmdrive_v1/src/features/authentication/screens/rider_registration.dart';

class RegistrationSelectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration Selection'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                // Navigate to RiderRegistrationPage
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RiderRegistrationPage(),
                  ),
                );
              },
              child: Text('Register as Rider'),
            ),
            SizedBox(height: 20), // Add spacing between buttons
            ElevatedButton(
              onPressed: () {
                // Navigate to InstitutionRegistrationPage
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => InstitutionRegistrationPage(),
                  ),
                );
              },
              child: Text('Register as Institution'),
            ),
          ],
        ),
      ),
    );
  }
}
