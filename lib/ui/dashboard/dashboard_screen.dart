import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:paw_record/model/DogsImageModel.dart';
import 'package:paw_record/model/HomeSliderModel.dart';
import 'package:paw_record/ui/addpet/addpet_screen.dart';
import 'package:paw_record/ui/petdetail/petdetail_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentIndex = 0;

  List<HomeSliderModel> sliderDataList = [
    HomeSliderModel("images/slider_one.png", "Take me home",
        "Lorem ipsum dolor sit amet,\nlorem ipsum dolor sit amet"),
    HomeSliderModel(
        "images/slider_one.png", "Take me home", "Lorem ipsum dolor sit amet"),
    HomeSliderModel("images/slider_one.png", "Take me home",
        "Lorem ipsum dolor sit amet"),
  ];

  List<DogsImageModel> dogsDataList = [
    DogsImageModel(
        "images/slider_two.png", "Troy", "Weekdays | 7:00", "Dog Walking"),
    DogsImageModel(
        "images/slider_three.png", "Penne", "Mondays | 19:00", "Dog Care"),
    DogsImageModel(
        "images/slider_two.png", "Troy", "Weekdays | 7:00", "Dog Walking"),
  ];

  final _searchview = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text("Home",
              style: TextStyle(
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
        body: SingleChildScrollView(
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
                    itemCount: sliderDataList.length,
                    options: CarouselOptions(
                        autoPlay: true,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _currentIndex = index;
                          });
                        }),
                    itemBuilder: (context, index, realIndex) {
                      return SliderImageView(sliderDataList[index]);
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: sliderDataList.map((url) {
                      int index = sliderDataList.indexOf(url);
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
                ListView.builder(
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: dogsDataList.length,
                  itemBuilder: (context, index) {
                    return DogsImageView(dogsDataList[index]);
                  },
                )
              ],
            )
          ],
        ))));
  }
}

Widget _createSearchView() {
  var _searchview;
  return new Container(
    margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
    child: new TextField(
      controller: _searchview,
      decoration: InputDecoration(
          hintText: "Send the sample",
          hintStyle: new TextStyle(color: Color(0xFF959496)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide: BorderSide.none),
          prefixIcon: Icon(Icons.search, color: Color(0xFF959496)),
          filled: true,
          fillColor: Color(0xFFD1D0D2)),
    ),
  );
}

class SliderImageView extends StatelessWidget {
  HomeSliderModel sliderData;

  SliderImageView(this.sliderData);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0, bottom: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        image: DecorationImage(
          image: AssetImage(sliderData.imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 10, top: 10),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    sliderData.title,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    sliderData.details,
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                        color: Colors.black),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('Let me'),
                    style: ElevatedButton.styleFrom(primary: Colors.black),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class DogsImageView extends StatelessWidget {
  DogsImageModel dogsData;

  DogsImageView(this.dogsData);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const PetDetailScreen()),
          );
        },
        child: Container(
          height: 200,
          width: double.infinity,
          margin:
              EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0, bottom: 10.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            image: DecorationImage(
              image: AssetImage(dogsData.imageUrl),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 15, top: 10),
                child: Column(
                  children: [
                    Expanded(
                        child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              dogsData.name,
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ))),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        dogsData.time,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            color: Colors.white),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Row(
                        children: [
                          Icon(
                            Icons.pets,
                            color: Color(0xFFFFFFFF),
                            size: 10,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            dogsData.actvty,
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
