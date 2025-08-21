import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shoppingapp/signupPage.dart';
import 'package:shoppingapp/singinPage.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tr('title')),
        actions: [
          IconButton(
            icon: const Icon(Icons.language),
            onPressed: () {
              if (context.locale.languageCode == 'en') {
                context.setLocale(const Locale('ar', 'EG'));
              } else {
                context.setLocale(const Locale('en', 'US'));
              }
            },
          ),
        ],
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/storeimages.jpg',
                width: MediaQuery.of(context).size.width * 0.4,
                height: MediaQuery.of(context).size.height * 0.2,
              ),
              SizedBox(width: 20),
              Image.network(
                'https://images.unsplash.com/photo-1511707171634-5f897ff02aa9',
                width: MediaQuery.of(context).size.width * 0.4,
                height: MediaQuery.of(context).size.height * 0.2,
              ),
            ],
          ),
          SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: 'El-Makhzan',
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Signuppage()),
                    );
                  },
                  child: Text(tr('Sign Up')),
                ),
              ),
              SizedBox(width: 100),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Singinpage()),
                  );
                },
                child: Text(tr('Sign In')),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
