import 'package:firebase_auth/firebase_auth.dart';

import 'package:pharmdrive_v1/src/utils/auth_logic.dart';

class InstitutionAuthenticationController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> registerInstitution({
    required String email,
    required String password,
    required String institutionName,
    required String location,
    required String phoneNumber,
    required String status,
  }) async {
    try {
      // Call the registration method from auth_logic.dart
      await AuthLogic.registerInstitution(
        email: email,
        password: password,
        institutionName: institutionName,
        location: location,
        phoneNumber: phoneNumber,
        status: status,
      );
    } catch (e) {
      // Handle any registration errors here, e.g., show error message to the user.
      print('Error during registration: $e');
    }
  }
}
