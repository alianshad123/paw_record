import 'dart:convert';

DogsDataResponseModel dogsDataResponseModelFromJson(String str) => DogsDataResponseModel.fromJson(json.decode(str));

String dogsDataResponseModelToJson(DogsDataResponseModel data) => json.encode(data.toJson());

class DogsDataResponseModel {
  List<DogsData>? dogsData;

  DogsDataResponseModel({this.dogsData});

  DogsDataResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['dogsData'] != null) {
      dogsData = <DogsData>[];
      json['dogsData'].forEach((v) {
        dogsData!.add(new DogsData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.dogsData != null) {
      data['dogsData'] = this.dogsData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

DogsData dogsDataFromJson(String str) => DogsData.fromJson(json.decode(str));

String dogsDataToJson(DogsData data) => json.encode(data.toJson());

class DogsData {
  String? imageurl;
  String? name;
  String? time;
  String? actvty;

  DogsData({this.imageurl, this.name, this.time, this.actvty});

  DogsData.fromJson(Map<String, dynamic> json) {
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