import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './providers/repositories/benefactor_repo.dart';
import './providers/repositories/category_repo.dart';
import './providers/repositories/note_repo.dart';
import './providers/repositories/transaction_repo.dart';
import './screens/register_user.dart';
import './screens/landing_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
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
          // This is the theme of your application.
          //
          // TRY THIS: Try running your application with "flutter run". You'll see
          // the application has a blue toolbar. Then, without quitting the app,
          // try changing the seedColor in the colorScheme below to Colors.green
          // and then invoke "hot reload" (save your changes or press the "hot
          // reload" button in a Flutter-supported IDE, or press "r" if you used
          // the command line to start the app).
          //
          // Notice that the counter didn't reset back to zero; the application
          // state is not lost during the reload. To reset the state, use hot
          // restart instead.
          //
          // This works for code too, not just values: Most code changes can be
          // tested with just a hot reload.
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: RegisterUser(),
        routes: {LandingScreen.rout: (context) => LandingScreen()},
      ),
    );
  }
}
