import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:paw_record/ui/dashboard/dashboard_screen.dart';
import 'package:paw_record/ui/petdetail/petdetail_screen.dart';
import 'package:paw_record/ui/petsitter/petsitterhome/petsitter_home.dart';
import 'package:paw_record/ui/register/register_screen.dart';
import 'package:paw_record/ui/utils/StarRating.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../home/home_screen.dart';

class DetailViewScreen extends StatefulWidget {
  const DetailViewScreen({Key? key}) : super(key: key);

  @override
  _DetailViewScreenState createState() => _DetailViewScreenState();
}

class _DetailViewScreenState extends State<DetailViewScreen> {
  var rating = 3.5;

  @override
  void initState() {
    super.initState();
  }

  bool visibilityVaccine = true;
  bool visibilityDoctor = false;
  bool visibilityMedical = false;
  bool visibilityGrooming = false;
  bool isChecklistShowing = false;
  bool isCheckBtnShowing = true;
  bool valuefirst = false;
  bool valueSecond = false;
  bool valueThird = false;
  bool valueForth = false;
  bool valueFifth = false;
  bool valueSixth = false;
  bool valueSeventh = false;
  bool valueEighth = false;
  bool valueNineth = false;
  bool valueTenth = false;

  bool isVaccinePressed = true;
  bool isMedicalPressed = false;
  bool isDoctorPressed = false;
  bool isGroomingPressed = false;

  void showVaccine() {
    setState(() {
      visibilityVaccine = true;
      visibilityMedical = false;
      visibilityDoctor = false;
      visibilityGrooming = false;
      isVaccinePressed = true;
      isMedicalPressed = false;
      isDoctorPressed = false;
      isGroomingPressed = false;
    });
  }

  void showMedical() {
    setState(() {
      visibilityVaccine = false;
      visibilityMedical = true;
      visibilityDoctor = false;
      visibilityGrooming = false;
      isVaccinePressed = false;
      isMedicalPressed = true;
      isDoctorPressed = false;
      isGroomingPressed = false;
    });
  }

  void showGrooming() {
    setState(() {
      visibilityVaccine = false;
      visibilityMedical = false;
      visibilityDoctor = false;
      visibilityGrooming = true;

      isVaccinePressed = false;
      isMedicalPressed = false;
      isDoctorPressed = false;
      isGroomingPressed = true;
    });
  }

  void showDoctor() {
    setState(() {
      visibilityVaccine = false;
      visibilityMedical = false;
      visibilityDoctor = true;
      visibilityGrooming = false;

      isVaccinePressed = false;
      isMedicalPressed = false;
      isDoctorPressed = true;
      isGroomingPressed = false;
    });
  }

  void showCheckList() {
    setState(() {
      isChecklistShowing = true;
      isCheckBtnShowing = false;
    });
  }

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
              onPressed: () async {
                var prefs = await SharedPreferences.getInstance();
                var userType = prefs.getString("user_type");
                if (userType == "OWNER") {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                  );
                } else {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PetSitterHomeScreen()),
                  );
                }
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
            child: SingleChildScrollView(
                child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 250,
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.1),
                      image: DecorationImage(
                          image: AssetImage("images/blur_img.png"),
                          fit: BoxFit.fill)),
                ),
                Container(
                    margin: EdgeInsets.only(
                        top: 70, left: 10, right: 10, bottom: 10),
                    width: double.infinity,
                    padding: EdgeInsets.all(5),
                    child: Row(
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          child: Container(
                            alignment: Alignment.centerLeft,
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(
                                  "https://picsum.photos/200/300?random=1"),
                              radius: 50.0,
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Dog`s Life',
                              style: TextStyle(
                                  decoration: TextDecoration.none,
                                  color: Color(0xFFF5F4F4),
                                  fontWeight: FontWeight.normal,
                                  fontSize: 25),
                            ),
                            Text(
                              ' Dogs knowledge sharing,irregularly \n organised offline exchnages and \n group buying',
                              style: TextStyle(
                                  decoration: TextDecoration.none,
                                  color: Color(0xFFF5F4F4),
                                  fontWeight: FontWeight.normal,
                                  fontSize: 12),
                            )
                          ],
                        ),
                      ],
                    ))
              ],
            ),
            Container(
              color: Colors.white,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Column(
                      children: [
                        Container(
                          //  margin: const EdgeInsets.symmetric(vertical: 20.0),
                          margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                          height: 50.0,
                          alignment: Alignment.topLeft,
                          child: ListView(
                            // This next line does the trick.
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,

                            children: <Widget>[
                              GestureDetector(
                                  onTap: () {
                                    showVaccine();
                                  },
                                  child: Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Text("Vaccine",
                                          style: isVaccinePressed
                                              ? TextStyle(
                                                  color: Color(0xFF8017DA),
                                                  fontSize: 18,
                                                )
                                              : TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 18,
                                                )))),
                              GestureDetector(
                                  onTap: () {
                                    showMedical();
                                  },
                                  child: Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Text("Medical",
                                          style: isMedicalPressed
                                              ? TextStyle(
                                                  color: Color(0xFF8017DA),
                                                  fontSize: 18,
                                                )
                                              : TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 18,
                                                )))),
                              GestureDetector(
                                  onTap: () {
                                    showDoctor();
                                  },
                                  child: Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Text("Doctor",
                                          style: isDoctorPressed
                                              ? TextStyle(
                                                  color: Color(0xFF8017DA),
                                                  fontSize: 18,
                                                )
                                              : TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 18,
                                                )))),
                              GestureDetector(
                                  onTap: () {
                                    showGrooming();
                                  },
                                  child: Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Text("Grooming",
                                          style: isGroomingPressed
                                              ? TextStyle(
                                                  color: Color(0xFF8017DA),
                                                  fontSize: 18,
                                                )
                                              : TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 18,
                                                )))),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Stack(
                    children: [
                      Visibility(
                          maintainSize: false,
                          maintainAnimation: true,
                          maintainState: true,
                          visible: visibilityVaccine,
                          child: Container(
                            margin: EdgeInsets.only(
                                top: 20, bottom: 10, left: 10, right: 10),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Card(
                                      color: Color(0xFFEEF6FD),
                                      margin: EdgeInsets.all(5),
                                      child: Container(
                                        padding: EdgeInsets.all(5),
                                        margin: EdgeInsets.all(5),
                                        child: Center(
                                          child: Column(
                                            children: [
                                              Text(
                                                '2 Years',
                                                style: TextStyle(
                                                    decoration:
                                                        TextDecoration.none,
                                                    color: Color(0xFF070707),
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20),
                                              ),
                                              Text(
                                                'Age',
                                                style: TextStyle(
                                                    decoration:
                                                        TextDecoration.none,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontSize: 15),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Card(
                                      color: Color(0xFFEEF6FD),
                                      margin: EdgeInsets.all(5),
                                      child: Container(
                                        padding: EdgeInsets.all(5),
                                        margin: EdgeInsets.all(5),
                                        child: Center(
                                          child: Column(
                                            children: [
                                              Text(
                                                '4.3 Kg',
                                                style: TextStyle(
                                                    decoration:
                                                        TextDecoration.none,
                                                    color: Color(0xFF070707),
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20),
                                              ),
                                              Text(
                                                'Weight',
                                                style: TextStyle(
                                                    decoration:
                                                        TextDecoration.none,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontSize: 15),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Card(
                                      color: Color(0xFFEEF6FD),
                                      margin: EdgeInsets.all(5),
                                      child: Container(
                                        padding: EdgeInsets.all(5),
                                        margin: EdgeInsets.all(5),
                                        child: Center(
                                          child: Column(
                                            children: [
                                              Text(
                                                'Female',
                                                style: TextStyle(
                                                    decoration:
                                                        TextDecoration.none,
                                                    color: Color(0xFF070707),
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20),
                                              ),
                                              Text(
                                                'sex',
                                                style: TextStyle(
                                                    decoration:
                                                        TextDecoration.none,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontSize: 15),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Card(
                                    child: Container(
                                        margin: EdgeInsets.only(
                                            left: 10.0,
                                            top: 0.0,
                                            right: 10.0,
                                            bottom: 0.0),
                                        height: 50,
                                        width: double.infinity,
                                        padding: EdgeInsets.all(5),
                                        child: Row(
                                          children: [
                                            Container(
                                              width: 40,
                                              height: 40,
                                              child: Container(
                                                alignment: Alignment.centerLeft,
                                                child: CircleAvatar(
                                                  backgroundImage: NetworkImage(
                                                      "https://picsum.photos/200/300?random=1"),
                                                  radius: 10.0,
                                                ),
                                              ),
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Ali Anshad',
                                                  style: TextStyle(
                                                      decoration:
                                                          TextDecoration.none,
                                                      color: Color(0xFF8017DA),
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      fontSize: 12),
                                                ),
                                                Text(
                                                  'Pet owner',
                                                  style: TextStyle(
                                                      decoration:
                                                          TextDecoration.none,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      fontSize: 8),
                                                )
                                              ],
                                            ),
                                            /* Align(
                                     alignment: Alignment.topRight,
                                      child: Container(
                                        alignment: Alignment.topRight,
                                        child: Icon(
                                          Icons.message,
                                          size: 12,
                                        ),
                                      ),
                                    )*/
                                          ],
                                        ))),
                                Container(
                                  padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'Recommendation',
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
                                Card(
                                    color: Color(0xFFEED8FF),
                                    margin: EdgeInsets.all(5),
                                    child: Container(
                                        height: 100,
                                        width: double.infinity,
                                        padding: EdgeInsets.all(5),
                                        child: Row(
                                          children: [
                                            Card(
                                                color: Color(0xFF7D1BC6),
                                                margin: EdgeInsets.all(8),
                                                child: Container(
                                                    /* height: 80,
                                                          width: 80,
                                                          padding: EdgeInsets.all(8),
                                                          child: Icon(
                                                            Icons
                                                                .format_strikethrough_outlined,
                                                            size: 20,
                                                            color: Colors.white,
                                                          )*/
                                                    height: 80,
                                                    width: 80,
                                                    padding: EdgeInsets.all(8),
                                                    child: Image.asset(
                                                      'images/ic_syringe.png',
                                                      width: 40,
                                                      height: 40,
                                                    ))),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Vitamin B12',
                                                  style: TextStyle(
                                                      decoration:
                                                          TextDecoration.none,
                                                      color: Color(0xFF8017DA),
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      fontSize: 15),
                                                ),
                                                Text(
                                                  'Mon 24 March',
                                                  style: TextStyle(
                                                      decoration:
                                                          TextDecoration.none,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      fontSize: 8),
                                                )
                                              ],
                                            ),
                                          ],
                                        ))),
                                SizedBox(
                                  height: 25,
                                ),
                                Stack(
                                  children: [
                                    Visibility(
                                      maintainSize: true,
                                      maintainAnimation: true,
                                      maintainState: true,
                                      visible: isCheckBtnShowing,
                                      child: Container(
                                        margin:
                                            EdgeInsets.fromLTRB(10, 0, 10, 0),
                                        child: SizedBox(
                                            width: double.infinity,
                                            child: ElevatedButton(
                                              child: const Text(
                                                'View check list',
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.white),
                                              ),
                                              style: ButtonStyle(
                                                  padding: MaterialStateProperty.all<EdgeInsets>(
                                                      EdgeInsets.fromLTRB(
                                                          50, 10, 50, 10)),
                                                  backgroundColor:
                                                      MaterialStateProperty.all<Color>(
                                                          Color(0xFF8017DA)),
                                                  shape: MaterialStateProperty.all<
                                                          RoundedRectangleBorder>(
                                                      RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.circular(20.0),
                                                          side: BorderSide(color: const Color(0xFF8017DA))))),
                                              onPressed: () {
                                                showCheckList();
                                              },
                                            )),
                                      ),
                                    ),
                                    Visibility(
                                        maintainSize: true,
                                        maintainAnimation: true,
                                        maintainState: true,
                                        visible: isChecklistShowing,
                                        child: Container(
                                          alignment: Alignment.topLeft,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                height: 15,
                                              ),
                                              Container(
                                                padding: EdgeInsets.fromLTRB(
                                                    10, 20, 10, 0),
                                                alignment: Alignment.topLeft,
                                                child: Text(
                                                  'Check list',
                                                  style: TextStyle(
                                                      decoration:
                                                          TextDecoration.none,
                                                      color: Color(0xFF070707),
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 22),
                                                ),
                                              ),
                                              Container(
                                                padding: EdgeInsets.fromLTRB(
                                                    10, 0, 10, 20),
                                                alignment: Alignment.topLeft,
                                                child: Text(
                                                  'From Owner',
                                                  style: TextStyle(
                                                      decoration:
                                                          TextDecoration.none,
                                                      fontSize: 10),
                                                ),
                                              ),
                                              Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      Checkbox(
                                                        checkColor:
                                                            Color(0xFF8017DA),
                                                        activeColor:
                                                            Color(0xFFC3C2C4),
                                                        value: this.valuefirst,
                                                        onChanged:
                                                            (bool? value) {
                                                          setState(() {
                                                            this.valuefirst =
                                                                value!;
                                                          });
                                                        },
                                                      ),
                                                      Text(
                                                        'how you handled it. ',
                                                        style: TextStyle(
                                                            fontSize: 17.0),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Checkbox(
                                                        checkColor:
                                                            Color(0xFF8017DA),
                                                        activeColor:
                                                            Color(0xFFC3C2C4),
                                                        value: this.valueSecond,
                                                        onChanged:
                                                            (bool? value) {
                                                          setState(() {
                                                            this.valueSecond =
                                                                value!;
                                                          });
                                                        },
                                                      ),
                                                      Text(
                                                        'Scheduled a zoom call with  pets team. ',
                                                        style: TextStyle(
                                                            fontSize: 17.0),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Checkbox(
                                                        checkColor:
                                                            Color(0xFF8017DA),
                                                        activeColor:
                                                            Color(0xFFC3C2C4),
                                                        value: this.valueThird,
                                                        onChanged:
                                                            (bool? value) {
                                                          setState(() {
                                                            this.valueThird =
                                                                value!;
                                                          });
                                                        },
                                                      ),
                                                      Text(
                                                        'Push latest photo. ',
                                                        style: TextStyle(
                                                            fontSize: 17.0),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Checkbox(
                                                        checkColor:
                                                            Color(0xFF8017DA),
                                                        activeColor:
                                                            Color(0xFFC3C2C4),
                                                        value: this.valueForth,
                                                        onChanged:
                                                            (bool? value) {
                                                          setState(() {
                                                            this.valueForth =
                                                                value!;
                                                          });
                                                        },
                                                      ),
                                                      Text(
                                                        'Do you have any pet specific training. ',
                                                        style: TextStyle(
                                                            fontSize: 17.0),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Checkbox(
                                                        checkColor:
                                                            Color(0xFF8017DA),
                                                        activeColor:
                                                            Color(0xFFC3C2C4),
                                                        value: this.valueFifth,
                                                        onChanged:
                                                            (bool? value) {
                                                          setState(() {
                                                            this.valueFifth =
                                                                value!;
                                                          });
                                                        },
                                                      ),
                                                      Text(
                                                        'Will they meet your dog first ',
                                                        style: TextStyle(
                                                            fontSize: 17.0),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Checkbox(
                                                        checkColor:
                                                            Color(0xFF8017DA),
                                                        activeColor:
                                                            Color(0xFFC3C2C4),
                                                        value: this.valueSixth,
                                                        onChanged:
                                                            (bool? value) {
                                                          setState(() {
                                                            this.valueSixth =
                                                                value!;
                                                          });
                                                        },
                                                      ),
                                                      Text(
                                                        'how you handled it. ',
                                                        style: TextStyle(
                                                            fontSize: 17.0),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Checkbox(
                                                        checkColor:
                                                            Color(0xFF8017DA),
                                                        activeColor:
                                                            Color(0xFFC3C2C4),
                                                        value:
                                                            this.valueSeventh,
                                                        onChanged:
                                                            (bool? value) {
                                                          setState(() {
                                                            this.valueSeventh =
                                                                value!;
                                                          });
                                                        },
                                                      ),
                                                      Text(
                                                        'Scheduled a zoom call with  pets team. ',
                                                        style: TextStyle(
                                                            fontSize: 17.0),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Checkbox(
                                                        checkColor:
                                                            Color(0xFF8017DA),
                                                        activeColor:
                                                            Color(0xFFC3C2C4),
                                                        value: this.valueEighth,
                                                        onChanged:
                                                            (bool? value) {
                                                          setState(() {
                                                            this.valueEighth =
                                                                value!;
                                                          });
                                                        },
                                                      ),
                                                      Text(
                                                        'Push latest photo. ',
                                                        style: TextStyle(
                                                            fontSize: 17.0),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Checkbox(
                                                        checkColor:
                                                            Color(0xFF8017DA),
                                                        activeColor:
                                                            Color(0xFFC3C2C4),
                                                        value: this.valueNineth,
                                                        onChanged:
                                                            (bool? value) {
                                                          setState(() {
                                                            this.valueNineth =
                                                                value!;
                                                          });
                                                        },
                                                      ),
                                                      Text(
                                                        'Do you have any pet specific training. ',
                                                        style: TextStyle(
                                                            fontSize: 17.0),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Checkbox(
                                                        checkColor:
                                                            Color(0xFF8017DA),
                                                        activeColor:
                                                            Color(0xFFC3C2C4),
                                                        value: this.valueTenth,
                                                        onChanged:
                                                            (bool? value) {
                                                          setState(() {
                                                            this.valueTenth =
                                                                value!;
                                                          });
                                                        },
                                                      ),
                                                      Text(
                                                        'Will they meet your dog first ',
                                                        style: TextStyle(
                                                            fontSize: 17.0),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(height: 10),
                                                  Container(
                                                    margin: EdgeInsets.fromLTRB(
                                                        10, 0, 10, 0),
                                                    child: SizedBox(
                                                        width: double.infinity,
                                                        child: ElevatedButton(
                                                          child: const Text(
                                                            'Submit',
                                                            style: TextStyle(
                                                                fontSize: 18,
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                          style: ButtonStyle(
                                                              padding: MaterialStateProperty.all<EdgeInsets>(
                                                                  EdgeInsets.fromLTRB(
                                                                      50,
                                                                      10,
                                                                      50,
                                                                      10)),
                                                              backgroundColor:
                                                                  MaterialStateProperty.all<Color>(Color(
                                                                      0xFF8017DA)),
                                                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius.circular(20.0),
                                                                  side: BorderSide(color: const Color(0xFF8017DA))))),
                                                          onPressed: () {},
                                                        )),
                                                  ),
                                                  SizedBox(height: 10),
                                                ],
                                              )
                                            ],
                                          ),
                                        ))
                                  ],
                                )

                                // showCheckList(isChecklistShowing,isChecBoxClicked)
                              ],
                            ),
                          )),
                      Visibility(
                          maintainSize: false,
                          maintainAnimation: true,
                          maintainState: true,
                          visible: visibilityMedical,
                          child: Container(
                            margin: EdgeInsets.only(
                                top: 20, bottom: 10, left: 20, right: 10),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Card(
                                      color: Color(0xFFEEF6FD),
                                      margin: EdgeInsets.all(5),
                                      child: Container(
                                        padding: EdgeInsets.all(5),
                                        margin: EdgeInsets.all(5),
                                        child: Center(
                                          child: Column(
                                            children: [
                                              Text(
                                                '2 Years',
                                                style: TextStyle(
                                                    decoration:
                                                        TextDecoration.none,
                                                    color: Color(0xFF070707),
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20),
                                              ),
                                              Text(
                                                'Age',
                                                style: TextStyle(
                                                    decoration:
                                                        TextDecoration.none,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontSize: 15),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Card(
                                      color: Color(0xFFEEF6FD),
                                      margin: EdgeInsets.all(5),
                                      child: Container(
                                        padding: EdgeInsets.all(5),
                                        margin: EdgeInsets.all(5),
                                        child: Center(
                                          child: Column(
                                            children: [
                                              Text(
                                                '4.3 Kg',
                                                style: TextStyle(
                                                    decoration:
                                                        TextDecoration.none,
                                                    color: Color(0xFF070707),
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20),
                                              ),
                                              Text(
                                                'Weight',
                                                style: TextStyle(
                                                    decoration:
                                                        TextDecoration.none,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontSize: 15),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Card(
                                      color: Color(0xFFEEF6FD),
                                      margin: EdgeInsets.all(5),
                                      child: Container(
                                        padding: EdgeInsets.all(5),
                                        margin: EdgeInsets.all(5),
                                        child: Center(
                                          child: Column(
                                            children: [
                                              Text(
                                                'Female',
                                                style: TextStyle(
                                                    decoration:
                                                        TextDecoration.none,
                                                    color: Color(0xFF070707),
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20),
                                              ),
                                              Text(
                                                'sex',
                                                style: TextStyle(
                                                    decoration:
                                                        TextDecoration.none,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontSize: 15),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Card(
                                    child: Container(
                                        margin: EdgeInsets.only(
                                            left: 10.0,
                                            top: 0.0,
                                            right: 10.0,
                                            bottom: 0.0),
                                        height: 50,
                                        width: double.infinity,
                                        padding: EdgeInsets.all(5),
                                        child: Row(
                                          children: [
                                            Container(
                                              width: 40,
                                              height: 40,
                                              child: Container(
                                                alignment: Alignment.centerLeft,
                                                child: CircleAvatar(
                                                  backgroundImage: NetworkImage(
                                                      "https://picsum.photos/200/300?random=1"),
                                                  radius: 10.0,
                                                ),
                                              ),
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Ali Anshad',
                                                  style: TextStyle(
                                                      decoration:
                                                          TextDecoration.none,
                                                      color: Color(0xFF8017DA),
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      fontSize: 12),
                                                ),
                                                Text(
                                                  'Pet owner',
                                                  style: TextStyle(
                                                      decoration:
                                                          TextDecoration.none,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      fontSize: 8),
                                                )
                                              ],
                                            ),
                                            /* Align(
                                     alignment: Alignment.topRight,
                                      child: Container(
                                        alignment: Alignment.topRight,
                                        child: Icon(
                                          Icons.message,
                                          size: 12,
                                        ),
                                      ),
                                    )*/
                                          ],
                                        ))),
                                SizedBox(
                                  height: 25,
                                ),
                                Container(
                                    alignment: Alignment.topLeft,
                                    child: Text('* 1x Blood Test(CBC)',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16))),
                                SizedBox(height: 20),
                                Container(
                                    alignment: Alignment.topLeft,
                                    child: Text('* 2x Dental Exam',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16))),
                                SizedBox(height: 20),
                                Container(
                                    alignment: Alignment.topLeft,
                                    child: Text('* 1x Blood Test(CBC)',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16))),
                                SizedBox(height: 20),
                                Container(
                                    alignment: Alignment.topLeft,
                                    child: Text('* 1x Blood Chemistry',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16))),
                                SizedBox(height: 20),
                                Container(
                                    alignment: Alignment.topLeft,
                                    child: Text('* 1x Urine Test',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16))),
                                SizedBox(height: 20),
                                Container(
                                    alignment: Alignment.topLeft,
                                    child: Text('* 1x Lipid Profiling',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16))),
                                SizedBox(height: 20),
                              ],
                            ),
                          )),
                      Visibility(
                          maintainSize: false,
                          maintainAnimation: true,
                          maintainState: true,
                          visible: visibilityDoctor,
                          child: Container(
                            margin: EdgeInsets.only(
                                top: 20, bottom: 10, left: 10, right: 10),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Card(
                                      color: Color(0xFFEEF6FD),
                                      margin: EdgeInsets.all(5),
                                      child: Container(
                                        padding: EdgeInsets.all(5),
                                        margin: EdgeInsets.all(5),
                                        child: Center(
                                          child: Column(
                                            children: [
                                              Text(
                                                '2 Years',
                                                style: TextStyle(
                                                    decoration:
                                                        TextDecoration.none,
                                                    color: Color(0xFF070707),
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20),
                                              ),
                                              Text(
                                                'Age',
                                                style: TextStyle(
                                                    decoration:
                                                        TextDecoration.none,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontSize: 15),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Card(
                                      color: Color(0xFFEEF6FD),
                                      margin: EdgeInsets.all(5),
                                      child: Container(
                                        padding: EdgeInsets.all(5),
                                        margin: EdgeInsets.all(5),
                                        child: Center(
                                          child: Column(
                                            children: [
                                              Text(
                                                '4.3 Kg',
                                                style: TextStyle(
                                                    decoration:
                                                        TextDecoration.none,
                                                    color: Color(0xFF070707),
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20),
                                              ),
                                              Text(
                                                'Weight',
                                                style: TextStyle(
                                                    decoration:
                                                        TextDecoration.none,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontSize: 15),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Card(
                                      color: Color(0xFFEEF6FD),
                                      margin: EdgeInsets.all(5),
                                      child: Container(
                                        padding: EdgeInsets.all(5),
                                        margin: EdgeInsets.all(5),
                                        child: Center(
                                          child: Column(
                                            children: [
                                              Text(
                                                'Female',
                                                style: TextStyle(
                                                    decoration:
                                                        TextDecoration.none,
                                                    color: Color(0xFF070707),
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20),
                                              ),
                                              Text(
                                                'sex',
                                                style: TextStyle(
                                                    decoration:
                                                        TextDecoration.none,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontSize: 15),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Card(
                                    child: Container(
                                        margin: EdgeInsets.only(
                                            left: 10.0,
                                            top: 0.0,
                                            right: 10.0,
                                            bottom: 0.0),
                                        height: 50,
                                        width: double.infinity,
                                        padding: EdgeInsets.all(5),
                                        child: Row(
                                          children: [
                                            Container(
                                              width: 40,
                                              height: 40,
                                              child: Container(
                                                alignment: Alignment.centerLeft,
                                                child: CircleAvatar(
                                                  backgroundImage: NetworkImage(
                                                      "https://picsum.photos/200/300?random=1"),
                                                  radius: 10.0,
                                                ),
                                              ),
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Ali Anshad',
                                                  style: TextStyle(
                                                      decoration:
                                                          TextDecoration.none,
                                                      color: Color(0xFF8017DA),
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      fontSize: 12),
                                                ),
                                                Text(
                                                  'Pet owner',
                                                  style: TextStyle(
                                                      decoration:
                                                          TextDecoration.none,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      fontSize: 8),
                                                )
                                              ],
                                            ),
                                            /* Align(
                                     alignment: Alignment.topRight,
                                      child: Container(
                                        alignment: Alignment.topRight,
                                        child: Icon(
                                          Icons.message,
                                          size: 12,
                                        ),
                                      ),
                                    )*/
                                          ],
                                        ))),
                                SizedBox(
                                  height: 15,
                                ),
                                Container(
                                    child: Column(
                                  children: [
                                    Row(children: [
                                      Container(
                                        width: 80,
                                        height: 80,
                                        child: Container(
                                          alignment: Alignment.centerLeft,
                                          child: CircleAvatar(
                                            backgroundImage: NetworkImage(
                                                "https://picsum.photos/200/300?random=1"),
                                            radius: 40.0,
                                          ),
                                        ),
                                      ),
                                      Container(
                                          margin:
                                              EdgeInsets.fromLTRB(10, 0, 10, 0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Dr.Ravi Kumar',
                                                style: TextStyle(
                                                    decoration:
                                                        TextDecoration.none,
                                                    color: Color(0xFF070707),
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16),
                                              ),
                                              Text(
                                                'Veterinary Dentist',
                                                style: TextStyle(
                                                    decoration:
                                                        TextDecoration.none,
                                                    color: Color(0xFF070707),
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 10),
                                              ),
                                              StarRating(
                                                rating: rating,
                                                onRatingChanged: (rating) =>
                                                    setState(() =>
                                                        this.rating = rating),
                                                color: Colors.amberAccent,
                                              )
                                            ],
                                          ))
                                    ]),
                                    Card(
                                        color: Color(0xFFF8F7FB),
                                        margin:
                                            EdgeInsets.fromLTRB(10, 20, 10, 20),
                                        child: Column(
                                          children: [
                                            Container(
                                                height: 50,
                                                width: double.infinity,
                                                padding: EdgeInsets.all(5),
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      width: 40,
                                                      height: 40,
                                                      child: Container(
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        child: Icon(
                                                          Icons
                                                              .view_compact_outlined,
                                                          size: 12,
                                                        ),
                                                      ),
                                                    ),
                                                    Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          'Vetinery Clinic',
                                                          style: TextStyle(
                                                              decoration:
                                                                  TextDecoration
                                                                      .none,
                                                              color:
                                                                  Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                              fontSize: 12),
                                                        ),
                                                        Text(
                                                          '141 NMG Road,Bangalore',
                                                          style: TextStyle(
                                                              decoration:
                                                                  TextDecoration
                                                                      .none,
                                                              color:
                                                                  Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                              fontSize: 8),
                                                        )
                                                      ],
                                                    ),
                                                  ],
                                                )),
                                            Container(
                                                height: 50,
                                                width: double.infinity,
                                                padding: EdgeInsets.all(5),
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      width: 40,
                                                      height: 40,
                                                      child: Container(
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        child: Icon(
                                                          Icons.access_time,
                                                          size: 12,
                                                        ),
                                                      ),
                                                    ),
                                                    Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          'Wed 9 Sep --10:30am',
                                                          style: TextStyle(
                                                              decoration:
                                                                  TextDecoration
                                                                      .none,
                                                              color:
                                                                  Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                              fontSize: 12),
                                                        ),
                                                        /* Text(
                                                                    'Pet owner',
                                                                    style: TextStyle(
                                                                        decoration: TextDecoration
                                                                            .none,
                                                                        fontWeight: FontWeight
                                                                            .normal,
                                                                        fontSize: 8),
                                                                  )*/
                                                      ],
                                                    ),
                                                    /* Align(
                                     alignment: Alignment.topRight,
                                      child: Container(
                                        alignment: Alignment.topRight,
                                        child: Icon(
                                          Icons.message,
                                          size: 12,
                                        ),
                                      ),
                                    )*/
                                                  ],
                                                ))
                                          ],
                                        )),
                                  ],
                                ))
                              ],
                            ),
                          )),
                      Visibility(
                          maintainSize: false,
                          maintainAnimation: true,
                          maintainState: true,
                          visible: visibilityGrooming,
                          child: Container(
                            margin: EdgeInsets.only(
                                top: 20, bottom: 10, left: 10, right: 10),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Card(
                                      color: Color(0xFFEEF6FD),
                                      margin: EdgeInsets.all(5),
                                      child: Container(
                                        padding: EdgeInsets.all(5),
                                        margin: EdgeInsets.all(5),
                                        child: Center(
                                          child: Column(
                                            children: [
                                              Text(
                                                '2 Years',
                                                style: TextStyle(
                                                    decoration:
                                                        TextDecoration.none,
                                                    color: Color(0xFF070707),
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20),
                                              ),
                                              Text(
                                                'Age',
                                                style: TextStyle(
                                                    decoration:
                                                        TextDecoration.none,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontSize: 15),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Card(
                                      color: Color(0xFFEEF6FD),
                                      margin: EdgeInsets.all(5),
                                      child: Container(
                                        padding: EdgeInsets.all(5),
                                        margin: EdgeInsets.all(5),
                                        child: Center(
                                          child: Column(
                                            children: [
                                              Text(
                                                '4.3 Kg',
                                                style: TextStyle(
                                                    decoration:
                                                        TextDecoration.none,
                                                    color: Color(0xFF070707),
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20),
                                              ),
                                              Text(
                                                'Weight',
                                                style: TextStyle(
                                                    decoration:
                                                        TextDecoration.none,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontSize: 15),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Card(
                                      color: Color(0xFFEEF6FD),
                                      margin: EdgeInsets.all(5),
                                      child: Container(
                                        padding: EdgeInsets.all(5),
                                        margin: EdgeInsets.all(5),
                                        child: Center(
                                          child: Column(
                                            children: [
                                              Text(
                                                'Female',
                                                style: TextStyle(
                                                    decoration:
                                                        TextDecoration.none,
                                                    color: Color(0xFF070707),
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20),
                                              ),
                                              Text(
                                                'sex',
                                                style: TextStyle(
                                                    decoration:
                                                        TextDecoration.none,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontSize: 15),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Card(
                                    child: Container(
                                        height: 50,
                                        width: double.infinity,
                                        padding: EdgeInsets.all(5),
                                        child: Row(
                                          children: [
                                            Container(
                                              width: 40,
                                              height: 40,
                                              child: Container(
                                                alignment: Alignment.centerLeft,
                                                child: CircleAvatar(
                                                  backgroundImage: NetworkImage(
                                                      "https://picsum.photos/200/300?random=1"),
                                                  radius: 10.0,
                                                ),
                                              ),
                                            ),
                                            Column(
                                              children: [
                                                Text(
                                                  'Ali Anshad',
                                                  style: TextStyle(
                                                      decoration:
                                                          TextDecoration.none,
                                                      color: Color(0xFF8017DA),
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      fontSize: 12),
                                                ),
                                                Text(
                                                  'Pet owner',
                                                  style: TextStyle(
                                                      decoration:
                                                          TextDecoration.none,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      fontSize: 8),
                                                )
                                              ],
                                            ),
                                            /* Align(
                                     alignment: Alignment.topRight,
                                      child: Container(
                                        alignment: Alignment.topRight,
                                        child: Icon(
                                          Icons.message,
                                          size: 12,
                                        ),
                                      ),
                                    )*/
                                          ],
                                        ))),
                                SizedBox(
                                  height: 15,
                                ),
                                Container(
                                    child: Row(children: [
                                  Container(
                                    width: 80,
                                    height: 80,
                                    child: Container(
                                      alignment: Alignment.centerLeft,
                                      child: CircleAvatar(
                                        backgroundImage: NetworkImage(
                                            "https://picsum.photos/200/300?random=1"),
                                        radius: 40.0,
                                      ),
                                    ),
                                  ),
                                  Container(
                                      margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Dr.Ravi Kumar',
                                            style: TextStyle(
                                                decoration: TextDecoration.none,
                                                color: Color(0xFF070707),
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16),
                                          ),
                                          Text(
                                            'Veterinary Dentist',
                                            style: TextStyle(
                                                decoration: TextDecoration.none,
                                                color: Color(0xFF070707),
                                                fontWeight: FontWeight.bold,
                                                fontSize: 10),
                                          ),
                                          StarRating(
                                            rating: rating,
                                            onRatingChanged: (rating) =>
                                                setState(
                                                    () => this.rating = rating),
                                            color: Colors.amberAccent,
                                          )
                                        ],
                                      ))
                                ]))
                              ],
                            ),
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  )
                ],
              ),
            )
          ],
        ))));
  }
}
