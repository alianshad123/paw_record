import 'dart:convert';

LoginResponseModel loginResponseModelFromJson(String str) => LoginResponseModel?.fromJson(json.decode(str));

String loginResponseModelToJson(LoginResponseModel data) => json.encode(data.toJson());

class LoginResponseModel {
    LoginResponseModel({
        required this.code,
        required this.type,
        required this.status,
        required this.message,
        required this.data,
    });

    int code;
    String type;
    String status;
    String message;
    Data? data;

    factory LoginResponseModel.fromJson(Map<String, dynamic> json) => LoginResponseModel(
        code: json["code"],
        type: json["type"],
        status: json["status"],
        message: json["message"],
        data: Data?.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "type": type,
        "status": status,
        "message": message,
        "data": data?.toJson(),
    };
}

class Data {
    Data({
        required this.token,
        required this.userDetails,
        required this.sitterDetails,
        required this.ownerDetails,
    });

    String token;
    UserDetails? userDetails;
    List<UserDetails?> sitterDetails;
    List<UserDetails> ownerDetails;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        token: json["token"],
        userDetails: UserDetails?.fromJson(json["user_details"]),
        sitterDetails: List<UserDetails>.from(json["sitter_details"].map((x) => UserDetails.fromJson(x))),
        ownerDetails: List<UserDetails>.from(json["owner_details"].map((x) => UserDetails.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "token": token,
        "user_details": userDetails?.toJson(),
        "sitter_details": List<dynamic>.from(sitterDetails.map((x) => x?.toJson())),
        "owner_details": List<dynamic>.from(ownerDetails.map((x) => x?.toJson())),
    };
}

class UserDetails {
    UserDetails({
        required this.id,
        required this.name,
        required this.email,
        required this.emailVerifiedAt,
        required this.phone,
        required this.image,
        required this.ownerId,
        required this.type,
        required this.status,
        required this.createdAt,
        required this.updatedAt,
    });

    int id;
    String name;
    String email;
    String? emailVerifiedAt;
    String? phone;
    String? image;
    int? ownerId;
    String type;
    String status;
    DateTime createdAt;
    DateTime updatedAt;

    factory UserDetails.fromJson(Map<String, dynamic> json) => UserDetails(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        phone: json["phone"],
        image: json["image"],
        ownerId: json["owner_id"],
        type: json["type"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "phone": phone,
        "image": image,
        "owner_id": ownerId,
        "type": type,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}