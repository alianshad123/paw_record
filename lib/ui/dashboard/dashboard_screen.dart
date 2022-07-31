import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/services.dart';
import 'package:flutter_logs/flutter_logs.dart';
import 'package:paw_record/api/ApiConstants.dart';
import 'package:paw_record/model/DogsActivityDataModel.dart';
import 'package:paw_record/model/DogsDataResponseModel.dart';
import 'package:paw_record/model/DogsImageModel.dart';
import 'package:paw_record/model/HomeSliderModel.dart';
import 'package:paw_record/ui/addpet/addpet_screen.dart';
import 'package:paw_record/ui/petdetail/petdetail_screen.dart';
import 'package:http/http.dart' as http;
import 'package:paw_record/ui/petdetail/petdetails_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../model/BannerDataModel.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late final List<Datum> sliderDataList;
  late Future<List<Datum>?> bannerList;
  late Future<List<DogsData>?> dogsList;

  @override
  void initState() {
    super.initState();
    dogsList= getDogsList(context);
    bannerList = getBanners(context);
  }

  int _currentIndex = 0;



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

                  FutureBuilder<List<Datum>?>(
                    future: bannerList,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {

                        return  createBanners(snapshot.data,_currentIndex);


                      } else if (snapshot.hasError) {
                        return Text('${snapshot.error}');
                      }

                      // By default, show a loading spinner.
                      return const CircularProgressIndicator();
                    },
                  ),

                 /* Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: bannerList.map((url) {
                      int index = bannerList.indexOf(url);
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
                  )*/
                ],
              ),
            ),
            SizedBox(height: 10),
            Column(
              children: [


                FutureBuilder<List<DogsData>?>(
                  future: dogsList,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {

                      return  createDogListView(snapshot.data);


                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    }

                    // By default, show a loading spinner.
                    return const CircularProgressIndicator();
                  },
                )
              ],
            )
          ],
        ))
        ));
  }
}

Widget createBanners(List<Datum>? bannerData, int currentIndex) =>CarouselSlider.builder(
  itemCount: bannerData?.length,
  options: CarouselOptions(
      autoPlay: true,
      onPageChanged: (index, reason) {
        currentIndex = index;
      }),
  itemBuilder: (context, index, realIndex) {
    return SliderImageView(bannerData![index]);
  }
  ); /*{

  CarouselSlider.builder(
    itemCount: sliderData.length,
    options: CarouselOptions(
        autoPlay: true,
        onPageChanged: (index, reason) {
          setState(() {
            _currentIndex = index;
          });
        }),
    itemBuilder: (context, index, realIndex) {
      return SliderImageView(sliderData[index]);
    },
  ),

}*/

Widget createDogListView(List<DogsData>? dogList)=>ListView.builder(
    shrinkWrap: true,
    physics: ScrollPhysics(),
    scrollDirection: Axis.vertical,
    itemCount: dogList?.length,
    itemBuilder: (context, index) {
      return DogsImageView(dogList![index]);
    }
);


Future<List<Datum>?> getBanners(BuildContext context) async {
  var prefs = await SharedPreferences.getInstance();
  var token = prefs.getString("token");

  var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.listBanner);
  var response = await http.get(url, headers: {
    "Accept": "application/json",
    "content-type": "application/json",
    "Authorization": "Bearer $token"
  });
  if (response.statusCode == 200) {
    FlutterLogs.logInfo("JsonDataResponse","PawJson", response.body);
    BannerDataModel _model = bannerDataModelFromJson(response.body);
    ApiConstants.IMAGEURL=_model.imgPath;
    return _model.data;
  } else {}
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
  Datum? sliderData;

  SliderImageView(this.sliderData);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0, bottom: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        image: DecorationImage(
          image: NetworkImage('${ApiConstants.IMAGEURL}${"/"}${sliderData?.image}'),
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
                    sliderData?.title?? "",
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
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
  DogsData dogsData;

  DogsImageView(this.dogsData);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  PetDetailsScreen(dogsData)),
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
              image:  NetworkImage('${ApiConstants.IMAGEURL}${"/"}${dogsData?.petPic}'),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15, top: 10),
                child: Column(
                  children: [
                    Expanded(
                        child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              dogsData.petName,
                              style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ))),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        dogsData.petNeutred,
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            color: Colors.white),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Row(
                        children: [
                          const Icon(
                            Icons.pets,
                            color: Color(0xFFFFFFFF),
                            size: 10,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            dogsData.petBreed,
                            style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
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

Future<List<DogsData>?> getDogsList(BuildContext context) async {
  var prefs = await SharedPreferences.getInstance();
  var token = prefs.getString("token");

  var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.listpets);
  var response = await http.get(url, headers: {
    "Accept": "application/json",
    "content-type": "application/json",
    "Authorization": "Bearer $token"

  });
  if (response.statusCode == 200) {
    FlutterLogs.logInfo("JsonDataResponse","PawJson", response.body);
    DogsDataResponseModel _model = dogsDataResponseModelFromJson(response.body);
    ApiConstants.IMAGEURL=_model.imgPath;
    return _model.data;
  } else {}
}
