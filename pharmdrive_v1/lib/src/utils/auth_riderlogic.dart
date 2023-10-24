import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthRiderLogic {
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static Future<void> registerRider({
    required String email,
    required String firstName,
    required String lastName,
    required String nationalId,
    required String kraNumber,
    required String phoneNumber,
    required String bikeType,
    required String bikeColour,
    required String numberPlate,
    required String password,
  }) async {
    try {
      // Create a Firebase user account
      final UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Additional logic: Store user data in Firestore
      await _firestore.collection('riders').doc(userCredential.user!.uid).set({
        'firstName': firstName,
        'lastName': lastName,
        'nationalId': nationalId,
        'kraNumber': kraNumber,
        'phoneNumber': phoneNumber,
        'bikeType': bikeType,
        'bikeColour': bikeColour,
        'numberPlate': numberPlate,
        'role': 'rider', // Set the user role
      });

      // You can also perform additional tasks like sending a confirmation email, etc.
    } catch (e) {
      throw Exception('Error during rider registration: $e');
    }
  }
}
