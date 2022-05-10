import 'package:flutter/material.dart';
import 'package:paw_record/ui/register/register_screen.dart';
import 'package:paw_record/ui/signin/signin_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF8017DA),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(children: <Widget>[
              Container(
                padding: const EdgeInsets.fromLTRB(50, 170, 10, 0),
                child: Text(
                  'Welcome',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 40),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(50, 0, 10, 0),
                child: Text(
                  'to Paw Record',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 40),
                ),
              ),

               Container(
                   padding: const EdgeInsets.fromLTRB(50, 80, 50, 0),
                    child: TextButton(
                        child: Text("Register with Email",
                            style: TextStyle(fontSize: 14)),
                        style: ButtonStyle(
                            padding: MaterialStateProperty.all<EdgeInsets>(
                                EdgeInsets.all(15)),
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                    side: BorderSide(color: Colors.white)))),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const RegisterScreen()),
                        );
                      },)),

              Container(
                padding: const EdgeInsets.fromLTRB(50, 70, 50, 10),
                child: Row(
                  children: <Widget>[
                    const Text('Already have an account?',
                        style: TextStyle(color: Colors.white)),
                    TextButton(
                      child: const Text(
                        'Sign in',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      onPressed: () {
                        //signup screen
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const SignInScreen()),
                        );
                      },
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
              ),
            ])));
  }
}
