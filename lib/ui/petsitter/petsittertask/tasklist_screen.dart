import 'dart:convert';
import 'dart:developer';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_logs/flutter_logs.dart';
import 'package:paw_record/api/ApiConstants.dart';
import 'package:paw_record/model/TaskDataModel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class TaskListScreen extends StatefulWidget {
  var petId;

  TaskListScreen(this.petId,{Key? key}) : super(key: key);

  @override
  _TaskListScreenState createState() => _TaskListScreenState();
}
class _TaskListScreenState extends State<TaskListScreen> {

  late Future<List<Datum>?> tasklist;
  late List<Datum> taskListData;
  late int petId;

  @override
  void initState() {
    super.initState();
    petId = widget.petId;
    tasklist= getTaskList(petId,context);



  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Tasks",
            style: TextStyle(
              color: Colors.black,
            )),
        brightness: Brightness.light,
        backgroundColor: const Color(0xFFF9F8FA),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              size: 20,
              color: Colors.black,
            )),
      
      ),
      resizeToAvoidBottomInset: false, // set i
    body: SingleChildScrollView(
        child: Container(
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
                    Container(
                      margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            child: const Text(
                              'Submit',
                              style: TextStyle(fontSize: 18,
                                  color: Colors.white),
                            ),
                            style: ButtonStyle(
                                padding: MaterialStateProperty.all<
                                    EdgeInsets>(
                                    EdgeInsets.fromLTRB(
                                        50, 10, 50, 10)),
                                backgroundColor: MaterialStateProperty
                                    .all<Color>(
                                    Color(0xFF8017DA)),
                                shape:
                                MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius
                                            .circular(20.0),
                                        side: BorderSide(
                                            color: const Color(
                                                0xFF8017DA))))),
                            onPressed: () {



                              taskListData.forEach((element) {
                                if(element.status==0 ? false:true){
                                  updateTask(petId,element.id,"1",context);

                                }
                              });



                            },
                          )),
                    ),



                  ],
                ),
                SizedBox(height: 10),
              ],
            ))
    
    
    ));
  }

  Widget createTaskListView(List<Datum>? taskList)=>ListView.builder(
      shrinkWrap: true,
      physics: ScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemCount: taskList?.length,
      itemBuilder: (context, index) {
        return  StatefulBuilder(
        builder: (BuildContext context, StateSetter setState)
        {
       return Container(
         margin: EdgeInsets.only(bottom: 5.0),
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
        }
        );
      }
  );

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


  Future<List<Datum>?> getTaskList(int petId,BuildContext context) async {
    var data = jsonEncode({'pet_id': petId});
    var prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token");

    var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.listtask);
    var response = await http.post(url, body: data, headers: {
      "Accept": "application/json",
      "content-type": "application/json",
      "Authorization": "Bearer $token"

    });
    if (response.statusCode == 200) {
      TaskListDataModel _model = taskListDataModelFromJson(response.body);
      FlutterLogs.logInfo("JsonDataResponse","PawJson", response.body);
      return _model.data.where ((element) =>
        element.status==0).toList();
    } else {}
  }
  
  
}

void updateTask(int petId, int taskId, String status, BuildContext context ) async {

  var data = jsonEncode({'pet_id': petId,'task_id': taskId, 'status': status});
  var prefs = await SharedPreferences.getInstance();
  var token = prefs.getString("token");
  var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.update_pet_task);
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
              content: const Text('Tasks updated successfully'),
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
      Navigator.pop(context);
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


