import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:resnep/screens/content.dart';
import 'package:resnep/screens/forgot%20password.dart';
import 'package:resnep/screens/login%20screen.dart';
import 'package:resnep/screens/signup.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
        textTheme: const TextTheme(
          headline2: TextStyle(
            color: Colors.black,
            fontSize: 15,
            fontWeight: FontWeight.bold,
            backgroundColor: Colors.white54,
          ),
        ),
      ),
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          try {
            if (snapshot.hasData) {
              return const Content();
            } else {
              return LogIn();
            }
          } catch (e) {
            return AlertDialog(
              content: Text(e as String),
            );
          }
        },
      ),
      routes: {
        '/signup': (context) => signUp(),
        '/login': (context) => LogIn(),
        '/forgotpw': (context) => ForgotPassword(),
        '/content': (context) => const Content(),
      },
    );
  }
}
