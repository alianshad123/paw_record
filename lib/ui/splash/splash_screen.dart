import 'dart:async';

import 'package:flutter/material.dart';
import 'package:paw_record/ui/dashboard/dashboard_screen.dart';
import 'package:paw_record/ui/home/home_screen.dart';
import 'package:paw_record/ui/login/login_screen.dart';
import 'package:paw_record/ui/petsitter/petsitterhome/petsitter_home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  initState()  {
    super.initState();

    retriveToken(context);

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
        ));
  }
}

retriveToken(BuildContext context) async {
  var prefs = await SharedPreferences.getInstance();
  var token = prefs.getString("token");
  var type = prefs.getString("type");
  

  if (token==null || token=="") {
    Timer(
        const Duration(seconds: 5),
            () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const LoginScreen())));
  } else {
    if(type=="OWNER") {

      Timer(
          const Duration(seconds: 5),
              () =>
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen())));

    }else{

      Timer(
          const Duration(seconds: 5),
              () =>
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const PetSitterHomeScreen())));

    }
  }
}
