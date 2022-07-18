// To parse this JSON data, do
//
//     final bannerDataModel = bannerDataModelFromJson(jsonString);

import 'dart:convert';

BannerDataModel bannerDataModelFromJson(String str) => BannerDataModel.fromJson(json.decode(str));

String bannerDataModelToJson(BannerDataModel data) => json.encode(data.toJson());

class BannerDataModel {
  BannerDataModel({
    required this.data,
    required this.imgPath,
    required this.success,
    required this.message,
  });

  List<Datum> data;
  String imgPath;
  bool success;
  String message;

  factory BannerDataModel.fromJson(Map<String, dynamic> json) => BannerDataModel(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
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

class Datum {
  Datum({
    required this.id,
    required this.title,
    required this.image,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String title;
  String image;
  String status;
  DateTime createdAt;
  DateTime updatedAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    title: json["title"],
    image: json["image"],
    status: json["status"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "image": image,
    "status": status,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
