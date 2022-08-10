import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_logs/flutter_logs.dart';
import 'package:paw_record/api/ApiConstants.dart';
import 'package:paw_record/model/DogsDataResponseModel.dart';
import 'package:paw_record/model/OwnerTaskList.dart';

import 'package:paw_record/ui/chat/chat_screen.dart';
import 'package:paw_record/ui/petsitter/petsittertask/tasklist_screen.dart';
import 'package:paw_record/ui/signin/signin_screen.dart';
import 'package:paw_record/ui/utils/Constants.dart';
import 'package:paw_record/ui/utils/DatabaseMethods.dart';
import 'package:paw_record/ui/utils/HelperFunctions.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class PetDetailsScreen extends StatefulWidget {
  final DogsData dogsData;

  PetDetailsScreen(this.dogsData, {Key? key}) : super(key: key);

  @override
  _PetDetailsScreenState createState() => _PetDetailsScreenState();
}

class _PetDetailsScreenState extends State<PetDetailsScreen> {
  final List<Datum> taskData = <Datum>[];
  final _textFieldController = TextEditingController();
  DatabaseMethods databaseMethods = DatabaseMethods();

  String? userName;
  String? userType;


  //late Stream tokenStream;
  List<String> tokens = [];

  late QuerySnapshot snapshot;
  late Future<List<Datum>?> tasklist;
  late List<Datum> taskListData;
  late int petId;

  @override
  void initState() {
    super.initState();

    databaseMethods.getTokens("tokenData").then((value) {
      snapshot = value;
      snapshot?.docs.forEach((element) {
        tokens.add(element["token"]);
      });
    });
    petId=widget.dogsData.petId;
    tasklist= getTaskList(petId,context);

    getUserName().then((value) {
      setState(() {
        userName = value;
      });
    });
    getUserType().then((value) {
      setState(() {
        userType = value;
      });
    });
  }

  Future<String> getUserName() async {
    var prefs = await SharedPreferences.getInstance();
    var userName = prefs.getString("USER_NAME")!;
    return userName;
  }

  Future<String> getUserType() async {
    var prefs = await SharedPreferences.getInstance();
    var userType = prefs.getString("user_type")!;
    return userType;
  }

  Future<List<Datum>?> getTaskList(int petId,BuildContext context) async {
    var data = jsonEncode({'pet_id': petId});
    var prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token");

    var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.listownertask);
    var response = await http.post(url, body: data, headers: {
      "Accept": "application/json",
      "content-type": "application/json",
      "Authorization": "Bearer $token"

    });
    if (response.statusCode == 200) {
      OwnerTaskList _model = ownerTaskListFromJson(response.body);
      FlutterLogs.logInfo("JsonDataResponse","PawJson", response.body);
      return _model.data;
    } else {}
  }

  void addItemToList() {
    setState(() async {
      /*taskData.add(Datum(
          id: 0,
          petTaskName: _textFieldController.text,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
          status: 0));*/
      addTask(_textFieldController.text, widget.dogsData.petId, context,widget.dogsData);

      var seen = Set<String>();
      List<String> uniqueTokens =
          tokens.where((token_) => seen.add(token_)).toList();
      var prefs = await SharedPreferences.getInstance();
      var sitterEmail = prefs.getString("sitter_email");
      sendTaskNotification(_textFieldController.text, widget.dogsData.petId,
          uniqueTokens,sitterEmail ?? "", context);
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
                              '${ApiConstants.IMAGEURL}${"/"}${widget.dogsData?.petPic}'),
                          fit: BoxFit.fill)),
                ),
                Positioned(
                    top: 370,
                    right: 10,
                    child: Container(
                      child: GestureDetector(
                          onTap: () async {
                            /*var prefs = await SharedPreferences.getInstance();
                            var userEmail = prefs.getString("USEREMAIL");
                            var sitterEmail = prefs.getString("sitter_email");
                            var userType = prefs.getString("user_type");
                            if(userType=="OWNER") {

                            }else{

                            }*/


                            var prefs = await SharedPreferences.getInstance();
                            var userEmail = prefs.getString("USEREMAIL");
                            var sitterEmail = prefs.getString("sitter_email");


                            List<String> users = [
                              userEmail ?? "",
                              sitterEmail ?? ""
                            ];
                            String chatRoomId = getChatRoomId(userEmail,sitterEmail);

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
                          child: Wrap(
                            children: [
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
                                                userName??"",
                                                style: TextStyle(
                                                    decoration:
                                                        TextDecoration.none,
                                                    color: Color(0xFF8017DA),
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontSize: 12),
                                              ),
                                              Text(
                                                userType??"",
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
                                      ))),
                            ],
                          )),
                    ))
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
                        widget.dogsData.petName,
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
                              Text(widget.dogsData.petDob,
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
                              Text(widget.dogsData.petSize,
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
                              Text(widget.dogsData.petGender ?? "Male",
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
                              child: Text(widget.dogsData.petAddress,
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

                   /* SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                      alignment: Alignment.topLeft,
                      child: Text(
                        "personal to-do's",
                        style: TextStyle(
                            decoration: TextDecoration.none,
                            color: Color(0xFF070707),
                            fontWeight: FontWeight.bold,
                            fontSize: 22),
                      ),
                    ),*/

                    Container(
                        margin: const EdgeInsets.only(left: 15.0,top: 0.0,right: 15.0,bottom:0.0),
                        child: Column(
                          children: [
                            SizedBox(height: 10),
                            Column(
                              children: [


                                FutureBuilder<List<Datum>?>(
                                  future: tasklist,
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      taskListData =  snapshot.data!;
                                      return  createTaskListView(snapshot.data);


                                    } else if (snapshot.hasError) {
                                      return Text('${snapshot.error}');
                                    }

                                    // By default, show a loading spinner.
                                    return const CircularProgressIndicator();
                                  },
                                ),
                                SizedBox(height: 10),

                              ],
                            ),
                            SizedBox(height: 10),
                          ],
                        )),
                    Container(
                      margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            child: const Text(
                              'Add Tasks',
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
                              _displayTextInputDialog(context);
                            },
                          )),
                    ),
                   /* ListView.builder(
                        key: UniqueKey(),
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemCount: taskData?.length,
                        itemBuilder: (context, index) {
                          return TaskView(taskData![index]);
                        }),*/
                    SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 15,
            )
          ],
        ))));
  }

  Future<void> _displayTextInputDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add Task'),
          content: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
            TextField(
              controller: _textFieldController,
              decoration: InputDecoration(hintText: "Message"),
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
}

String getChatRoomId(userEmail, sitterEmail) {
  String uEmail = userEmail.substring(0, userEmail.indexOf('@'));
  String sEmail = sitterEmail.substring(0, userEmail.indexOf('@'));
  return uEmail+sEmail;

}

Future<void> sendTaskNotification (
    String task, int petId, List<String> tokens, String sitterEmail,BuildContext context) async {
  var data = jsonEncode({
    "registration_ids": tokens,
    "notification": {
      "body": sitterEmail,
      "title": "New task assigned: "+task,
      "message": task,
      "android_channel_id": "high_importance_channel",
      "titleLocKey": sitterEmail,
    },

  });
  var url = Uri.parse(ApiConstants.firebaseUrl);
  var response = await http.post(url, body: data, headers: {
    "Accept": "application/json",
    "content-type": "application/json",
    "Authorization": Constants.firebaseServerKey
  });
  if (response.statusCode == 200) {
    FlutterLogs.logInfo("JsonDataResponse", "PawJson", response.body);
  } else {
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

Future<void> addTask(String task, int petId, BuildContext context, DogsData dogsData) async {
  var data = jsonEncode({
    'task_name': task,
    'pet_id': petId,
  });
  var prefs = await SharedPreferences.getInstance();
  var token = prefs.getString("token");
  var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.add_task);
  var response = await http.post(url, body: data, headers: {
    "Accept": "application/json",
    "content-type": "application/json",
    "Authorization": "Bearer $token"
  });
  if (response.statusCode == 200) {

    FlutterLogs.logInfo("JsonDataResponse", "PawJson", response.body);
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Message'),
        content: const Text('Tasks added successfully'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pop(context, 'OK');
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) =>  PetDetailsScreen(dogsData)),
              );
            },
            child: const Text('OK'),
          ),
        ],
      ),
    ).then((value) {
      // Navigator.pop(context);
    });

  } else {
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


Widget createTaskListView(List<Datum>? taskList) => ListView.builder(
    shrinkWrap: true,
    physics: ScrollPhysics(),
    scrollDirection: Axis.vertical,
    itemCount: taskList?.length,
    itemBuilder: (context, index) {
      return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
        return Container(
          margin: EdgeInsets.only(bottom: 5.0),
          decoration:
              BoxDecoration(border: Border.all(color: Colors.deepPurple)),
          child: CheckboxListTile(
            title: Text(taskList![index].petTaskName ?? ""),
            value: taskList[index].status == 0 ? false : true,
            onChanged: (value) {
              /*setState(() {
                taskList[index].status = value == false ? 0 : 1;
              });*/
            },
          ),
        );
      });
    });

class TaskView extends StatelessWidget {
  Datum taskData;

  TaskView(this.taskData);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
      return Container(
        margin: EdgeInsets.only(bottom: 5.0),
        decoration: BoxDecoration(border: Border.all(color: Colors.deepPurple)),
        child: CheckboxListTile(
          title: Text(taskData.petTaskName ?? ""),
          value: taskData.status == 0 ? false : true,
          onChanged: (value) {
           /* setState(() {
              taskData.status = value == false ? 0 : 1;
            });*/
          },
        ),
      );
    });
  }
}
