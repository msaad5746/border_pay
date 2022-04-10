class LocationModel {
  int id;
  String title;

  LocationModel({this.id = -1, this.title = ''});

  factory LocationModel.fromJson(dynamic json) {
    return LocationModel(
      id: json['id'],
      title: json['title'],
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    return map;
  }
}
