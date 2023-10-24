import 'package:flutter/material.dart';
import 'package:pharmdrive_v1/src/features/authentication/screens/registration_selection_page.dart';
import 'package:pharmdrive_v1/src/features/pages/screens/institutionhomepage.dart';
import 'package:pharmdrive_v1/src/features/pages/screens/riderhomepage.dart';
import 'package:pharmdrive_v1/src/utils/auth_loginlogic.dart';
// Import your authentication logic

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your email.';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: 'Password'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your password.';
                  }
                  return null;
                },
                obscureText: true,
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Call the login logic here.
                    /* AuthLoginLogic.login(
                      email: _emailController.text,
                      password: _passwordController.text,
                      onSuccess: (user) {
                        // Check user role and navigate to the respective page
                        if (user.role == 'rider') {
                          // Navigate to the rider page
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                                builder: (context) => const RiderHomePage()),
                          );
                        } else if (user.role == 'institution') {
                          // Navigate to the institution page
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                                builder: (context) => const InstitutionHomePage()),
                          );
                        }
                      },
                      onError: (error) {
                        // Handle login errors, e.g., show error message to the user.
                      },
                    );*/
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const InstitutionHomePage()));
                  }
                },
                child: Text('Login'),
              ),
              TextButton(
                onPressed: () {
                  // Navigate to the login page.
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => RegistrationSelectionPage()));
                  // You can implement this navigation logic.
                },
                child: Text('Already Registered? Register here.'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
