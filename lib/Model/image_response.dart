
import 'package:protal_app/Model/data_mapper.dart';
import 'package:protal_app/modules/show_image/models/image_entity.dart';

class ImageResponse extends DataMapper<List<ImageEntity>> {
  ImageResponse({
    bool? success,
    num? totalPhotos,
    String? message,
    num? offset,
    num? limit,
    List<Photos>? photos,
  }) {
    _success = success;
    _totalPhotos = totalPhotos;
    _message = message;
    _offset = offset;
    _limit = limit;
    _photos = photos;
  }

  ImageResponse.fromJson(dynamic json) {
    _success = json['success'];
    _totalPhotos = json['total_photos'];
    _message = json['message'];
    _offset = json['offset'];
    _limit = json['limit'];
    if (json['photos'] != null) {
      _photos = [];
      json['photos'].forEach((v) {
        _photos?.add(Photos.fromJson(v));
      });
    }
  }

  bool? _success;
  num? _totalPhotos;
  String? _message;
  num? _offset;
  num? _limit;
  List<Photos>? _photos;

  ImageResponse copyWith({
    bool? success,
    num? totalPhotos,
    String? message,
    num? offset,
    num? limit,
    List<Photos>? photos,
  }) =>
      ImageResponse(
        success: success ?? _success,
        totalPhotos: totalPhotos ?? _totalPhotos,
        message: message ?? _message,
        offset: offset ?? _offset,
        limit: limit ?? _limit,
        photos: photos ?? _photos,
      );

  bool? get success => _success;

  num? get totalPhotos => _totalPhotos;

  String? get message => _message;

  num? get offset => _offset;

  num? get limit => _limit;

  List<Photos>? get photos => _photos;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    map['total_photos'] = _totalPhotos;
    map['message'] = _message;
    map['offset'] = _offset;
    map['limit'] = _limit;
    if (_photos != null) {
      map['photos'] = _photos?.map((v) => v.toJson()).toList();
    }
    return map;
  }

  @override
  List<ImageEntity> mapToEntity() {
    List<ImageEntity> imageEntity = [];
    photos?.forEach((element) {
      final data = ImageEntity(
        url: element.url,
        title: element.title,
        description: element.description,
        id: element.id,
        user: element.user,
      );

      imageEntity.add(data);
    });

    return imageEntity;
  }
}

class Photos {
  Photos({
    String? url,
    num? user,
    String? title,
    num? id,
    String? description,
  }) {
    _url = url;
    _user = user;
    _title = title;
    _id = id;
    _description = description;
  }

  Photos.fromJson(dynamic json) {
    _url = json['url'];
    _user = json['user'];
    _title = json['title'];
    _id = json['id'];
    _description = json['description'];
  }

  String? _url;
  num? _user;
  String? _title;
  num? _id;
  String? _description;

  Photos copyWith({
    String? url,
    num? user,
    String? title,
    num? id,
    String? description,
  }) =>
      Photos(
        url: url ?? _url,
        user: user ?? _user,
        title: title ?? _title,
        id: id ?? _id,
        description: description ?? _description,
      );

  String? get url => _url;

  num? get user => _user;

  String? get title => _title;

  num? get id => _id;

  String? get description => _description;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['url'] = _url;
    map['user'] = _user;
    map['title'] = _title;
    map['id'] = _id;
    map['description'] = _description;
    return map;
  }
}
