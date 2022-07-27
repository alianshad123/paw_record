import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PetSitterDetailScreen extends StatefulWidget {
  const PetSitterDetailScreen({Key? key}) : super(key: key);

  @override
  _PetSitterDetailScreenState createState() => _PetSitterDetailScreenState();
}

class _PetSitterDetailScreenState extends State<PetSitterDetailScreen> {
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
            onPressed: () {
              Navigator.pop(context);
            },
            icon: ImageIcon(
              AssetImage("images/ic_back_btn.png"),
              size: 20,
              color: Colors.white,
            ),
          ),
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
        body: Container(child: SingleChildScrollView(child: Column(

        ))));
  }
}
