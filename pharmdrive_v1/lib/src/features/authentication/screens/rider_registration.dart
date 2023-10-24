import 'package:flutter/material.dart';
import 'package:pharmdrive_v1/src/features/authentication/controllers/RiderAuthenticationController.dart';
import 'package:pharmdrive_v1/src/features/authentication/screens/login_page.dart';
import 'package:pharmdrive_v1/src/utils/auth_riderlogic.dart';

// Import your authentication logic

class RiderRegistrationPage extends StatefulWidget {
  @override
  _RiderRegistrationPageState createState() => _RiderRegistrationPageState();
}

class _RiderRegistrationPageState extends State<RiderRegistrationPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _nationalIdController = TextEditingController();
  final TextEditingController _kraNumberController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _bikeTypeController = TextEditingController();
  final TextEditingController _bikeColourController = TextEditingController();
  final TextEditingController _numberPlateController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rider Registration'),
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
                decoration: InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your email.';
                  }
                  return null;
                },
              ),
              // Add similar TextFormField widgets for other fields (firstname, lastname, national id, kra number, phone number, bike type, bike colour, numberplate, password, confirm password)

              // First Name
              TextFormField(
                controller: _firstNameController,
                decoration: const InputDecoration(labelText: 'First Name'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your first name.';
                  }
                  return null;
                },
              ),
              // Last Name
              TextFormField(
                controller: _lastNameController,
                decoration: const InputDecoration(labelText: 'Last Name'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your last name.';
                  }
                  return null;
                },
              ),
              // National ID
              TextFormField(
                controller: _nationalIdController,
                decoration: const InputDecoration(labelText: 'National ID'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your national ID.';
                  }
                  return null;
                },
              ),
              // KRA Number
              TextFormField(
                controller: _kraNumberController,
                decoration: const InputDecoration(labelText: 'KRA Number'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your KRA number.';
                  }
                  return null;
                },
              ),
              // Phone Number
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
              // Bike Type
              TextFormField(
                controller: _bikeTypeController,
                decoration: const InputDecoration(labelText: 'Bike Type'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your bike type.';
                  }
                  return null;
                },
              ),
              // Bike Colour
              TextFormField(
                controller: _bikeColourController,
                decoration: const InputDecoration(labelText: 'Bike Colour'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your bike colour.';
                  }
                  return null;
                },
              ),
              // Number Plate
              TextFormField(
                controller: _numberPlateController,
                decoration: const InputDecoration(labelText: 'Number Plate'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your number plate.';
                  }
                  return null;
                },
              ),
              // Password
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(labelText: 'Password'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your password.';
                  }
                  return null;
                },
                obscureText: true,
              ),
              // Confirm Password
              TextFormField(
                controller: _confirmPasswordController,
                decoration:
                    const InputDecoration(labelText: 'Confirm Password'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please confirm your password.';
                  }
                  if (value != _passwordController.text) {
                    return 'Passwords do not match.';
                  }
                  return null;
                },
                obscureText: true,
              ),

              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Call the rider registration logic here (similar to institution registration)
                    AuthRiderLogic.registerRider(
                      email: _emailController.text,
                      firstName: _firstNameController.text,
                      lastName: _lastNameController.text,
                      nationalId: _nationalIdController.text,
                      kraNumber: _kraNumberController.text,
                      phoneNumber: _phoneNumberController.text,
                      bikeType: _bikeTypeController.text,
                      bikeColour: _bikeColourController.text,
                      numberPlate: _numberPlateController.text,
                      password: _passwordController.text,
                    );
                  }
                },
                child: const Text('Register'),
              ),
              TextButton(
                onPressed: () {
                  // Navigate to the login page (you can implement this navigation logic)
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => LoginPage()));
                },
                child: const Text('Already Registered? Login here'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
