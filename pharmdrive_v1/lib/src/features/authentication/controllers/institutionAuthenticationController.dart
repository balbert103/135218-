import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class InstitutionAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String?> registerInstitution({
    required String email,
    required String password,
    required String institutionName,
    required String location,
    required String phoneNumber,
    required String status,
  }) async {
    try {
      // Step 1: Create a Firebase user with email and password
      final UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Step 2: Get the newly created user's UID
      final String uid = userCredential.user!.uid;

      // Step 3: Create a document for the institution in Firestore with additional fields
      await _firestore.collection('institutions').doc(uid).set({
        'email': email,
        'institutionName': institutionName,
        'location': location,
        'phoneNumber': phoneNumber,
        'status': status,
      });

      return null; // Registration successful, no error
    } catch (e) {
      return e.toString(); // Registration failed, return the error message
    }
  }
}
