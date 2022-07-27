// To parse this JSON data, do
//
//     final dogsDataResponseModel = dogsDataResponseModelFromJson(jsonString);

import 'dart:convert';

DogsDataResponseModel dogsDataResponseModelFromJson(String str) => DogsDataResponseModel.fromJson(json.decode(str));

String dogsDataResponseModelToJson(DogsDataResponseModel data) => json.encode(data.toJson());

class DogsDataResponseModel {
  DogsDataResponseModel({
    required this.data,
    required this.imgPath,
    required this.success,
    required this.message,
  });

  List<DogsData> data;
  String imgPath;
  bool success;
  String message;

  factory DogsDataResponseModel.fromJson(Map<String, dynamic> json) => DogsDataResponseModel(
    data: List<DogsData>.from(json["data"].map((x) => DogsData.fromJson(x))),
    imgPath: json["img_path"],
    success: json["success"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "img_path": imgPath,
    "success": success,
    "message": message,
  };
}

class DogsData {
  DogsData({
    required this.petId,
    required this.petUsId,
    required this.petName,
    required this.petSpecies,
    required this.petBreed,
    required this.petSize,
    required this.petGender,
    required this.petDob,
    required this.petAddress,
    required this.petNeutred,
    required this.petVaccinated,
    required this.petReminder,
    required this.petPic,
    required this.createdAt,
    required this.updatedAt,
  });

  int petId;
  int petUsId;
  String petName;
  String petSpecies;
  String petBreed;
  String petSize;
  String? petGender;
  String petDob;
  String petAddress;
  String petNeutred;
  String petVaccinated;
  String petReminder;
  String petPic;
  DateTime createdAt;
  DateTime updatedAt;

  factory DogsData.fromJson(Map<String, dynamic> json) => DogsData(
    petId: json["pet_id"],
    petUsId: json["pet_us_id"],
    petName: json["pet_name"],
    petSpecies: json["pet_species"],
    petBreed: json["pet_breed"],
    petSize: json["pet_size"],
    petGender: json["pet_gender"],
    petDob: json["pet_dob"],
    petAddress: json["pet_address"],
    petNeutred: json["pet_neutred"],
    petVaccinated: json["pet_vaccinated"],
    petReminder: json["pet_reminder"],
    petPic: json["pet_pic"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "pet_id": petId,
    "pet_us_id": petUsId,
    "pet_name": petName,
    "pet_species": petSpecies,
    "pet_breed": petBreed,
    "pet_size": petSize,
    "pet_gender": petGender,
    "pet_dob": petDob,
    "pet_address": petAddress,
    "pet_neutred": petNeutred,
    "pet_vaccinated": petVaccinated,
    "pet_reminder": petReminder,
    "pet_pic": petPic,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
