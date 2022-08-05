import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:paw_record/ui/dashboard/dashboard_screen.dart';
import 'package:paw_record/ui/home/home_screen.dart';
import 'package:paw_record/ui/petsitter/petsitterdash/petsitter_dashboard.dart';
import 'package:paw_record/ui/petsitter/petsitterhome/petsitter_home.dart';
import 'package:paw_record/ui/splash/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          title: Text("Profile",
              style: TextStyle(
                color: Colors.black,
              )),
          brightness: Brightness.light,
          backgroundColor: const Color(0xFFFAFAFA),
          leading: IconButton(
              onPressed: () {
                SystemNavigator. pop();
              },
              icon: Icon(
                Icons.arrow_back_ios,
                size: 20,
                color: Colors.black,
              )),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.edit,
                color: Color(0xFF8017DA),
              ),
              onPressed: () {},
            )
          ],
        ),
        body: Container(
            child: SingleChildScrollView(
                child: Column(children: [
          Card(
            child: Column(
              children: [
                SizedBox(height: 25),
                Container(
                  width: double.infinity,
                  height: 150,
                  child: Container(
                    alignment: Alignment.center,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://picsum.photos/200/300?random=1"),
                      radius: 60.0,
                    ),
                  ),
                ),
                SizedBox(height: 25),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Rizwan Ahmed',
                    style: TextStyle(
                        decoration: TextDecoration.none,
                        color: Color(0xFF070707),
                        fontWeight: FontWeight.bold,
                        fontSize: 22),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Admin',
                    style: TextStyle(
                        decoration: TextDecoration.none,
                        color: Color(0xFF9A9999),
                        fontSize: 15),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 15),
          makeItemContainer("My pets", Icons.pets, context),
          SizedBox(
            height: 5,
          ),
          makeItemContainer(
              "Invite friends", Icons.speaker_phone_rounded, context),
          SizedBox(
            height: 5,
          ),
          makeItemContainer("Help", Icons.help_outline, context),
          SizedBox(
            height: 5,
          ),
          makeItemContainer("Settings", Icons.settings, context),
          SizedBox(
            height: 5,
          ),
          makeItemContainer("Logout", Icons.logout, context),
          SizedBox(
            height: 5,
          ),
        ]))));
  }
}

Widget makeItemContainer(
    String label, IconData iconData, BuildContext context) {
  return Container(
      height: 50,
      child: GestureDetector(
        onTap: () async {
          if (label == "Logout") {
            showAlertDialog(context);
          }else if(label == "My pets") {

            var prefs = await SharedPreferences.getInstance();
            var userType = prefs.getString("user_type");
            if(userType=="OWNER") {

              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()));

            }else{
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const PetSitterHomeScreen()));
            }



          }
        },
        child: Card(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                SizedBox(width: 10),
                Icon(
                  iconData,
                  color: Color(0xFF8017DA),
                ),
                SizedBox(width: 20),
                Text(
                  label,
                  style: TextStyle(
                      fontWeight: FontWeight.normal, color: Colors.black),
                ),
              ],
            ),
            Flexible(fit: FlexFit.tight, child: SizedBox()),
            Align(
              alignment: Alignment.centerRight,
              child: Icon(
                Icons.arrow_forward_ios_outlined,
                color: Color(0xFFA3A2A3),
                size: 10,
              ),
            ),
            SizedBox(width: 10),
          ],
        )),
      ));
}

showAlertDialog(BuildContext context) {
  // set up the buttons
  Widget cancelButton = TextButton(
    child: Text("Cancel"),
    onPressed: () {
      Navigator.pop(context, 'Cancel');
    },
  );
  Widget continueButton = TextButton(
    child: Text("Ok"),
    onPressed: () async {
      var prefs = await SharedPreferences.getInstance();
      var token = prefs.setString("token", "");

      Navigator.pop(context,true);
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const SplashScreen()));
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Alert"),
    content: Text("Are you sure want to logout?"),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
