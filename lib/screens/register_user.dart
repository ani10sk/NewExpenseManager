// ignore_for_file: prefer_typing_uninitialized_variables, must_be_immutable

import 'package:flutter/material.dart';
import '../widgets/registration_form.dart';
import '../widgets/loading_widget.dart';
import '../providers/models/user.dart';
import '../widgets/landing_widget.dart';

class RegisterUser extends StatefulWidget {
  var user;
  RegisterUser(this.user, {super.key});

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

  setUser(User user) {
    setState(() {
      widget.user = user;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.user is User ? "Welcome" : "Register"),
      ),
      body: isLoading
          ? const LoadingWidget()
          : widget.user is User && widget.user != null
              ? LandingWidget(widget.user)
              : RegistrationForm(setIsLoading, setUser),
    );
  }
}
