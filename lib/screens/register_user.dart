import 'package:flutter/material.dart';
import '../widgets/registration_form.dart';
import './loading_screen.dart';

class RegisterUser extends StatefulWidget {
  static const rout = 'register-user';

  @override
  State<RegisterUser> createState() => _RegisterUserState();
}

class _RegisterUserState extends State<RegisterUser> {
  bool isLoading = false;

  setIsLoading(bool value) {
    setState(() {
      isLoading = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register User"),
      ),
      body: isLoading ? const LoadingScreen() : RegistrationForm(setIsLoading),
    );
  }
}
