import 'package:paw_record/generated/json/base/json_convert_content.dart';
import 'package:paw_record/model/banner_data_model_entity.dart';

BannerDataModelEntity $BannerDataModelEntityFromJson(Map<String, dynamic> json) {
	final BannerDataModelEntity bannerDataModelEntity = BannerDataModelEntity();
	final int? currentPage = jsonConvert.convert<int>(json['current_page']);
	if (currentPage != null) {
		bannerDataModelEntity.currentPage = currentPage;
	}
	final List<BannerDataModelData>? data = jsonConvert.convertListNotNull<BannerDataModelData>(json['data']);
	if (data != null) {
		bannerDataModelEntity.data = data;
	}
	final int? total = jsonConvert.convert<int>(json['total']);
	if (total != null) {
		bannerDataModelEntity.total = total;
	}
	final bool? success = jsonConvert.convert<bool>(json['success']);
	if (success != null) {
		bannerDataModelEntity.success = success;
	}
	final String? message = jsonConvert.convert<String>(json['message']);
	if (message != null) {
		bannerDataModelEntity.message = message;
	}
	return bannerDataModelEntity;
}

Map<String, dynamic> $BannerDataModelEntityToJson(BannerDataModelEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['current_page'] = entity.currentPage;
	data['data'] =  entity.data.map((v) => v.toJson()).toList();
	data['total'] = entity.total;
	data['success'] = entity.success;
	data['message'] = entity.message;
	return data;
}

BannerDataModelData $BannerDataModelDataFromJson(Map<String, dynamic> json) {
	final BannerDataModelData bannerDataModelData = BannerDataModelData();
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		bannerDataModelData.id = id;
	}
	final String? title = jsonConvert.convert<String>(json['title']);
	if (title != null) {
		bannerDataModelData.title = title;
	}
	final String? image = jsonConvert.convert<String>(json['image']);
	if (image != null) {
		bannerDataModelData.image = image;
	}
	final String? status = jsonConvert.convert<String>(json['status']);
	if (status != null) {
		bannerDataModelData.status = status;
	}
	final String? createdAt = jsonConvert.convert<String>(json['created_at']);
	if (createdAt != null) {
		bannerDataModelData.createdAt = createdAt;
	}
	final String? updatedAt = jsonConvert.convert<String>(json['updated_at']);
	if (updatedAt != null) {
		bannerDataModelData.updatedAt = updatedAt;
	}
	final BannerDataModelDataImgPath? imgPath = jsonConvert.convert<BannerDataModelDataImgPath>(json['img_path']);
	if (imgPath != null) {
		bannerDataModelData.imgPath = imgPath;
	}
	return bannerDataModelData;
}

Map<String, dynamic> $BannerDataModelDataToJson(BannerDataModelData entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['title'] = entity.title;
	data['image'] = entity.image;
	data['status'] = entity.status;
	data['created_at'] = entity.createdAt;
	data['updated_at'] = entity.updatedAt;
	data['img_path'] = entity.imgPath.toJson();
	return data;
}

BannerDataModelDataImgPath $BannerDataModelDataImgPathFromJson(Map<String, dynamic> json) {
	final BannerDataModelDataImgPath bannerDataModelDataImgPath = BannerDataModelDataImgPath();
	final String? imageUrl = jsonConvert.convert<String>(json['image_url']);
	if (imageUrl != null) {
		bannerDataModelDataImgPath.imageUrl = imageUrl;
	}
	return bannerDataModelDataImgPath;
}

Map<String, dynamic> $BannerDataModelDataImgPathToJson(BannerDataModelDataImgPath entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['image_url'] = entity.imageUrl;
	return data;
}