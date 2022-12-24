import 'dart:math';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:resnep/screens/forgot%20password.dart';

class LogIn extends StatelessWidget {
  LogIn({Key? key}) : super(key: key);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        color: Colors.white10,
        child: Center(
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.5,
            child: Card(
              elevation: 5,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Center(
                      child: Icon(
                        Icons.adobe,
                        size: MediaQuery.of(context).size.height * 0.1,
                        color: Colors.purple,
                      ),
                    ),
                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        hintText: "Email",
                        labelText: "Email",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        prefixIcon: const Icon(Icons.email_rounded),
                      ),
                    ),
                    TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Password",
                        labelText: "Password",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        prefixIcon: const Icon(
                          Icons.password_sharp,
                        ),
                      ),
                    ),
                    Center(
                      child: Column(
                        children: [
                          ElevatedButton(
                            onPressed: signIN,
                            child: const Text("Login"),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("New Here "),
                              GestureDetector(
                                onTap: () {
                                  Navigator.popAndPushNamed(context, "/signup");
                                },
                                child: const Text(
                                  "Create An Account",
                                  style: TextStyle(color: Colors.purple),
                                ),
                              )
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/forgotpw');
                            },
                            child: const Text("Forgot password",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 204, 88, 80))),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future signIN() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );
  }
}
