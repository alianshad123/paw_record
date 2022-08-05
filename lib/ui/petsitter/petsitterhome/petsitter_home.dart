import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:paw_record/ui/detailviews/detailview_screen.dart';
import 'package:paw_record/ui/petsitter/petsitterdash/petsitter_dashboard.dart';
import 'package:paw_record/ui/profile/profile_screen.dart';
import 'package:paw_record/ui/utils/Constants.dart';
import 'package:paw_record/ui/utils/DatabaseMethods.dart';
import 'package:paw_record/ui/utils/HelperFunctions.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PetSitterHomeScreen extends StatefulWidget {
  const PetSitterHomeScreen({Key? key}) : super(key: key);

  @override
  _PetSitterHomeScreenState createState() => _PetSitterHomeScreenState();
}

class _PetSitterHomeScreenState extends State<PetSitterHomeScreen> {

  int pageIndex = 0;

  final pages = [
    const PetsitterDashboardScreen(),

    const DetailViewScreen(),

    const ProfileScreen()
  ];

  DatabaseMethods databaseMethods=DatabaseMethods();

  @override
  void initState() {
    super.initState();
    getToken();
  }
  late String token;
  getToken() async {
    token = (await FirebaseMessaging.instance.getToken())!;
    var prefs = await SharedPreferences.getInstance();
    var sp_token = prefs.getString("FIREBASE_TOKEN");

    if(sp_token?.isEmpty==true||sp_token==null) {
      Map<String, dynamic> tokenMap = {
        "token": token,
        "user": Constants.userEmail
      };
      databaseMethods.addToken("tokenData", tokenMap);
      HelperFunctions.saveFirebaseToken(token);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Colors.white,

      body: pages[pageIndex],
      bottomNavigationBar: Container(
        height: 60,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  pageIndex = 0;
                });
              },
              icon: pageIndex == 0
                  ? const Icon(
                Icons.home_filled,
                color: Color(0xFF8017DA),
                size: 25,
              )
                  : const Icon(
                Icons.home_outlined,
                color: Color(0xFF656566),
                size: 25,
              ),
            ),
            IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  pageIndex = 1;
                });
              },
              icon: pageIndex == 1
                  ? const Icon(
                Icons.pets,
                color: Color(0xFF8017DA),

                size: 25,
              )
                  : const Icon(
                Icons.pets,
                color:Color(0xFF656566),
                size: 25,
              ),
            ),
            IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  pageIndex = 2;
                });
              },
              icon: pageIndex == 2
                  ? const Icon(
                Icons.person,
                color: Color(0xFF8017DA),
                size: 25,
              )
                  : const Icon(
                Icons.person_outline,
                color: Color(0xFF656566),
                size: 25,
              ),
            ),

          ],
        ),
      ),
    );

  }
}
