import 'dart:convert';

RemainderDataModel remainderDataModelFromJson(String str) => RemainderDataModel.fromJson(json.decode(str));

String remainderDataModelToJson(RemainderDataModel data) => json.encode(data.toJson());

class RemainderDataModel {
  var message;
  var date_;

  RemainderDataModel(this.message, this.date_);

  RemainderDataModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    date_ = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['date'] = this.date_;

    return data;
  }

}