import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/services/auth.dart';
import 'package:flutter_ecommerce/utilities/enums.dart';

class AuthController with ChangeNotifier {
  final AuthBase authBase;
  String email;
  String password;
  AuthType authType;

  AuthController({
    required this.authBase,
    this.email = '',
    this.password = '',
    this.authType = AuthType.login,
  });

  void updateEmail(String email) => copyWith(email: email);

  void updatePassword(String password) => copyWith(password: password);

  void copyWith({
    String? email,
    String? password,
    AuthType? authType,
  }) {
    this.email = email ?? this.email;
    this.password = password ?? this.password;
    this.authType = authType ?? this.authType;
    notifyListeners();
  }

  void toggleLoginAndRegister() {
    final authFormType = (authType == AuthType.login)
        ? authType = AuthType.register
        : authType = AuthType.login;

    copyWith(authType: authFormType, email: '', password: '');
  }

  Future<void> submit() async {
    try {
      if (authType == AuthType.login) {
        await authBase.loginWithEmailAndPassword(
            email: email, password: password);
      } else {
        await authBase.signUpWithEmailAndPassword(
            email: email, password: password);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> signOut() async {
    await authBase.logOut();
  }
}
