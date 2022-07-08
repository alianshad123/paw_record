import 'dart:convert';
import 'package:paw_record/generated/json/base/json_field.dart';
import 'package:paw_record/generated/json/banner_data_model_entity.g.dart';


@JsonSerializable()
class BannerDataModelEntity {

	@JSONField(name: "current_page")
	late int currentPage;
	late List<BannerDataModelData> data;
	late int total;
	late bool success;
	late String message;
  
  BannerDataModelEntity();

  factory BannerDataModelEntity.fromJson(Map<String, dynamic> json) => $BannerDataModelEntityFromJson(json);

  Map<String, dynamic> toJson() => $BannerDataModelEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class BannerDataModelData {

	late int id;
	late String title;
	late String image;
	late String status;
	@JSONField(name: "created_at")
	late String createdAt;
	@JSONField(name: "updated_at")
	late String updatedAt;
	@JSONField(name: "img_path")
	late BannerDataModelDataImgPath imgPath;
  
  BannerDataModelData();

  factory BannerDataModelData.fromJson(Map<String, dynamic> json) => $BannerDataModelDataFromJson(json);

  Map<String, dynamic> toJson() => $BannerDataModelDataToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class BannerDataModelDataImgPath {

	@JSONField(name: "image_url")
	late String imageUrl;
  
  BannerDataModelDataImgPath();

  factory BannerDataModelDataImgPath.fromJson(Map<String, dynamic> json) => $BannerDataModelDataImgPathFromJson(json);

  Map<String, dynamic> toJson() => $BannerDataModelDataImgPathToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}