// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class signUp extends StatelessWidget {
//   TextEditingController email = TextEditingController();
//   TextEditingController password = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         height: MediaQuery.of(context).size.height,
//         width: double.infinity,
//         color: Colors.white10,
//         child: Center(
//           child: Container(
//             height: MediaQuery.of(context).size.height * 0.5,
//             child: Card(
//               elevation: 5,
//               color: Colors.white,
//               child: Padding(
//                 padding: const EdgeInsets.all(20),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     Center(
//                       child: Icon(
//                         Icons.adobe,
//                         size: MediaQuery.of(context).size.height * 0.1,
//                         color: Colors.purple,
//                       ),
//                     ),
//                     TextFormField(
//                       decoration: InputDecoration(
//                         hintText: "Email",
//                         labelText: "Email",
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(8),
//                         ),
//                         prefixIcon: const Icon(Icons.email_rounded),
//                       ),
//                     ),
//                     TextFormField(
//                       obscureText: true,
//                       decoration: InputDecoration(
//                         hintText: "Password",
//                         labelText: "Password",
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(8),
//                         ),
//                         prefixIcon: const Icon(
//                           Icons.password_sharp,
//                         ),
//                       ),
//                     ),
//                     Center(
//                       child: Column(
//                         children: [
//                           ElevatedButton(
//                             onPressed: signUP,
//                             child: const Text("SignUp"),
//                           ),
// Row(
//   mainAxisAlignment: MainAxisAlignment.center,
//   children: [
//     const Text("Already have an account "),
//     GestureDetector(
//       onTap: () {
//         Navigator.popAndPushNamed(context, "/login");
//       },
//       child: const Text(
//         "Log In",
//         style: TextStyle(color: Colors.purple),
//       ),
//     )
//   ],
// ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Future signUP() async {
//     await FirebaseAuth.instance.createUserWithEmailAndPassword(
//       email: email.text.trim(),
//       password: password.text.trim(),
//     );
//   }
// }
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:resnep/screens/forgot%20password.dart';

class signUp extends StatelessWidget {
  signUp({Key? key}) : super(key: key);
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
                            onPressed: signUP,
                            child: const Text("Sign up"),
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

  Future signUP() async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );
  }

  Future signIN() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );
  }
}
