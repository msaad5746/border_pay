class NationalityModel {
  final int id;
  final String flag;
  final String iso;
  final String name;
  final String nicename;
  final String iso3;
  final String numcode;
  final String phonecode;

  NationalityModel({
    this.id = 1,
    this.flag = '',
    this.iso = '',
    this.name = '',
    this.nicename = '',
    this.iso3 = '',
    this.numcode = '',
    this.phonecode = '',
  });

  factory NationalityModel.fromJson(dynamic json) {
    if (json != null) {
      return NationalityModel(
        id: json['id'] ?? 1,
        flag: json['flag'] ?? '',
        iso: json['iso'] ?? '',
        name: json['name'] ?? '',
        nicename: json['nicename'] ?? '',
        iso3: json['iso3'] ?? '',
        numcode: json['numcode'] ?? '',
        phonecode: json['phonecode'] ?? '',
      );
    } else {
      return NationalityModel();
    }
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['flag'] = flag;
    map['iso'] = iso;
    map['name'] = name;
    map['nicename'] = nicename;
    map['iso3'] = iso3;
    map['numcode'] = numcode;
    map['phonecode'] = phonecode;
    return map;
  }
}
