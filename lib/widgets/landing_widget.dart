// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import '../providers/models/user.dart';
import '../screens/transaction_screen.dart';

class LandingWidget extends StatefulWidget {
  final User user;
  const LandingWidget(this.user, {super.key});

  @override
  State<LandingWidget> createState() => _LandingWidgetState();
}

class _LandingWidgetState extends State<LandingWidget> {
  @override
  void initState() {
    super.initState();
    navigateToTransactionScreen();
  }

  void navigateToTransactionScreen() async {
    await Future.delayed(const Duration(seconds: 5));
    Navigator.of(context).pushReplacementNamed(TransactionScreen.rout);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Welcome to madness ${widget.user.getName()}"),
      ),
    );
  }
}
