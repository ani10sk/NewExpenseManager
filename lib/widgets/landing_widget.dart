import 'package:flutter/material.dart';
import '../providers/models/user.dart';

class LandingWidget extends StatelessWidget {
  final User user;
  const LandingWidget(this.user, {super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Welcome to madness ${user.getName()}"),
      ),
    );
  }
}
