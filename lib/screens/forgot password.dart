import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();

  bool resetClick = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        color: Colors.white10,
        child: Center(
          child: Container(
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
                      decoration: InputDecoration(
                        hintText: "Email",
                        labelText: "Email",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        prefixIcon: const Icon(Icons.email_rounded),
                      ),
                    ),
                    resetClick
                        ? TextFormField(
                            decoration: InputDecoration(
                              hintText: "Email",
                              labelText: "Email",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              prefixIcon: const Icon(Icons.email_rounded),
                            ),
                          )
                        : const SizedBox(),
                    Center(
                      child: Column(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              print("reset clicked");
                              resetClick = true;
                            },
                            child: const Text("Reset Password"),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Already have an account "),
                              GestureDetector(
                                onTap: () {
                                  Navigator.popAndPushNamed(context, "/login");
                                },
                                child: const Text(
                                  "Log In",
                                  style: TextStyle(color: Colors.purple),
                                ),
                              )
                            ],
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
}
