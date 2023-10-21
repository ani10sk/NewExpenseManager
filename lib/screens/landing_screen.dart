import 'package:flutter/material.dart';
import '../providers/models/user.dart';

class LandingScreen extends StatelessWidget {
  static const rout = 'landing-screen';

  const LandingScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Welcome to madness"),
      ),
    );
  }
}
