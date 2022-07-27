// To parse this JSON data, do
//
//     final taskListDataModel = taskListDataModelFromJson(jsonString);

import 'dart:convert';

TaskListDataModel taskListDataModelFromJson(String str) => TaskListDataModel.fromJson(json.decode(str));

String taskListDataModelToJson(TaskListDataModel data) => json.encode(data.toJson());

class TaskListDataModel {
  TaskListDataModel({
    required this.data,
    required this.success,
    required this.message,
  });

  List<Datum> data;
  bool success;
  String message;

  factory TaskListDataModel.fromJson(Map<String, dynamic> json) => TaskListDataModel(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    success: json["success"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "success": success,
    "message": message,
  };
}

class Datum {
  Datum({
    required this.id,
    required this.petTaskName,
    required this.createdAt,
    required this.updatedAt,
    required this.isCheked,
  });

  int id;
  String petTaskName;
  DateTime createdAt;
  DateTime updatedAt;
  bool isCheked;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    petTaskName: json["pet_task_name"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    isCheked: json["isCheked"]
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "pet_task_name": petTaskName,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "isCheked":false
  };
}





/*
import 'dart:convert';

TaskListDataModel taskListDataModelFromJson(String str) => TaskListDataModel.fromJson(json.decode(str));

String taskListDataModelToJson(TaskListDataModel data) => json.encode(data.toJson());

class TaskListDataModel {
  TaskListDataModel({
    required this.data,
    required this.success,
    required this.message,
  });

  List<Datum> data;
  bool success;
  String message;

  factory TaskListDataModel.fromJson(Map<String, dynamic> json) => TaskListDataModel(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    success: json["success"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "success": success,
    "message": message,
  };
}

class Datum {


  var  id;
  var petTaskName;
  var createdAt;
  var updatedAt;
  var isCheked=false;

  Datum(
      this.id,
      this.petTaskName,
      this.createdAt,
      this.updatedAt,
      this.isCheked
      );

   Datum.fromJson(Map<String, dynamic> json) {
     id:json["id"];
     petTaskName: json["pet_task_name"];
     createdAt: DateTime.parse(json["created_at"]);
     updatedAt: DateTime.parse(json["updated_at"]);
     isCheked: json["isCheked"];
   }


  Map<String, dynamic> toJson() => {
    "id": id,
    "pet_task_name": petTaskName,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "isCheked":isCheked
  };
}*/
