import 'package:pharmdrive_v1/src/utils/auth_riderlogic.dart';
// Import your rider authentication logic

class RiderRegistrationController {
  final AuthRiderLogic _authLogic = AuthRiderLogic();

  Future<void> registerRider({
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
      // Call the registration method from AuthRiderLogic
      await AuthRiderLogic.registerRider(
        email: email,
        firstName: firstName,
        lastName: lastName,
        nationalId: nationalId,
        kraNumber: kraNumber,
        phoneNumber: phoneNumber,
        bikeType: bikeType,
        bikeColour: bikeColour,
        numberPlate: numberPlate,
        password: password,
      );
    } catch (e) {
      // Handle any registration errors here, e.g., show error message to the user.
      print('Error during rider registration: $e');
    }
  }
}
