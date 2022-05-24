// To parse this JSON data, do
//
//     final loginResponseModel = loginResponseModelFromJson(jsonString);

import 'dart:convert';

LoginResponseModel loginResponseModelFromJson(String str) => LoginResponseModel.fromJson(json.decode(str));

String loginResponseModelToJson(LoginResponseModel data) => json.encode(data.toJson());

class LoginResponseModel {
    LoginResponseModel({
        required this.id,
        required this.code,
        required this.message,
        required this.data,
    });

    String id;
    int code;
    String message;
    Data data;

    factory LoginResponseModel.fromJson(Map<String, dynamic> json) => LoginResponseModel(
        id: json["\u0024id"],
        code: json["code"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "\u0024id": id,
        "code": code,
        "message": message,
        "data": data.toJson(),
    };
}

class Data {
    Data({
        required this.id,
        required this.dataId,
        required this.name,
        required this.email,
        required this.token,
    });

    String id;
    int dataId;
    String name;
    String email;
    String token;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["\u0024id"],
        dataId: json["Id"],
        name: json["Name"],
        email: json["Email"],
        token: json["Token"],
    );

    Map<String, dynamic> toJson() => {
        "\u0024id": id,
        "Id": dataId,
        "Name": name,
        "Email": email,
        "Token": token,
    };
}
