import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shoppingapp/ShoppingPage.dart';

class Singinpage extends StatefulWidget {
  const Singinpage({super.key});

  @override
  State<Singinpage> createState() => _SinginpageState();
}

class _SinginpageState extends State<Singinpage> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.deepPurpleAccent, Colors.blueAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            children: [
              SizedBox(height: 35),
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back, color: Colors.white),
                ),
              ),
              Expanded(
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    width: MediaQuery.of(context).size.width * 0.8,
                    padding: EdgeInsets.all(16.0),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 15),
                          Text("Email"),
                          TextFormField(
                            controller: emailcontroller,
                            keyboardType: TextInputType.emailAddress,
                            decoration: const InputDecoration(
                              hintText: "Enter your email",
                              border: OutlineInputBorder(),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'You must enter email';
                              }

                              if (!value.contains('@') ||
                                  !value.contains('.com')) {
                                return 'Email must have @ and .com';
                              }

                              return null;
                            },
                          ),
                          SizedBox(height: 15),
                          Text("Password"),
                          TextFormField(
                            validator: (value) {
                              if (value == null || value.length < 6) {
                                return 'Password must be at least 6 characters';
                              }
                              return null;
                            },
                            controller: passwordcontroller,
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: "Enter Your Password",
                              border: OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(height: 20),
                          Center(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.deepPurpleAccent,
                                padding: EdgeInsets.symmetric(
                                  horizontal: 70,
                                  vertical: 15,
                                ),
                              ),
                              onPressed: () {
                                if (_formkey.currentState!.validate()) {
                                  showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        AlertDialog(
                                          content: Text(
                                           tr ('Signin massage'),
                                          ),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.pushAndRemoveUntil(
                                                  context,
                                                  PageRouteBuilder(
                                                    pageBuilder:
                                                        (
                                                          context,
                                                          animation,
                                                          secondaryAnimation,
                                                        ) => Shoppingpage(),
                                                    transitionsBuilder:
                                                        (
                                                          context,
                                                          animation,
                                                          secondaryAnimation,
                                                          child,
                                                        ) {
                                                          return FadeTransition(
                                                            opacity: animation,
                                                            child: child,
                                                          );
                                                        },
                                                  ),
                                                  (Route<dynamic> route) =>
                                                      false,
                                                );
                                              },
                                              child: Text(tr('Close')),
                                            ),
                                          ],
                                        ),
                                  );
                                }
                              },
                              child: Text(
                               tr ("Sign InB"),
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
