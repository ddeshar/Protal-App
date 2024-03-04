class ImageEntity {
  ImageEntity({
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

  ImageEntity.fromJson(dynamic json) {
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

  ImageEntity copyWith({
    String? url,
    num? user,
    String? title,
    num? id,
    String? description,
  }) =>
      ImageEntity(
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
