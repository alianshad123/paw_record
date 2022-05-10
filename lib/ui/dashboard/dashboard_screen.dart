
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:paw_record/ui/addpet/addpet_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(

        child: Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.fromLTRB(10, 60, 0, 0),
              child: Text('Welcome to',
                style: TextStyle(
                    decoration: TextDecoration.none,
                    color: Color(0xFF070707),
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: Text('Paw Record',
                style: TextStyle(
                    decoration: TextDecoration.none,
                    color: Color(0xFF8017DA),
                    fontWeight: FontWeight.bold,
                    fontSize: 40),
              ),
            ),
            SizedBox(height: 15),
            CarouselSlider(
              options: CarouselOptions(
                height: 150.0,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                enlargeCenterPage: true,
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                scrollDirection: Axis.horizontal,
              ),
              items: [1, 2, 3, 4, 5].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                            color: Colors.amber
                        ),
                        child: Image.asset(
                          'images/ic_dog.png',
                          width: 200,
                          height: 100,
                        )
                    );
                  },
                );
              }).toList(),
            ),
            SizedBox(height: 25),
            Row(

                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 200,
                    width: 150,
                    child: GestureDetector(
                      onTap: () {

                      },
                    child: Card(

                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Card(
                              margin: EdgeInsets.all(5),
                              child: Icon(
                              Icons.person,
                              color: Color(0xFF8017DA),
                              size: 35,
                            )
                          ),
                          Text("Riswan"),


                        ],


                      ),
                      elevation: 8,
                      shadowColor: Colors.green,
                      margin: EdgeInsets.all(20),

                    ),
                    )
                  ),
                  Container(
                    height: 200,
                    width: 150,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const AddPetScreen()),
                          );
                        },
                    child: Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Card(
                              margin: EdgeInsets.all(5),
                              child: Icon(
                                Icons.add_circle,
                                color: Color(0xFF8017DA),
                                size: 35,
                              )
                          ),

                          Text("Add"),


                        ],
                      ),
                      elevation: 8,
                      shadowColor: Colors.green,
                      margin: EdgeInsets.all(20),
                    ),
                      )
                  ),
                ]
            ),
            SizedBox(height: 50),

            TextButton(
              child: const Text(
                'Ok',
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
                /*Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                );*/
              },
            )

          ]
          ,
        )
    );
  }
}