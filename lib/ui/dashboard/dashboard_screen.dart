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

  int _currentIndex = 0;
  List<String> listPaths = [
    "images/slider_one.jpg",
    "images/slider_two.jpg",
    "images/slider_three.jpg",
  ];

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
            Container(
              margin:
              const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              child: Column(
                children: [
                  CarouselSlider.builder(
                    itemCount: listPaths.length,
                    options: CarouselOptions(
                        autoPlay: true,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _currentIndex = index;
                          });
                        }),
                    itemBuilder: (context, index, realIndex) {
                      return MyImageView(listPaths[index]);
                    },
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: listPaths.map((url) {
                      int index = listPaths.indexOf(url);
                      return Container(
                        width: 8.0,
                        height: 8.0,
                        margin: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 2.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _currentIndex == index
                              ? const Color.fromRGBO(0, 0, 0, 0.9)
                              : const Color.fromRGBO(0, 0, 0, 0.4),
                        ),
                      );
                    }).toList(),
                  )
                ],
              ),
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
    margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
    /*decoration: BoxDecoration(border: Border.all(width: 1.0),
    borderRadius: BorderRadius.circular(20.0)),*/
    child: new TextField(
      controller: _searchview,
      decoration: InputDecoration(
        hintText: "Send the sample",
        hintStyle: new TextStyle(color: Color(0xFF959496)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: BorderSide.none
        ),
        prefixIcon: Icon(Icons.search,color: Color(0xFF959496)),
        filled: true,
        fillColor: Color(0xFFD1D0D2)
      ),


    ),
  );
}

class MyImageView extends StatelessWidget {
  String imgPath;

  MyImageView(this.imgPath);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(left: 5.0, top: 10.0, right: 5.0, bottom: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        image: DecorationImage(
          image: AssetImage(imgPath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
