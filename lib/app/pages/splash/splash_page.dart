import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  final String title;
  const SplashPage({Key? key, this.title = 'SplashPage'}) : super(key: key);
  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      (user == null)
          ? Future.delayed(const Duration(seconds: 5), () {
              setState(() {
                Navigator.pushReplacementNamed(context, '/login/');
              });
            })
          : Future.delayed(const Duration(seconds: 5), () {
              setState(() {
                Navigator.pushReplacementNamed(context, '/main/');
              });
            });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Image(
                width: 200,
                image: AssetImage('assets/images/temparty.png'),
                fit: BoxFit.contain,
              ),
              Padding(
                padding: EdgeInsets.only(top: 40),
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
