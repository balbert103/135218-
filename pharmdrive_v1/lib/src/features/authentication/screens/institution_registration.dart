import 'package:flutter/material.dart';
import 'package:pharmdrive_v1/src/features/authentication/controllers/institutionAuthenticationController.dart';

class InstitutionRegistrationPage extends StatefulWidget {
  @override
  _InstitutionRegistrationPageState createState() =>
      _InstitutionRegistrationPageState();
}

class _InstitutionRegistrationPageState
    extends State<InstitutionRegistrationPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final InstitutionAuthService _auth = InstitutionAuthService();

  String? _email;
  String? _password;
  String? _location;
  String? _phoneNumber;
  String? _institutionName;
  String? _status;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Institution Registration'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                // Email Field
                TextFormField(
                  decoration: InputDecoration(labelText: 'Email'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    // You can add email validation logic here
                    return null;
                  },
                  onSaved: (value) {
                    _email = value;
                  },
                ),

                // Password Field
                TextFormField(
                  decoration: InputDecoration(labelText: 'Password'),
                  obscureText: true, // Hide password text
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    // You can add password validation logic here
                    return null;
                  },
                  onSaved: (value) {
                    _password = value;
                  },
                ),

                // Location Field
                TextFormField(
                  decoration: InputDecoration(labelText: 'Location'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your location';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _location = value;
                  },
                ),

                // Phone Number Field
                TextFormField(
                  decoration: InputDecoration(labelText: 'Phone Number'),
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    // You can add phone number validation logic here
                    return null;
                  },
                  onSaved: (value) {
                    _phoneNumber = value;
                  },
                ),

                // Institution Name Field
                TextFormField(
                  decoration: InputDecoration(labelText: 'Institution Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your institution name';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _institutionName = value;
                  },
                ),

                // Status Field
                TextFormField(
                  decoration: InputDecoration(labelText: 'Status'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your status';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _status = value;
                  },
                ),

                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();

                      // Call InstitutionAuthService to register the institution
                      final result = await _auth.registerInstitution(
                        email: _email!,
                        password: _password!,
                        institutionName: _institutionName!,
                        location: _location!,
                        phoneNumber: _phoneNumber!,
                        status: _status!,
                      );

                      if (result == null) {
                        // Registration successful
                        // You can navigate to a success page or perform other actions
                      } else {
                        // Registration failed, show an error message
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(result),
                          ),
                        );
                      }
                    }
                  },
                  child: Text('Register as Institution'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
