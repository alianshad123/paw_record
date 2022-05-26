import 'package:flutter/material.dart';
import 'package:paw_record/ui/detailviews/detailview_screen.dart';

class PetDetailScreen extends StatefulWidget {
  const PetDetailScreen({Key? key}) : super(key: key);

  @override
  _PetDetailScreenState createState() => _PetDetailScreenState();
}

class _PetDetailScreenState extends State<PetDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text("",
            style: TextStyle(
              color: Colors.black,
            )),
        brightness: Brightness.light,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              size: 20,
              color: Colors.white,
            )),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.share_outlined,
              color: Colors.white,
            ),
            onPressed: () {},
          )
        ],
      ),
        extendBodyBehindAppBar: true,
      body: Container(
          child:  SingleChildScrollView(
            child:    Column(
              children: [
               /* Container(
                  margin: EdgeInsets.only(bottom: 40),
                  height: 260,
                  // This is needed
                  child: Image.asset(
                    'images/detail_image.png',
                    fit: BoxFit.contain,
                    width: double.infinity,
                  ),
                ),*/

                Stack(
                  children: [
                    Container(
                      height: 420,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("images/detail_image.png"),
                              fit: BoxFit.fill
                          )
                      ),
                    ),


                  ],
                ),





                Container(
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Troy',
                          style: TextStyle(
                              decoration: TextDecoration.none,
                              color: Color(0xFF070707),
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('AGE',
                                    style: TextStyle(color: Color(0xFF999696))),
                                Text('4 months',
                                    style: TextStyle(color: Color(0xFF090909)))
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('SIZE',
                                    style: TextStyle(color: Color(0xFF999696))),
                                Text('small',
                                    style: TextStyle(color: Color(0xFF0A0A0A)))
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('SEX',
                                    style: TextStyle(color: Color(0xFF999696))),
                                Text('Female',
                                    style: TextStyle(color: Color(0xFF090909)))
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text('LOCATION',
                                  style: TextStyle(color: Color(0xFF999696))),
                            ),
                            Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                    'Vasanth Nagar, Bengaluru, Karnataka 560052',
                                    style: TextStyle(color: Color(0xFF090909))))
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child:  Text('SERVICE TYPE',
                                  style: TextStyle(color: Color(0xFF999696))),
                            ),
                            Align(
                                alignment: Alignment.topLeft,
                                child: Text('Dog Walking',
                                    style: TextStyle(color: Color(0xFF090909)))
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text('DETAILS',
                                  style: TextStyle(color: Color(0xFF999696))),
                            ),
                            Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                    'Troy is lovely and and well trained dog.She loves to pull a litle bit when she sees other dogs',
                                    style: TextStyle(color: Color(0xFF090909)))
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15,),
                TextButton(

                  child: const Text(
                    '+ Create list',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.fromLTRB(50,10,50,10)),
                      backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF8017DA)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              side: BorderSide(color: const Color(0xFF8017DA))
                          )
                      )
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DetailViewScreen()),
                    );
                  },
                ),
                SizedBox(height: 15,)
              ],
            ),

          )
      )


    );
  }
}
