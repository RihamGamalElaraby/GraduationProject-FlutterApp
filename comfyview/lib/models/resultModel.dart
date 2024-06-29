class ResultSModel {
  String? image;
  Map<String, dynamic>? result;
  String? location;
  String? time;

  ResultSModel({this.image, this.result, this.location, this.time});

  ResultSModel.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    result = (json['result'] as Map<String, dynamic>).map((key, value) {
      return MapEntry<String, dynamic>(key, value);
    });
    location = json['location'];
    time = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['image'] = image;
    data['result'] = result;
    data['location'] = location;
    data['date'] = time;
    return data;
  }
}
