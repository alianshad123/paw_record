import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:paw_record/api/ApiConstants.dart';
import 'package:paw_record/model/DogsDataResponseModel.dart';
import 'package:paw_record/ui/chat/chat_screen.dart';
import 'package:paw_record/ui/petsitter/petsittertask/tasklist_screen.dart';
import 'package:paw_record/ui/utils/DatabaseMethods.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PetSitterDetailScreen extends StatelessWidget {
  final DogsData dogsData;

  PetSitterDetailScreen(this.dogsData, {Key? key}) : super(key: key);

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
        ),
        extendBodyBehindAppBar: true,
        body: Container(
            child: SingleChildScrollView(
                child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 420,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              '${ApiConstants.IMAGEURL}${"/"}${dogsData?.petPic}'),
                          fit: BoxFit.fill)),
                ),
                Positioned(
                    top: 370,
                    right: 10,
                    child: Container(
                        child: GestureDetector(
                            onTap: () async {

                              var prefs = await SharedPreferences.getInstance();
                              var sitterEmail = prefs.getString("USEREMAIL");
                              var useremail =dogsData.ownerEmail;



                              List<String> users = [
                                useremail,
                                sitterEmail ?? ""
                              ];
                              String chatRoomId = getSitterChatRoomId(useremail,sitterEmail);

                              Map<String, dynamic> chatRoomMap = {
                                "users": users,
                                "chatroomId": chatRoomId
                              };
                              DatabaseMethods()
                                  .createChatRoom(chatRoomId, chatRoomMap);

                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ChatScreen(chatRoomId: chatRoomId)));
                            },
                            child: Wrap(children: [
                              Card(
                                  elevation: 10,
                                  child: Container(
                                      height: 40,
                                      padding: EdgeInsets.all(5),
                                      child: Row(
                                        children: [
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
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Align(
                                            alignment: Alignment.centerRight,
                                            child: Container(
                                              alignment: Alignment.centerRight,
                                              child: Icon(
                                                Icons.message,
                                                size: 20,
                                                color: Colors.grey,
                                              ),
                                            ),
                                          )
                                        ],
                                      )))
                            ]))))
              ],
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Container(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(15, 50, 15, 0),
                      alignment: Alignment.topLeft,
                      child: Text(
                        dogsData.petName,
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
                    Container(
                      padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('DOB',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Color(0xFF999696),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500)),
                              Text(dogsData.petDob,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500))
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('SIZE',
                                  style: TextStyle(
                                      color: Color(0xFF999696),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500)),
                              Text(dogsData.petSize,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500))
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('SEX',
                                  style: TextStyle(
                                      color: Color(0xFF999696),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500)),
                              Text(dogsData.petGender ?? "",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500))
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text('LOCATION',
                                style: TextStyle(
                                    color: Color(0xFF999696),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500)),
                          ),
                          Align(
                              alignment: Alignment.topLeft,
                              child: Text(dogsData.petAddress,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500)))
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text('SERVICE TYPE',
                                style: TextStyle(
                                    color: Color(0xFF999696),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500)),
                          ),
                          Align(
                              alignment: Alignment.topLeft,
                              child: Text('Dog Walking',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500)))
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            child: const Text(
                              'Go to Tasks',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
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
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        TaskListScreen(dogsData.petId)),
                              );
                            },
                          )),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 15,
            )
          ],
        ))));
  }
}

String getSitterChatRoomId(userEmail, sitterEmail) {
    String uEmail = userEmail.substring(0, userEmail.indexOf('@'));
    String sEmail = sitterEmail.substring(0, userEmail.indexOf('@'));
    return uEmail+sEmail;

  }

