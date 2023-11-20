import 'package:flutter/material.dart';
import 'package:pharmdrive_v1/src/features/authentication/screens/login_page.dart';

import 'package:pharmdrive_v1/src/utils/auth_logic.dart';

class InstitutionRegistrationPage extends StatefulWidget {
  const InstitutionRegistrationPage({Key? key}) : super(key: key);

  @override
  _InstitutionRegistrationPageState createState() =>
      _InstitutionRegistrationPageState();
}

class _InstitutionRegistrationPageState
    extends State<InstitutionRegistrationPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _institutionNameController =
      TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  String _selectedStatus = 'Level 1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Institution Registration'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your email.';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _institutionNameController,
                decoration:
                    const InputDecoration(labelText: 'Institution Name'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your institution name.';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _locationController,
                decoration: const InputDecoration(labelText: 'Location'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your location.';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _phoneNumberController,
                decoration: const InputDecoration(labelText: 'Phone Number'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your phone number.';
                  }
                  return null;
                },
              ),
              DropdownButtonFormField(
                value: _selectedStatus,
                items: ['Level 1', 'Level 2', 'Level 3', 'Level 4', 'Level 5']
                    .map<DropdownMenuItem<String>>(
                      (String value) => DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    //_selectedStatus = value!;
                  });
                },
              ),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a password.';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _confirmPasswordController,
                decoration:
                    const InputDecoration(labelText: 'Confirm Password'),
                obscureText: true,
                validator: (value) {
                  if (value != _passwordController.text) {
                    return 'Passwords do not match.';
                  }
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Perform registration with Firebase here.
                    AuthLogic.registerInstitution(
                      email: _emailController.text,
                      password: _passwordController.text,
                      institutionName: _institutionNameController.text,
                      location: _locationController.text,
                      phoneNumber: _phoneNumberController.text,
                      status: _selectedStatus,
                    );
                  }
                },
                child: Text('Register'),
              ),
              TextButton(
                onPressed: () {
                  // Navigate to the login page.
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => LoginPage()));
                  // You can implement this navigation logic.
                },
                child: Text('Already Registered? Login here'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
