class UserModel {
  var name;
  var email;
  var password;
  var gloveid;

  UserModel({this.email, this.gloveid, this.name, this.password});

  UserModel.fromJson(Map json) {
    name = json['name'];
    email = json['email'];
    password = json['password'];
    gloveid = json['glove_id'];
  }
}
