// To parse this JSON data, do
//
//     final ownerTaskList = ownerTaskListFromJson(jsonString);

import 'dart:convert';

OwnerTaskList ownerTaskListFromJson(String str) => OwnerTaskList.fromJson(json.decode(str));

String ownerTaskListToJson(OwnerTaskList data) => json.encode(data.toJson());

class OwnerTaskList {
  OwnerTaskList({
    required this.data,
    required this.success,
    required this.message,
  });

  List<Datum> data;
  bool success;
  String message;

  factory OwnerTaskList.fromJson(Map<String, dynamic> json) => OwnerTaskList(
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
    required this.petId,
    required this.ownerId,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String petTaskName;
  int petId;
  int ownerId;
  int status;
  DateTime createdAt;
  DateTime updatedAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    petTaskName: json["pet_task_name"],
    petId: json["pet_id"],
    ownerId: json["owner_id"],
    status: json["status"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "pet_task_name": petTaskName,
    "pet_id": petId,
    "owner_id": ownerId,
    "status": status,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
