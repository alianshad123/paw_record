import 'dart:convert';
import 'dart:io';

import 'package:carousel_slider/utils.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:paw_record/api/ApiConstants.dart';
import 'package:paw_record/model/RemainderDataModel.dart';
import 'package:paw_record/model/ToggleListData.dart';
import 'package:paw_record/ui/home/home_screen.dart';
import 'package:paw_record/ui/signin/signin_screen.dart';
import 'package:http/http.dart' as http;
import 'package:paw_record/ui/utils/ImageFromGalleryEx.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

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

  final _textFieldController = TextEditingController();
  final _dateFieldController = TextEditingController();

  final add = TextEditingController();
  final List<RemainderDataModel> remainderData = <RemainderDataModel>[];


  bool isSwitched1 = false;
  bool isSwitched2 = false;


  void addItemToList(){
    setState(() {
      remainderData.add(RemainderDataModel(_textFieldController.text, _dateFieldController.text));

    });
  }

  Future<void> _displayTextInputDialog(BuildContext context, DateFormat format) async {


    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add Remainder'),
          content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[

                TextField(
                  controller: _textFieldController,
                  decoration: InputDecoration(hintText: "Message"),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(0, 10, 40, 0),
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Date',

                    style: TextStyle(
                        decoration: TextDecoration.none,
                        color: Color(0xFF070707),
                        fontWeight: FontWeight.normal,
                        fontSize: 15),
                  ),
                ),
                DateTimeField(
                  format: format,
                  controller: _dateFieldController,
                  onShowPicker: (context, currentValue) {
                    return showDatePicker(
                        context: context,
                        firstDate: DateTime(1900),
                        initialDate: currentValue ?? DateTime.now(),
                        lastDate: DateTime(2100));
                  },
                ),
              ]),
          actions: <Widget>[
            FlatButton(
              child: Text('CANCEL'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            FlatButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.pop(context);

                //remainderList= getRemainders(context);
                addItemToList();

              },
            ),
          ],
        );
      },
    );
  }

  Future<List<RemainderDataModel>?> getRemainders(BuildContext context) async {

    List<RemainderDataModel> remainders = [];
    remainders.add(
      RemainderDataModel(
      _textFieldController.text,
      _dateFieldController.text
      ),
    );

    return remainders;

  }

  void toggleSwitch1(bool value) {
    if (isSwitched1 == false) {
      setState(() {
        isSwitched1 = true;
      });
    } else {
      setState(() {
        isSwitched1 = false;
      });
    }
  }



  bool _hasMalePressed = false;
  bool _hasFemalePressed = false;
  late Future<List<Data>?> togglesList;
   Future<List<RemainderDataModel>?>? remainderList;




  @override
  void initState() {
    super.initState();
    imagePicker = ImagePicker();
    togglesList= getToggels(context);

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
              SizedBox(height: 10,),
              GestureDetector(
                onTap: () async {
                  var source = type == ImageSourceType.camera
                      ? ImageSource.camera
                      : ImageSource.gallery;
                  XFile image = await imagePicker.pickImage(
                      source: source,
                      imageQuality: 50,
                      preferredCameraDevice: CameraDevice.front);
                  setState(() {
                    _image = File(image.path);
                  });
                },
                child: Container(
                  width: 150,
                  height: 150,
                  decoration: const BoxDecoration(
                      color: Color(0xFF9A9898),
                      borderRadius: BorderRadius.all(Radius.circular(100.0))),
                  child: _image != null
                      ? Image.file(
                          _image,
                          width: 150.0,
                          height: 150.0,
                          fit: BoxFit.fill,
                        )
                      : Container(
                          decoration: const BoxDecoration(
                              color: Color(0xFF9A9898),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(100.0))),
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
                        labelText: "Species of your pet",
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
                        labelText: "Breed",
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
                        labelText: "Size (Optional)",
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
                        labelText: "Address",
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
                            setState(() {
                              _hasMalePressed = !_hasMalePressed;

                              if (_hasMalePressed == true) {
                                _hasFemalePressed = false;
                              } else {
                                _hasFemalePressed = true;
                              }
                            });
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
                          textColor:
                              _hasMalePressed ? Colors.white : Colors.black,
                          color: _hasMalePressed
                              ? Color(0xFF8017DA)
                              : Colors.white,
                        ),
                        const SizedBox(width: 20),
                        RaisedButton(
                          elevation: 0.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0)),
                          padding: EdgeInsets.only(
                              top: 7.0, bottom: 7.0, right: 40.0, left: 7.0),
                          onPressed: () {
                            setState(() {
                              _hasFemalePressed = !_hasFemalePressed;
                              if (_hasFemalePressed == true) {
                                _hasMalePressed = false;
                              } else {
                                _hasMalePressed = true;
                              }
                            });
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Icon(Icons.female, color: Colors.white, size: 15),
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
                          textColor:
                              _hasFemalePressed ? Colors.white : Colors.black,
                          color: _hasFemalePressed
                              ? Color(0xFF8017DA)
                              : Colors.white,
                        ),
                      ],
                    ),

                    BasicDateField(),
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
                    FutureBuilder<List<Data>?>(
                      future: togglesList,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {

                          return  createToggleListView(snapshot.data);


                        } else if (snapshot.hasError) {
                          return Text('${snapshot.error}');
                        }

                        // By default, show a loading spinner.
                        return const CircularProgressIndicator();
                      },
                    ),
                   /* Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(0, 20, 10, 10),
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Neutred",
                            style: TextStyle(
                              decoration: TextDecoration.none,
                              color: Color(0xFF070707),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: Switch(
                            onChanged: toggleSwitch1,
                            value: isSwitched1,
                            activeColor: Colors.white,
                            activeTrackColor: Color(0xFF8017DA),
                            inactiveThumbColor: Colors.white,
                            inactiveTrackColor: Color(0xFF8017DA),
                          ),
                        )
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(0, 20, 10, 10),
                          alignment: Alignment.topLeft,
                          child: Text(
                            "vaccinated",
                            style: TextStyle(
                              decoration: TextDecoration.none,
                              color: Color(0xFF070707),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: Switch(
                            onChanged: toggleSwitch2,
                            value: isSwitched2,
                            activeColor: Colors.white,
                            activeTrackColor: Color(0xFF8017DA),
                            inactiveThumbColor: Colors.white,
                            inactiveTrackColor: Color(0xFF8017DA),
                          ),
                        )
                      ],
                    ),*/

                    /* makeAdditionalOptions(
                        label: "Neutered", isSWitch: isSwitched),
                    makeAdditionalOptions(
                        label: "Vaccinated", isSWitch: isSwitched),*/
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
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 20.0),
                      height: 200.0,
                      child: Row(
                        // This next line does the trick.

                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              final format = DateFormat("yyyy-MM-dd");

                              _displayTextInputDialog(context,format);
                            },
                            child: Container(
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
                                          'Add Remainder',
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
                          ),
                Expanded(
                child:ListView.builder(
                    key: UniqueKey(),
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: remainderData?.length,
                    itemBuilder: (context, index) {
                      return RemainderView(remainderData![index]);
                    }
                ),
                )
                        ],
                      ),
                    ),
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
                            registerPet(
                                petname_controller.text,
                                species_controller.text,
                                breed_controller.text,
                                size_controller.text,
                                address_controller.text,
                                "10-10-2000",
                                "male",
                                "Highly",
                                "Yes",
                                "Nothing",
                                _image.toString(),
                                context);

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




Widget createToggleListView(List<Data>? toggleList) =>ListView.builder(
    shrinkWrap: true,
    physics: ScrollPhysics(),
    scrollDirection: Axis.vertical,
    itemCount: toggleList?.length,
    itemBuilder: (context, index) {
      return SwitchView(toggleList![index]);   //makeAdditionalOptions(context,toggleList![index].togName,false);
    }
);



Future<List<Data>?> getToggels(BuildContext context) async {
  var prefs = await SharedPreferences.getInstance();
  var token = prefs.getString("token");

  var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.listToggles);
  var response = await http.get(url, headers: {
    "Accept": "application/json",
    "content-type": "application/json",
    "Authorization": "Bearer $token"
  });
  if (response.statusCode == 200) {
    ToggleListData _model = toggleListDataFromJson(response.body);
    return _model.data;
  } else {}
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

Widget makeAdditionalOptions(BuildContext context,String? label, bool isSwitch) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Container(
        padding: EdgeInsets.fromLTRB(0, 20, 10, 10),
        alignment: Alignment.topLeft,
        child: Text(
          label!,
          style: TextStyle(
            decoration: TextDecoration.none,
            color: Color(0xFF070707),
          ),
        ),
      ),
      Align(
        alignment: Alignment.topRight,
        child: Switch(
          value: isSwitch,
          activeColor: Colors.white,
          activeTrackColor: Color(0xFF8017DA),
          inactiveThumbColor: Colors.white,
          inactiveTrackColor: Color(0xFF8017DA), onChanged: (bool value) {

        },
        ),
      )
    ],
  );
}

registerPet(String petname, String species, String breed, String size,
    String address, String dob,String gender,String neautred,String vaccinated,String remainder, String image, BuildContext context) async {
  var prefs = await SharedPreferences.getInstance();
  var token = prefs.getString("token");
  var data = jsonEncode({
    'name': petname,
    'species': species,
    'breed': breed,
    'size': size,
    'address': address,
    'dob': dob,
    'gender': gender,
    'neutred': neautred,
    'vaccinated': vaccinated,
    'reminder': remainder,
    'img': image
  });

  var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.register_pet);
  var response = await http.post(url, body: data, headers: {
    "Accept": "application/json",
    "content-type": "application/json",
    "Authorization": "Bearer $token"
  });
  if (response.statusCode == 200) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Info'),
        content: const Text('Pet Details addedd Successfully'),
        actions: <Widget>[

          TextButton(
            onPressed: () =>  Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const HomeScreen()),
    ),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  } else {


    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Info'),
        content: const Text('Pet Details addedd Successfully'),
        actions: <Widget>[

          TextButton(
            onPressed: () =>  Navigator.pop(context, 'OK'),
            child: const Text('OK'),
          ),
        ],
      ),
    );

  }
}

class SwitchView extends StatelessWidget {
  Data toggleData;

  SwitchView(this.toggleData);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(0, 20, 10, 10),
          alignment: Alignment.topLeft,
          child: Text(
            toggleData.togName.toString(),
            style: TextStyle(
              decoration: TextDecoration.none,
              color: Color(0xFF070707),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Switch(
            value: isSwitch,
            activeColor: Colors.white,
            activeTrackColor: Color(0xFF8017DA),
            inactiveThumbColor: Colors.white,
            inactiveTrackColor: Color(0xFF8017DA), onChanged: (bool value) {

          },
          ),
        )
      ],
    );
  }
}

class RemainderView extends StatelessWidget {
  RemainderDataModel remainder;

  RemainderView(this.remainder);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
                  remainder.message,
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
                  remainder.date_,
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
}

class BasicDateField extends StatelessWidget {
  final format = DateFormat("yyyy-MM-dd");

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Container(
        padding: EdgeInsets.fromLTRB(0, 10, 40, 0),
        alignment: Alignment.topLeft,
        child: Text(
          'DOB',

          style: TextStyle(
              decoration: TextDecoration.none,
              color: Color(0xFF070707),
              fontWeight: FontWeight.normal,
              fontSize: 15),
        ),
      ),
      DateTimeField(
        format: format,
        onShowPicker: (context, currentValue) {
          return showDatePicker(
              context: context,
              firstDate: DateTime(1900),
              initialDate: currentValue ?? DateTime.now(),
              lastDate: DateTime(2100));
        },
      ),
    ]);
  }
}






