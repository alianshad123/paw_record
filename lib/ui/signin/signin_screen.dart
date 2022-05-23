

import 'package:flutter/material.dart';
import 'package:paw_record/ui/home/home_screen.dart';
import 'package:paw_record/ui/register/register_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          brightness: Brightness.light,
          backgroundColor: const Color(0xFF8017DA),
          leading:
          IconButton( onPressed: (){
            Navigator.pop(context);
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
                  'Sign In',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                ),
              ),

              Container(
                  padding: const EdgeInsets.fromLTRB(30, 70, 30, 50),
                  child:Wrap(
                    children: [
                      Card(
                        child: Column(
                          children: <Widget>[

                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 40
                              ),
                              child: Column(
                                children: [
                                  makeInput(label: "Email"),
                                  makeInput(label: "Password",obsureText: true),
                                  SizedBox(height: 25),

                                  TextButton(
                                    child: const Text(
                                      'Sign In',
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
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => const HomeScreen()),
                                      );
                                    },
                                  )

                                ],
                              ),
                            ),
                            SizedBox(height: 100)

                          ],
                        ),
                      )
                    ],

                  )


              ),

              Container(
                alignment: Alignment.bottomCenter,
                child: Row(
                  children: <Widget>[
                    const Text('Don`t have account yet?',
                        style: TextStyle(color: Colors.black)),
                    TextButton(
                      child: const Text(
                        'Registration',
                        style: TextStyle(fontSize: 18, color:  Color(0xFF8017DA)),
                      ),
                      onPressed: () {
                        //signup screen
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const RegisterScreen()),
                        );

                      },
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
              ),



            ])
    );

  }
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