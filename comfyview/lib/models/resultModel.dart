class ResultSModel {
  String? image;
  Map<String, dynamic>? result;

  ResultSModel({this.image, this.result});

  ResultSModel.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    result = (json['result'] as Map<String, dynamic>).map((key, value) {
      return MapEntry<String, dynamic>(key, value);
    });
  }
}
