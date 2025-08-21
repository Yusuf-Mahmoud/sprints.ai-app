import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show FilteringTextInputFormatter;
import 'package:shoppingapp/loginpage.dart';

class Signuppage extends StatefulWidget {
  const Signuppage({super.key});

  @override
  State<Signuppage> createState() => _SignuppageState();
}

class _SignuppageState extends State<Signuppage> {
  TextEditingController fullnamecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  final _formkey = GlobalKey<FormState>();
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
                      child: Hero(
                        tag: 'El-Makhzan',
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Create Account',
                              style: TextStyle(
                                fontSize: 27,
                                color: Colors.deepPurpleAccent,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Join El-Makhzan today',
                              style: TextStyle(fontSize: 15),
                            ),
                            SizedBox(height: 20),
                            Text("Full Name"),
                            TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'You must enter Full Name';
                                }
                                if (value[0] != value[0].toUpperCase()) {
                                  return 'First letter must be capital';
                                }
                                return null;
                              },
                              controller: fullnamecontroller,
                              inputFormatters: [
                                FilteringTextInputFormatter.deny(RegExp(r"\s")),
                              ],
                              decoration: const InputDecoration(
                                hintText: "Enter your full name",
                                border: OutlineInputBorder(),
                              ),
                            ),

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
                                  return 'You Must Enter Password';
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
                            SizedBox(height: 15),
                            Text("Confirm Password"),
                            TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'You Must Enter Confirm Password';
                                }
                                if (value != passwordcontroller.text) {
                                  return 'Password and Confirm Password must match';
                                }
                                return null;
                              },
                              obscureText: true,
                              decoration: InputDecoration(
                                hintText: "Confirm your password",
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
                                              tr(
                                              'Signup massage'),
                                            ),
                                            actions: [
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.pushAndRemoveUntil(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          Loginpage(),
                                                    ),
                                                    (Route<dynamic> route) =>
                                                        false,
                                                  );
                                                },
                                                child: Text(tr('close')),
                                              ),
                                            ],
                                          ),
                                    );
                                  }
                                },
                                child: Text(
                                  tr("Create Account"),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
