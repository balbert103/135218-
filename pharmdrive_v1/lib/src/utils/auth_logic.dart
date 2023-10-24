import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthLogic {
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static Future<void> registerInstitution({
    required String email,
    required String password,
    required String institutionName,
    required String location,
    required String phoneNumber,
    required String status,
  }) async {
    try {
      // Create a Firebase user account
      final UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Additional logic: Store user data in Firestore
      await _firestore
          .collection('institutions')
          .doc(userCredential.user!.uid)
          .set({
        'institutionName': institutionName,
        'location': location,
        'phoneNumber': phoneNumber,
        'status': status,
        'role': 'institution_user',
      });

      // You can also perform additional tasks like sending a confirmation email, etc.
    } catch (e) {
      throw Exception('Error during registration: $e');
    }
  }
}
