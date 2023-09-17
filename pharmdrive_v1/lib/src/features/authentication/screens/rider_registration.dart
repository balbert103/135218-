import 'package:flutter/material.dart';

class RiderRegistrationPage extends StatefulWidget {
  @override
  _RiderRegistrationPageState createState() => _RiderRegistrationPageState();
}

class _RiderRegistrationPageState extends State<RiderRegistrationPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? _email;
  String? _password;
  String? _firstName;
  String? _lastName;
  String? _nationalId;
  int? _age;
  String? _phoneNumber;
  String? _bikeType;
  String? _bikeColor;
  String? _numberPlate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rider Registration'),
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
                  obscureText: true,
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

                // First Name Field
                TextFormField(
                  decoration: InputDecoration(labelText: 'First Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your first name';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _firstName = value;
                  },
                ),

                // Last Name Field
                TextFormField(
                  decoration: InputDecoration(labelText: 'Last Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your last name';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _lastName = value;
                  },
                ),

                // National ID Field
                TextFormField(
                  decoration: InputDecoration(labelText: 'National ID'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your national ID';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _nationalId = value;
                  },
                ),

                // Age Field
                TextFormField(
                  decoration: InputDecoration(labelText: 'Age'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your age';
                    }
                    // You can add age validation logic here
                    return null;
                  },
                  onSaved: (value) {
                    _age = int.tryParse(value!);
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

                // Bike Type Field
                TextFormField(
                  decoration: InputDecoration(labelText: 'Bike Type'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your bike type';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _bikeType = value;
                  },
                ),

                // Bike Color Field
                TextFormField(
                  decoration: InputDecoration(labelText: 'Bike Color'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your bike color';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _bikeColor = value;
                  },
                ),

                // Number Plate Field
                TextFormField(
                  decoration: InputDecoration(labelText: 'Number Plate'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your number plate';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _numberPlate = value;
                  },
                ),

                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      // Rider registration logic
                      // Access the collected data using _email, _password, etc.
                    }
                  },
                  child: Text('Register as Rider'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
