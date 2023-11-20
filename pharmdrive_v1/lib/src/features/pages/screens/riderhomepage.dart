import 'package:flutter/material.dart';

class RiderHomePage extends StatelessWidget {
  const RiderHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rider Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Welcome to the Rider Home Page!',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Add logic for rider-specific actions here
              },
              child: const Text('Rider Action'),
            ),
          ],
        ),
      ),
    );
  }
}
