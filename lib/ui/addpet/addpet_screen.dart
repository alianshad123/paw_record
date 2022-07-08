import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:paw_record/api/ApiConstants.dart';
import 'package:paw_record/ui/home/home_screen.dart';
import 'package:paw_record/ui/signin/signin_screen.dart';
import 'package:image_picker/image_picker.dart';
import 'package:paw_record/ui/utils/ImageFromGalleryEx.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

enum ImageSourceType { gallery, camera }
class AddPetScreen extends StatefulWidget {
  const AddPetScreen({Key? key}) : super(key: key);

  @override
  _AddPetScreenState createState() => _AddPetScreenState();
}

class _AddPetScreenState extends State<AddPetScreen> {
  bool isSwitched = false;

  var _image;
  var imagePicker;
  var type;

  final petname_controller = TextEditingController();
  final species_controller = TextEditingController();
  final breed_controller = TextEditingController();
  final size_controller = TextEditingController();
  final address_controller = TextEditingController();
  final dob_controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    imagePicker = ImagePicker();
  }

  void _handleURLButtonPress(BuildContext context, var type) {
   // Navigator.push(context,
       // MaterialPageRoute(builder: (context) => ImageFromGalleryEx(type)));

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false, // set it to false
        appBar: AppBar(
          elevation: 0,
          title: Text("Add Pet Detail"),
          brightness: Brightness.light,
          backgroundColor: const Color(0xFF8017DA),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                size: 20,
                color: Colors.white,
              )),
        ),
        body: Container(
            child: SingleChildScrollView(
          child: Column(
            children: [
              GestureDetector(
                onTap: () async {
                  var source = type == ImageSourceType.camera
                      ? ImageSource.camera
                      : ImageSource.gallery;
                  XFile image = await imagePicker.pickImage(
                      source: source, imageQuality: 50, preferredCameraDevice: CameraDevice.front);
                  setState(() {
                    _image = File(image.path);
                  });
                },
                  child: Container(
                    width: 150,
                    height: 150,
                    decoration: const BoxDecoration(
                        color: Colors.lightGreen,
                        borderRadius: BorderRadius.all(
                            Radius.circular(60.0)
                        )
                    ),
                    child: _image != null
                        ? Image.file(
                      _image,
                      width: 150.0,
                      height: 150.0,
                      fit: BoxFit.fitHeight,
                    )
                        : Container(
                      decoration: const BoxDecoration(
                          color: Colors.lightGreen,
                          borderRadius: BorderRadius.all(
                          Radius.circular(60.0)
                          )
                      ),
                      width: 150,
                      height: 150,
                      child: Icon(
                        Icons.camera_alt,
                        color: Colors.grey[800],
                      ),
                    ),
                  ),
              ),
              SizedBox(height: 25),
              Container(
                padding: EdgeInsets.fromLTRB(40, 10, 40, 0),
                alignment: Alignment.topLeft,
                child: Text(
                  'General',
                  style: TextStyle(
                      decoration: TextDecoration.none,
                      color: Color(0xFF070707),
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(40, 10, 40, 0),
                alignment: Alignment.topLeft,
                child: Text(
                  'Information',
                  style: TextStyle(
                      decoration: TextDecoration.none,
                      color: Color(0xFF070707),
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              ),
              Container(
                  padding: EdgeInsets.fromLTRB(40, 10, 40, 0),
                  child: Column(children: [
                    TextFormField(
                      keyboardType: TextInputType.name,
                      controller: petname_controller,
                      decoration: InputDecoration(
                        labelText: "Pet's Name",
                        labelStyle: TextStyle(
                          color: Color(0xFF999696),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xCEE8E8E8)),
                        ),
                      ),
                    ),

                    TextFormField(
                      keyboardType: TextInputType.name,
                      controller: species_controller,
                      decoration: InputDecoration(
                        labelText:  "Species of your pet",
                        labelStyle: TextStyle(
                          color: Color(0xFF999696),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xCEE8E8E8)),
                        ),
                      ),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.name,
                      controller: breed_controller,
                      decoration: InputDecoration(
                        labelText:  "Breed",
                        labelStyle: TextStyle(
                          color: Color(0xFF999696),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xCEE8E8E8)),
                        ),
                      ),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.name,
                      controller: size_controller,
                      decoration: InputDecoration(
                        labelText:  "Size (Optional)",
                        labelStyle: TextStyle(
                          color: Color(0xFF999696),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xCEE8E8E8)),
                        ),
                      ),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.name,
                      controller: address_controller,
                      decoration: InputDecoration(
                        labelText:  "Address",
                        labelStyle: TextStyle(
                          color: Color(0xFF999696),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xCEE8E8E8)),
                        ),
                      ),
                    ),


                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 10, 40, 0),
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Gender',
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          color: Color(0xFF999696),
                        ),
                      ),
                    ),
                    Row(
                      //mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RaisedButton(
                            elevation: 0.0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0)),
                            padding: EdgeInsets.only(
                                top: 7.0, bottom: 7.0, right: 40.0, left: 7.0),
                            onPressed: () {
                              //Navigator.of(context).pushReplacementNamed();
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Icon(Icons.male, color: Colors.white, size: 15),
                                Padding(
                                    padding: EdgeInsets.only(left: 10.0),
                                    child: Text(
                                      "Male",
                                      style: TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold),
                                    ))
                              ],
                            ),
                            textColor: Colors.white,
                            color: Color(0xFF8017DA)),
                        const SizedBox(width: 20),
                        RaisedButton(
                            elevation: 0.0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0)),
                            padding: EdgeInsets.only(
                                top: 7.0, bottom: 7.0, right: 40.0, left: 7.0),
                            onPressed: () {
                              //Navigator.of(context).pushReplacementNamed();
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Icon(Icons.female,
                                    color: Color(0xFF8017DA), size: 15),
                                Padding(
                                    padding: EdgeInsets.only(left: 10.0),
                                    child: Text(
                                      "Female",
                                      style: TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold),
                                    ))
                              ],
                            ),
                            textColor: Colors.black,
                            color: Colors.white),
                      ],
                    ),
                    TextFormField(
                      keyboardType: TextInputType.name,
                      controller: dob_controller,
                      decoration: InputDecoration(
                        labelText:  "Date of birth",
                        labelStyle: TextStyle(
                          color: Color(0xFF999696),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xCEE8E8E8)),
                        ),
                      ),
                    ),
                    SizedBox(height: 25),
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 10, 40, 0),
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Additional Information',
                        style: TextStyle(
                            decoration: TextDecoration.none,
                            color: Color(0xFF070707),
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ),
                    makeAdditionalOptions(
                        label: "Neutered", isSWitch: isSwitched),
                    makeAdditionalOptions(
                        label: "Vaccinated", isSWitch: isSwitched),
                    /*makeAdditionalOptions(
                        label: "Friendly with dogs", isSWitch: isSwitched),
                    makeAdditionalOptions(
                        label: "Friendly with cats", isSWitch: isSwitched),
                    makeAdditionalOptions(
                        label: "Medical Info", isSWitch: isSwitched),
                    makeAdditionalOptions(
                        label: "Vaccine info", isSWitch: isSwitched),
                    makeAdditionalOptions(
                        label: "Doctor info", isSWitch: isSwitched),
                    makeAdditionalOptions(label: "Food", isSWitch: isSwitched),*/
                    SizedBox(height: 25),
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 10, 40, 0),
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Reminders',
                        style: TextStyle(
                            decoration: TextDecoration.none,
                            color: Color(0xFF070707),
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 10, 40, 0),
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Add vaccines,haircuts,pills,estrus, etc. and you will receive   notifications for the next event..',
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          color: Color(0xFF999696),
                        ),
                      ),
                    ),
                   /* Container(
                      margin: const EdgeInsets.symmetric(vertical: 20.0),
                      height: 200.0,
                      child: ListView(
                        // This next line does the trick.
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        children: <Widget>[
                          Container(
                            child: Card(
                                margin: const EdgeInsets.all(10.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                        child: Icon(
                                      Icons.add_circle_rounded,
                                      color: Color(0xFF8017DA),
                                      size: 35,
                                    )),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      margin: EdgeInsets.fromLTRB(
                                          5.0, 0.0, 5.0, 0.0),
                                      child: Text(
                                        'Measles Vaccine',
                                        style: TextStyle(
                                          decoration: TextDecoration.none,
                                          color: Color(0xFF000000),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                  ],
                                )),
                          ),
                          *//*makeReminderView(),
                          makeReminderView(),
                          makeReminderView(),
                          makeReminderView(),
                          makeReminderView()*//*
                        ],
                      ),
                    ),*/
                    SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          child: const Text(
                            'Add',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                          style: ButtonStyle(
                              padding: MaterialStateProperty.all<EdgeInsets>(
                                  EdgeInsets.fromLTRB(50, 10, 50, 10)),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Color(0xFF8017DA)),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                      side: BorderSide(
                                          color: const Color(0xFF8017DA))))),
                          onPressed: () {

                            registerPet(petname_controller.text,species_controller.text,
                                breed_controller.text, size_controller.text,address_controller.text,
                                dob_controller.text,_image.toString(), context);

                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) => const SignInScreen()),
                            // );
                          },
                        )),
                    SizedBox(height: 10)
                  ]))
            ],
          ),
        )));
  }
}

Widget makeInput({label, obsureText = false}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      TextFormField(
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(
            color: Color(0xFF999696),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xCEE8E8E8)),
          ),
        ),
      ),
    ],
  );
}

Widget makeAdditionalOptions({label, isSWitch}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Container(
        padding: EdgeInsets.fromLTRB(0, 20, 10, 10),
        alignment: Alignment.topLeft,
        child: Text(
          label,
          style: TextStyle(
            decoration: TextDecoration.none,
            color: Color(0xFF070707),
          ),
        ),
      ),
      Align(
        alignment: Alignment.topRight,
        child: Switch(
          onChanged: toggleSwitch,
          value: isSWitch,
          activeColor: Colors.white,
          activeTrackColor: Color(0xFF8017DA),
          inactiveThumbColor: Colors.white,
          inactiveTrackColor: Color(0xFF8017DA),
        ),
      )
    ],
  );
}

registerPet(String petname,String species, String breed,String size,String address,String dob,String image, BuildContext context) async {
  var prefs = await SharedPreferences.getInstance();
  var token =prefs.getString("token");
  var data = jsonEncode({'name': petname,'species': species, 'breed': breed,'size': size,'address': address, 'dob': dob,'img':image});

  var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.register_pet);
  var response = await http.post(url, body: data, headers: {
    "Accept": "application/json",
    "content-type": "application/json",
    "Authorization": "Bearer $token"
  });
  if (response.statusCode == 200) {

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const HomeScreen()),
    );
  }else{
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const HomeScreen()),
    );
  }
}

void toggleSwitch(bool value) {
  if (value == false) {
    value = true;
  } else {
    value = false;
  }
}

Widget makeReminderView() {
  return Container(
    child: Card(
        margin: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                child: Image.asset(
              'images/ic_syringe.png',
              width: 35,
              height: 35,
              color: Color(0xFF8017DA),
            )),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
              child: Text(
                'Measles Vaccine',
                style: TextStyle(
                  decoration: TextDecoration.none,
                  color: Color(0xFF000000),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              child: Text(
                '30.08.2022',
                style: TextStyle(
                  decoration: TextDecoration.none,
                  color: Color(0xFF999696),
                ),
              ),
            )
          ],
        )),
  );
}
