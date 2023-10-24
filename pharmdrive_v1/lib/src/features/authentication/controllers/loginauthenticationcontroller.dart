import 'package:flutter/material.dart';
import 'package:pharmdrive_v1/src/utils/auth_loginlogic.dart';
// Import your login authentication logic

class LoginAuthenticationController {
  final AuthLoginLogic _authLogic = AuthLoginLogic(); //

  Future<void> loginUser({
    required String email,
    required String password,
    required Function onSuccess,
    required Function onError,
  }) async {
    try {
      // Call the login method from AuthLoginLogic
      await AuthLoginLogic.login(
        //
        email: email,
        password: password,
        onSuccess: onSuccess,
        onError: onError,
      );
    } catch (e) {
      // Handle any login errors here, e.g., show error message to the user.
      print('Error during login: $e');
    }
  }
}
