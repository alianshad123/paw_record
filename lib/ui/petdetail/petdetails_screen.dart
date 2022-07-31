import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_logs/flutter_logs.dart';
import 'package:paw_record/api/ApiConstants.dart';
import 'package:paw_record/model/DogsDataResponseModel.dart';
import 'package:paw_record/model/TaskDataModel.dart';
import 'package:paw_record/model/TaskDataModel.dart';
import 'package:paw_record/ui/chat/chat_screen.dart';
import 'package:paw_record/ui/petsitter/petsittertask/tasklist_screen.dart';
import 'package:paw_record/ui/signin/signin_screen.dart';
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

  @override
  void initState() {
    super.initState();

  }

  void addItemToList() {
    setState(() {
      taskData.add(Datum(id:0,petTaskName: _textFieldController.text,createdAt:DateTime.now(),updatedAt: DateTime.now(),status:0));

      addTask(_textFieldController.text,widget.dogsData.petId,context);
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
              onPressed: () {


              },
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
                          onTap: () => Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) => const ChatScreen())),
                          child: Card(
                              elevation: 10,
                              child: Container(
                                  height: 40,
                                  width: 150,
                                  padding: EdgeInsets.all(5),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 30,
                                        height: 30,
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
                                                decoration: TextDecoration.none,
                                                color: Color(0xFF8017DA),
                                                fontWeight: FontWeight.normal,
                                                fontSize: 12),
                                          ),
                                          Text(
                                            'Pet owner',
                                            style: TextStyle(
                                                decoration: TextDecoration.none,
                                                fontWeight: FontWeight.normal,
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
                        ),




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
                    SizedBox(
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
                    ),

                    ListView.builder(
                          key: UniqueKey(),
                          shrinkWrap: true,
                          physics: ScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemCount: taskData?.length,
                          itemBuilder: (context, index) {
                            return TaskView(taskData![index]);
                          }
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

Future<void> addTask(String task,int petId,BuildContext context) async {

  var data = jsonEncode({'task_name': task,'pet_id': petId,});
  var prefs = await SharedPreferences.getInstance();
  var token = prefs.getString("token");
  var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.add_task);
  var response = await http.post(url, body: data, headers: {
    "Accept": "application/json",
    "content-type": "application/json",
    "Authorization": "Bearer $token"
  });
  if (response.statusCode == 200) {

    FlutterLogs.logInfo("JsonDataResponse","PawJson", response.body);
    showDialog<String>(
      context: context,
      builder: (BuildContext context) =>
          AlertDialog(
            title: const Text('Message'),
            content: const Text('Tasks added successfully'),
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
     // Navigator.pop(context);
    });

  }else{
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
          decoration: BoxDecoration(border: Border.all(color: Colors.deepPurple)),
          child: CheckboxListTile(
            title: Text(taskList![index].petTaskName ?? ""),
            value: taskList[index].status==0 ? false:true,
            onChanged: (value) {
              setState(() {
                taskList[index].status = value==false ? 0:1;
              });
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
    return  StatefulBuilder(
        builder: (BuildContext context, StateSetter setState)
        {
          return Container(
            margin: EdgeInsets.only(bottom: 5.0),
            decoration: BoxDecoration(border: Border.all(color: Colors.deepPurple)),
            child: CheckboxListTile(
              title: Text(taskData.petTaskName ?? ""),
              value: taskData.status==0 ? false:true,
              onChanged: (value) {
                setState(() {
                  taskData.status = value==false ? 0:1;
                });
              },
            ),
          );
        }
    );
  }
}