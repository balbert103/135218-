import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthLoginLogic {
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static Future<void> login({
    required String email,
    required String password,
    required Function onSuccess,
    required Function onError,
  }) async {
    try {
      final UserCredential userCredential =
          await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Retrieve user role from Firestore or another source
      final userData = await _firestore
          .collection('users')
          .doc(userCredential.user!.uid)
          .get();
      final userRole = userData['user_role'] ?? '';

      if (userRole != null) {
        onSuccess(userRole);
      } else {
        onError('User role not found.');
      }
    } catch (e) {
      onError('Error during login: $e');
    }
  }
}
