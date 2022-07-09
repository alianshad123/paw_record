import 'dart:convert';

DogActivityDataModel dogActivityDataModelFromJson(String str) => DogActivityDataModel.fromJson(json.decode(str));

String dogActivityDataModelToJson(DogActivityDataModel data) => json.encode(data.toJson());

class DogActivityDataModel {
  String? imageurl;
  String? name;
  String? time;
  String? actvty;

  DogActivityDataModel({this.imageurl, this.name, this.time, this.actvty});

  DogActivityDataModel.fromJson(Map<String, dynamic> json) {
    imageurl = json['imageurl'];
    name = json['name'];
    time = json['time'];
    actvty = json['actvty'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imageurl'] = this.imageurl;
    data['name'] = this.name;
    data['time'] = this.time;
    data['actvty'] = this.actvty;
    return data;
  }
}