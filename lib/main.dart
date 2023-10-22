import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './providers/repositories/benefactor_repo.dart';
import './providers/repositories/category_repo.dart';
import './providers/repositories/note_repo.dart';
import './providers/repositories/transaction_repo.dart';
import './screens/register_user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './providers/models/user.dart';
import './providers/controllers/user_controller.dart';
import './widgets/loading_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    getUser() async {
      try {
        UserController userController = UserController();
        SharedPreferences prefs = await SharedPreferences.getInstance();
        String? storedJSON = prefs.getString("user");
        if (storedJSON != null) {
          Map<String, dynamic> userMap = jsonDecode(storedJSON);
          User user = userController.getUser(
              userMap["name"], userMap["dateOfBirth"], userMap["phoneNumber"]);
          return user;
        }
      } catch (exception) {
        throw Exception(exception);
      }
    }

    return MultiProvider(
      providers: [
        ChangeNotifierProvider<BenefactorRepo>(create: (_) => BenefactorRepo()),
        ChangeNotifierProvider<CategoryRepo>(create: (_) => CategoryRepo()),
        ChangeNotifierProvider<NoteRepo>(create: (_) => NoteRepo()),
        ChangeNotifierProvider<TransactionRepo>(
            create: (_) => TransactionRepo())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: FutureBuilder(
            future: getUser(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Scaffold(
                  body: Center(
                    child: LoadingWidget(),
                  ),
                );
              } else if (snapshot.hasError) {
                return RegisterUser(null);
              } else {
                User? user = snapshot.data;
                return RegisterUser(user);
              }
            }),
        routes: const {},
      ),
    );
  }
}
