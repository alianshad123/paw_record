import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:paw_record/ui/addpet/addpet_screen.dart';
import 'package:paw_record/ui/petdetail/petdetail_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {



  final _searchview =  TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text("Home", style: TextStyle(
            color: Colors.black,
          )),
          brightness: Brightness.light,
          backgroundColor: const Color(0xFFF9F8FA),
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
                Icons.add,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AddPetScreen()),
                );
              },
            )
          ],
        ),
        resizeToAvoidBottomInset: false, // set i
        body:  SingleChildScrollView(
            child: Container(
            child: Column(
          children: [
            SizedBox(height: 10),
            _createSearchView(),
            SizedBox(height: 10),
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
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(color: Colors.amber),
                        child: Image.asset(
                          'images/ic_dog.png',
                          width: 200,
                          height: 100,
                        ));
                  },
                );
              }).toList(),
            ),
            SizedBox(height: 10),
            Column(
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const PetDetailScreen()),
                    );
                  },
                  child:
                  Container(
                    child: Card(
                        child:
                        Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.fromLTRB(15,5,15,5),
                            decoration: BoxDecoration(color: Colors.purpleAccent,
                                borderRadius: BorderRadius.circular(10.0)),
                            child: Image.asset(
                              'images/ic_dog.png',
                              width: double.infinity,
                              height: 180,
                            )
                        )
                    )

                ),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const PetDetailScreen()),
                    );
                  },
                  child:
                  Container(
                      child: Card(
                          child:
                          Container(
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.fromLTRB(15,5,15,5),
                              decoration: BoxDecoration(color: Colors.purpleAccent,
                                  borderRadius: BorderRadius.circular(10.0)),
                              child: Image.asset(
                                'images/ic_dog.png',
                                width: double.infinity,
                                height: 180,
                              )
                          )
                      )

                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const PetDetailScreen()),
                    );
                  },
                  child:
                  Container(
                      child: Card(
                          child:
                          Container(
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.fromLTRB(15,5,15,5),
                              decoration: BoxDecoration(color: Colors.purpleAccent,
                                  borderRadius: BorderRadius.circular(10.0)),
                              child: Image.asset(
                                'images/ic_dog.png',
                                width: double.infinity,
                                height: 180,
                              )
                          )
                      )

                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const PetDetailScreen()),
                    );
                  },
                  child:
                  Container(
                      child: Card(
                          child:
                          Container(
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.fromLTRB(15,5,15,5),
                              decoration: BoxDecoration(color: Colors.purpleAccent,
                                  borderRadius: BorderRadius.circular(10.0)),
                              child: Image.asset(
                                'images/ic_dog.png',
                                width: double.infinity,
                                height: 180,
                              )
                          )
                      )

                  ),
                )
              ],
            )

          ],
        )))
    );
  }
}

Widget _createSearchView() {
  var _searchview;
  return new Container(
    margin: EdgeInsets.fromLTRB(20, 5, 20, 0),
    decoration: BoxDecoration(border: Border.all(width: 1.0),
    borderRadius: BorderRadius.circular(20.0)),
    child: new TextField(
      controller: _searchview,
      decoration: InputDecoration(
        hintText: "Search",
        hintStyle: new TextStyle(color: Colors.grey[300]),
      ),
      textAlign: TextAlign.center,
    ),
  );
}
