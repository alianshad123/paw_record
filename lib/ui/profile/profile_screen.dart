import 'package:flutter/material.dart';

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
                Navigator.pop(context);
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
        body: Container(child: SingleChildScrollView(child: Column(
            children: [
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
                          backgroundImage:
                          NetworkImage("https://picsum.photos/200/300?random=1"),
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

              makeItemContainer( "My pets",Icons.pets),
              SizedBox(height: 5,),
              makeItemContainer( "My favourites",Icons.favorite_border),
              SizedBox(height: 5,),
              makeItemContainer( "Add pet service",Icons.medical_services_outlined),
              SizedBox(height: 5,),
              makeItemContainer( "Invite friends",Icons.speaker_phone_rounded),
              SizedBox(height: 5,),
              makeItemContainer( "Help",Icons.help_outline),
              SizedBox(height: 5,),
              makeItemContainer( "Settings",Icons.settings),
              SizedBox(height: 5,),


            ]


        ))));
  }
}

Widget makeItemContainer(String label, IconData iconData) {
  return Container(
    height: 50,
    child: Card(
        child:  Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                SizedBox(width : 10),
                Icon(
                  iconData,
                  color: Color(0xFF8017DA),
                ),
                SizedBox(width : 20),
                Text(label,style: TextStyle (

                    fontWeight: FontWeight.normal,
                    color: Colors.black
                ),),
              ],
            ),
            Flexible(fit: FlexFit.tight, child: SizedBox()),
            Align(
              alignment: Alignment.centerRight,
              child:Icon(Icons.arrow_forward_ios_outlined,
                color:Color(0xFFA3A2A3),
                size: 10,) ,
            ),
            SizedBox(width : 10),

          ],
        )
    ),
  );
}
