import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:paw_record/model/LoginResponseModel.dart';
import 'package:paw_record/ui/home/home_screen.dart';
import 'package:paw_record/ui/petsitter/petsitterhome/petsitter_home.dart';
import 'package:paw_record/ui/register/register_screen.dart';
import 'package:http/http.dart' as http;
import 'package:paw_record/api/ApiConstants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final email_controller = TextEditingController();
  final password_controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
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
        body: Stack(children: <Widget>[
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
              'Sign In',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
          ),
          Container(
              padding: const EdgeInsets.fromLTRB(30, 70, 30, 50),
              child: Wrap(
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 40),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              TextFormField(
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
                                    borderSide:
                                        BorderSide(color: Color(0xFF6200EE)),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              TextFormField(
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
                                    borderSide:
                                        BorderSide(color: Color(0xFF6200EE)),
                                  ),
                                ),
                                validator: (val) => val!.length < 4
                                    ? 'Your password is too Password too short..'
                                    : null,
                              ),
                              SizedBox(height: 25),
                              Align(
                                alignment: Alignment.center,
                                child: TextButton(
                                  child: const Text(
                                    'Sign In',
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.white),
                                  ),
                                  style: ButtonStyle(
                                      padding: MaterialStateProperty.all<EdgeInsets>(
                                          EdgeInsets.fromLTRB(50, 10, 50, 10)),
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Color(0xFF8017DA)),
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                              side: BorderSide(
                                                  color: const Color(0xFF8017DA))))),
                                  onPressed: () {

                                    showLoaderDialog(context);
                                    signin(email_controller.text,
                                        password_controller.text, context);

                                    /* String email = email_controller.text;
                                    String password = password_controller.text;

                                    dynamic response= ApiService().login(
                                      email,
                                      password,
                                    );*/
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 100)
                      ],
                    ),
                  )
                ],
              )),
          Container(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: <Widget>[
                const Text('Don`t have account yet?',
                    style: TextStyle(color: Colors.black)),
                TextButton(
                  child: const Text(
                    'Registration',
                    style: TextStyle(fontSize: 18, color: Color(0xFF8017DA)),
                  ),
                  onPressed: () {
                    //signup screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RegisterScreen()),
                    );
                  },
                )
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ),
        ]));
  }

/*  Future<void> sendLoginRequest(String email_, String password_)  async {

   LoginRequestModel data = LoginRequestModel(email: email_, password: password_);
   loginRequestModelToJson(data);
   var loginStatus=(await ApiService().login(data))!;
   if(loginStatus.message=="success"){

     Navigator.push(
       context,
       MaterialPageRoute(
           builder: (context) =>
           const HomeScreen()),
     );
   }


  }*/

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

signin(String email, String password, BuildContext context) async {
  var data = jsonEncode({'email': email, 'password': password});

  var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.login);
  var response = await http.post(url, body: data, headers: {
    "Accept": "application/json",
    "content-type": "application/json"
  });
  if (response.statusCode == 200) {
    Navigator.pop(context);
    LoginResponseModel _model = loginResponseModelFromJson(response.body);
    _model.data.token;
    save(_model.data.token,_model.type);

    if(_model.type=="CUSTOMER") {

      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const HomeScreen()));

    }else{
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const PetSitterHomeScreen()));
    }

  } else {
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
    );
  }
}

save(String? token, String? type) async {
  var prefs = await SharedPreferences.getInstance();
  prefs.setString("token", token!);
  prefs.setString("type", type!);
}

Widget makeInput({label, obsureText = false}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(
        height: 10,
      ),
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
      SizedBox(
        height: 5,
      ),
    ],
  );
}
