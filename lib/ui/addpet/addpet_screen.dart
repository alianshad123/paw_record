import 'package:flutter/material.dart';
import 'package:paw_record/ui/signin/signin_screen.dart';

class AddPetScreen extends StatefulWidget {
  const AddPetScreen({Key? key}) : super(key: key);

  @override
  _AddPetScreenState createState() => _AddPetScreenState();
}

class _AddPetScreenState extends State<AddPetScreen> {
  bool isSwitched = false;

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
                    makeInput(label: "Pet's Name"),
                    makeInput(label: "Species of your pet", obsureText: true),
                    makeInput(label: "Breed"),
                    makeInput(label: "Size (Optional)"),
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
                    makeInput(label: "Date of birth"),
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
                    makeAdditionalOptions(
                        label: "Friendly with dogs", isSWitch: isSwitched),
                    makeAdditionalOptions(
                        label: "Friendly with cats", isSWitch: isSwitched),
                    makeAdditionalOptions(
                        label: "Medical Info", isSWitch: isSwitched),
                    makeAdditionalOptions(
                        label: "Vaccine info", isSWitch: isSwitched),
                    makeAdditionalOptions(
                        label: "Doctor info", isSWitch: isSwitched),
                    makeAdditionalOptions(label: "Food", isSWitch: isSwitched),
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
                          makeReminderView(),
                          makeReminderView(),
                          makeReminderView(),
                          makeReminderView(),
                          makeReminderView()
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
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignInScreen()),
                            );
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
              'images/paw_recd.png',
              width: 35,
              height: 35,
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
