import 'dart:convert';

/// current_page : 1
/// data : [{"id":1,"title":"Added Image","image":"img_","status":"ACTIVE","created_at":"2022-07-05 23:58:55","updated_at":"2022-07-05 23:58:55","img_path":{"image_url":"http://50.16.174.229/storage/upload"}},{"id":2,"title":"Second IMg","image":"img_Second IMg","status":"ACTIVE","created_at":"2022-07-06 00:01:12","updated_at":"2022-07-06 00:01:12","img_path":{"image_url":"http://50.16.174.229/storage/upload"}},{"id":3,"title":"3rd img","image":"img_3rd img","status":"ACTIVE","created_at":"2022-07-06 00:01:43","updated_at":"2022-07-06 00:01:43","img_path":{"image_url":"http://50.16.174.229/storage/upload"}},{"id":4,"title":"4th Image","image":"hostel_img20220706053851.jpeg","status":"ACTIVE","created_at":"2022-07-06 00:08:51","updated_at":"2022-07-06 00:08:51","img_path":{"image_url":"http://50.16.174.229/storage/upload"}},{"id":5,"title":"5th Image","image":null,"status":"ACTIVE","created_at":"2022-07-06 01:49:46","updated_at":"2022-07-06 01:49:46","img_path":{"image_url":"http://50.16.174.229/storage/upload"}},{"id":6,"title":"5th Banner","image":"pet_img20220706072031.jpeg","status":"ACTIVE","created_at":"2022-07-06 01:50:31","updated_at":"2022-07-06 01:50:31","img_path":{"image_url":"http://50.16.174.229/storage/upload"}},{"id":7,"title":"New Banner","image":"banner_img20220706082504.jpeg","status":"ACTIVE","created_at":"2022-07-06 02:55:04","updated_at":"2022-07-06 02:55:04","img_path":{"image_url":"http://50.16.174.229/storage/upload"}}]
/// first_page_url : "http://50.16.174.229/api/listBanner?page=1"
/// from : 1
/// last_page : 1
/// last_page_url : "http://50.16.174.229/api/listBanner?page=1"
/// next_page_url : null
/// path : "http://50.16.174.229/api/listBanner"
/// per_page : 10
/// prev_page_url : null
/// to : 7
/// total : 7
/// success : true
/// message : "Banner listed successfully"
BannerDataModel bannerModelFromJson(String str) => BannerDataModel.fromJson(json.decode(str));

String bannerModelToJson(BannerDataModel data) => json.encode(data.toJson());

class BannerDataModel {
  BannerDataModel({
    int currentPage,
    List<Data> data,
    String firstPageUrl,
    int from,
    int lastPage,
    String lastPageUrl,
    dynamic nextPageUrl,
    String path,
    int perPage,
    dynamic prevPageUrl,
    int to,
    int total,
    bool success,
    String message,
  }) {
    _currentPage = currentPage;
    _data = data;
    _firstPageUrl = firstPageUrl;
    _from = from;
    _lastPage = lastPage;
    _lastPageUrl = lastPageUrl;
    _nextPageUrl = nextPageUrl;
    _path = path;
    _perPage = perPage;
    _prevPageUrl = prevPageUrl;
    _to = to;
    _total = total;
    _success = success;
    _message = message;
  }

  BannerDataModel.fromJson(dynamic json) {
    _currentPage = json['current_page'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data.add(Data.fromJson(v));
      });
    }
    _firstPageUrl = json['first_page_url'];
    _from = json['from'];
    _lastPage = json['last_page'];
    _lastPageUrl = json['last_page_url'];
    _nextPageUrl = json['next_page_url'];
    _path = json['path'];
    _perPage = json['per_page'];
    _prevPageUrl = json['prev_page_url'];
    _to = json['to'];
    _total = json['total'];
    _success = json['success'];
    _message = json['message'];
  }

  int _currentPage;
  List<Data> _data;
  String _firstPageUrl;
  int _from;
  int _lastPage;
  String _lastPageUrl;
  dynamic _nextPageUrl;
  String _path;
  int _perPage;
  dynamic _prevPageUrl;
  int _to;
  int _total;
  bool _success;
  String _message;

  BannerDataModel copyWith({
    int currentPage,
    List<Data> data,
    String firstPageUrl,
    int from,
    int lastPage,
    String lastPageUrl,
    dynamic nextPageUrl,
    String path,
    int perPage,
    dynamic prevPageUrl,
    int to,
    int total,
    bool success,
    String message,
  }) =>
      BannerDataModel(
        currentPage: currentPage ?? _currentPage,
        data: data ?? _data,
        firstPageUrl: firstPageUrl ?? _firstPageUrl,
        from: from ?? _from,
        lastPage: lastPage ?? _lastPage,
        lastPageUrl: lastPageUrl ?? _lastPageUrl,
        nextPageUrl: nextPageUrl ?? _nextPageUrl,
        path: path ?? _path,
        perPage: perPage ?? _perPage,
        prevPageUrl: prevPageUrl ?? _prevPageUrl,
        to: to ?? _to,
        total: total ?? _total,
        success: success ?? _success,
        message: message ?? _message,
      );

  int get currentPage => _currentPage;

  List<Data> get data => _data;

  String get firstPageUrl => _firstPageUrl;

  int get from => _from;

  int get lastPage => _lastPage;

  String get lastPageUrl => _lastPageUrl;

  dynamic get nextPageUrl => _nextPageUrl;

  String get path => _path;

  int get perPage => _perPage;

  dynamic get prevPageUrl => _prevPageUrl;

  int get to => _to;

  int get total => _total;

  bool get success => _success;

  String get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['current_page'] = _currentPage;
    if (_data != null) {
      map['data'] = _data.map((v) => v.toJson()).toList();
    }
    map['first_page_url'] = _firstPageUrl;
    map['from'] = _from;
    map['last_page'] = _lastPage;
    map['last_page_url'] = _lastPageUrl;
    map['next_page_url'] = _nextPageUrl;
    map['path'] = _path;
    map['per_page'] = _perPage;
    map['prev_page_url'] = _prevPageUrl;
    map['to'] = _to;
    map['total'] = _total;
    map['success'] = _success;
    map['message'] = _message;
    return map;
  }
}

/// id : 1
/// title : "Added Image"
/// image : "img_"
/// status : "ACTIVE"
/// created_at : "2022-07-05 23:58:55"
/// updated_at : "2022-07-05 23:58:55"
/// img_path : {"image_url":"http://50.16.174.229/storage/upload"}

class Data {
  Data({
    int id,
    String title,
    String image,
    String status,
    String createdAt,
    String updatedAt,
    ImgPath imgPath,
  }) {
    _id = id;
    _title = title;
    _image = image;
    _status = status;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _imgPath = imgPath;
  }

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _image = json['image'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _imgPath =
        json['img_path'] != null ? ImgPath.fromJson(json['img_path']) : null;
  }

  int _id;
  String _title;
  String _image;
  String _status;
  String _createdAt;
  String _updatedAt;
  ImgPath _imgPath;

  Data copyWith({
    int id,
    String title,
    String image,
    String status,
    String createdAt,
    String updatedAt,
    ImgPath imgPath,
  }) =>
      Data(
        id: id ?? _id,
        title: title ?? _title,
        image: image ?? _image,
        status: status ?? _status,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
        imgPath: imgPath ?? _imgPath,
      );

  int get id => _id;

  String get title => _title;

  String get image => _image;

  String get status => _status;

  String get createdAt => _createdAt;

  String get updatedAt => _updatedAt;

  ImgPath get imgPath => _imgPath;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['image'] = _image;
    map['status'] = _status;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    if (_imgPath != null) {
      map['img_path'] = _imgPath.toJson();
    }
    return map;
  }
}

/// image_url : "http://50.16.174.229/storage/upload"

class ImgPath {
  ImgPath({
    String imageUrl,
  }) {
    _imageUrl = imageUrl;
  }

  ImgPath.fromJson(dynamic json) {
    _imageUrl = json['image_url'];
  }

  String _imageUrl;

  ImgPath copyWith({
    String imageUrl,
  }) =>
      ImgPath(
        imageUrl: imageUrl ?? _imageUrl,
      );

  String get imageUrl => _imageUrl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['image_url'] = _imageUrl;
    return map;
  }
}
