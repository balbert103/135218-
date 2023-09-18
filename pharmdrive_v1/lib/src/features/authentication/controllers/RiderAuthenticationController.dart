import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String?> registerRider({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String nationalId,
    required int age,
    required String phoneNumber,
    required String bikeType,
    required String bikeColor,
    required String numberPlate,
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

      // Step 3: Create a document for the user in Firestore with additional fields
      await _firestore.collection('riders').doc(uid).set({
        'email': email,
        'firstName': firstName,
        'lastName': lastName,
        'nationalId': nationalId,
        'age': age,
        'phoneNumber': phoneNumber,
        'bikeType': bikeType,
        'bikeColor': bikeColor,
        'numberPlate': numberPlate,
      });

      return null; // Registration successful, no error
    } catch (e) {
      return e.toString(); // Registration failed, return the error message
    }
  }
}
