import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_logs/flutter_logs.dart';
import 'package:paw_record/api/ApiConstants.dart';
import 'package:http/http.dart' as http;
import 'package:paw_record/ui/home/home_screen.dart';
import 'dart:convert';
import 'dart:developer';

import 'package:paw_record/ui/login/login_screen.dart';
import 'package:paw_record/ui/profile/profile_screen.dart';
import 'package:paw_record/ui/signin/signin_screen.dart';
import 'package:paw_record/ui/utils/Authmethods.dart';
import 'package:paw_record/ui/utils/DatabaseMethods.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SitterRegistration extends StatefulWidget {
  const SitterRegistration({Key? key}) : super(key: key);

  @override
  _SitterRegistrationState createState() => _SitterRegistrationState();
}

class _SitterRegistrationState extends State<SitterRegistration> {
  bool agree = false;
  bool agree_ = false;
  final fullname_controller = TextEditingController();
  final email_controller = TextEditingController();
  final password_controller = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void validateAndSave() {
    final FormState? form = _formKey.currentState;
    if (form?.validate() == true) {
      showLoaderDialog(context);

      Map<String,String> userInfoMap ={
        "name":fullname_controller.text,
        "email": email_controller.text
      };

      authMethods.signUpWithEmailAndPassword(email_controller.text,  password_controller.text).then((value) {

        databaseMethods.uploadUserInfo(userInfoMap);

      });
      signUp(fullname_controller.text,email_controller.text,
          password_controller.text, context);
    } else {
      print('Form is invalid');
    }
  }

  AuthMethods authMethods=AuthMethods();
  DatabaseMethods databaseMethods=DatabaseMethods();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          brightness: Brightness.light,
          backgroundColor: const Color(0xFF8017DA),
          leading:
          IconButton( onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            );
          },icon:Icon(Icons.arrow_back_ios,size: 20,color: Colors.white,)),
        ),
        body: Stack(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 350,
                    color: const Color(0xFF8017DA),
                  ),
                ],
              ),

              Container(
                padding: const EdgeInsets.fromLTRB(30, 10, 10, 0),
                child: Text(
                  'Sitter Registration',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),

              Container(
                  padding: const EdgeInsets.fromLTRB(30, 70, 30, 50),
                  child:Wrap(
                      children:[
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Column(
                            children: <Widget>[

                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 40
                                ),
                                child: Form(
                                  key: _formKey,
                                  child: Column(
                                    children: [
                                      SizedBox(height: 10,),
                                      TextFormField(
                                        autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                        validator: (value){
                                          if (value?.isEmpty==true) {
                                            return 'Please enter username';
                                          }
                                          if (value!.length <=4 ) {
                                            return 'username length must be greater than four characters';
                                          }
                                          return null;
                                        },
                                        keyboardType: TextInputType.name,
                                        controller: fullname_controller,
                                        decoration: InputDecoration(
                                          labelText: "Full name",
                                          labelStyle: TextStyle(
                                            color: Color(0xFF6200EE),
                                          ),
                                          suffixIcon: Icon(
                                            Icons.check_circle,
                                          ),
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(color: Color(0xFF6200EE)),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 5,),
                                      TextFormField(
                                        autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                        validator: (value){
                                          if (value?.isEmpty==true) {
                                            return 'Please enter email';
                                          }
                                          return null;
                                        },
                                        keyboardType: TextInputType.emailAddress,
                                        controller: email_controller,
                                        decoration: InputDecoration(
                                          labelText: "Email",
                                          labelStyle: TextStyle(
                                            color: Color(0xFF6200EE),
                                          ),
                                          suffixIcon: Icon(
                                            Icons.check_circle,
                                          ),
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(color: Color(0xFF6200EE)),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 5,),
                                      TextFormField(
                                        autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                        validator: (value){
                                          if (value?.isEmpty==true) {
                                            return 'Please enter password';
                                          }
                                          if (value!.length <6 ) {
                                            return 'Password length must be greater than 6 characters';
                                          }
                                          return null;
                                        },
                                        keyboardType: TextInputType.visiblePassword,
                                        controller: password_controller,
                                        decoration: InputDecoration(
                                          labelText: "Password",
                                          labelStyle: TextStyle(
                                            color: Color(0xFF6200EE),
                                          ),
                                          suffixIcon: Icon(
                                            Icons.check_circle,
                                          ),
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(color: Color(0xFF6200EE)),
                                          ),
                                        ),
                                      ),
                                      /* SizedBox(height: 5,),


                               makeInput(label: "Full name",obsureText: true),
                               makeInput(label: "Email"),
                               makeInput(label: "Password",obsureText: true),*/
                                      SizedBox(height: 15),

                                      TextButton(
                                        child: const Text(
                                          'Sign Up',
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
                                          validateAndSave();

                                        },
                                      )

                                    ],
                                  ),
                                ),

                              ),
                              SizedBox(height: 100,)

                            ],
                          ),
                        )
                      ]

                  )


              ),

             /* Container(
                alignment: Alignment.bottomCenter,
                child: Row(
                  children: <Widget>[
                    const Text('Already have an account?',
                        style: TextStyle(color: Colors.black)),
                    TextButton(
                      child: const Text(
                        'Sign in',
                        style: TextStyle(fontSize: 18, color:  Color(0xFF8017DA)),
                      ),
                      onPressed: () {
                        Navigator.pop(context);

                      },
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
              ),*/



            ])
    );

  }
}

showLoaderDialog(BuildContext context){
  AlertDialog alert=AlertDialog(
    content: new Row(
      children: [
        CircularProgressIndicator(),
        Container(margin: EdgeInsets.only(left: 7),child:Text("Loading..." )),
      ],),
  );
  showDialog(barrierDismissible: false,
    context:context,
    builder:(BuildContext context){
      return alert;
    },
  );
}

Widget makeInput({label,obsureText = false}){
  return Column(

    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(height: 10,),
      TextFormField(
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(
            color: Color(0xFF6200EE),
          ),
          suffixIcon: Icon(
            Icons.check_circle,
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF6200EE)),
          ),
        ),
      ),
      SizedBox(height: 5,),


    ],
  );
}


signUp(String fullname,String email, String password, BuildContext context) async {

  var data = jsonEncode({'full_name': fullname,'email': email, 'password': password });
  var prefs = await SharedPreferences.getInstance();
  var token = prefs.getString("token");
  var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.sitter_reg);
  var response = await http.post(url, body: data, headers: {
    "Accept": "application/json",
    "content-type": "application/json",
  "Authorization": "Bearer $token"
  });
  if (response.statusCode == 200) {

    FlutterLogs.logInfo("JsonDataResponse","PawJson", response.body);
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Message'),
        content: const Text('Sitter created successfully'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pop(context, 'OK');

            },
            child: const Text('OK'),
          ),
        ],
      ),
    ).then((value) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    });

  }else{
    Navigator.pop(context);
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Alert'),
        content: const Text('Something went wrong,Please try again'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'OK'),
            child: const Text('OK'),
          ),
        ],
      ),
    ).then((value) {
      Navigator.pop(context);
    });
  }
}