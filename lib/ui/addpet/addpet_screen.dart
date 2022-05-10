import 'package:flutter/material.dart';

class AddPetScreen extends StatefulWidget {
  const AddPetScreen({Key? key}) : super(key: key);

  @override
  _AddPetScreenState createState() => _AddPetScreenState();
}

class _AddPetScreenState extends State<AddPetScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false, // set it to false
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
        body: Container(
    child:  SingleChildScrollView(
      child: Column(
            children: [
               Container(
                width: double.infinity,
                height: 200,
                child: Container(
                  alignment: Alignment(0.0,2.5),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://picsum.photos/200/300?random=1"
                    ),
                    radius: 60.0,
                  ),
                ),
              ),
              SizedBox(height: 25),
              Container(
                padding: EdgeInsets.fromLTRB(50, 10, 0, 0),
                alignment: Alignment.topLeft,
                child: Text('General',
                  style: TextStyle(
                      decoration: TextDecoration.none,
                      color: Color(0xFF070707),
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(50, 10, 0, 0),
                alignment: Alignment.topLeft,

                child: Text('Information',
                  style: TextStyle(
                      decoration: TextDecoration.none,
                      color: Color(0xFF070707),
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              ),
      Container(
          padding: EdgeInsets.fromLTRB(50, 10, 0, 0),
         child: Column(
            children: [
              makeInput(label: "Pet's Name"),
              makeInput(label: "Species of your pet",obsureText: true),
              makeInput(label: "Breed"),
              makeInput(label: "Size (Optional)"),
              makeInput(label: "Gender"),

              ]
          )
      )


            ],
          ),
    )

           )
        );
  }
}

Widget makeInput({label,obsureText = false}){
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
