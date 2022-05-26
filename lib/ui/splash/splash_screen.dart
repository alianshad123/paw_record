import 'dart:async';

import 'package:flutter/material.dart';
import 'package:paw_record/ui/login/login_screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) => LoginScreen()
            )
        )
    );
    //8017DA
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        color: const Color(0xFFFFFFFF),
        child: Image.asset(
            'images/paw_record.png',
            width: 200,
            height: 100,
        )
    );
  }
}