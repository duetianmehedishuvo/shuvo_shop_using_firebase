class UserModel {
  String? id;
  String? name;
  String? email;
  String? phone;

  UserModel(this.id, this.name, this.phone, this.email);

  UserModel.fromJson(Map map) {
    id = map['id'];
    name = map['name'];
    email = map['email'];
    phone = map['phone'];
  }

  Map<String,dynamic> toJson() {
    Map<String,dynamic> map = {
      "id": id,
      "name": name,
      "email": email,
      "phone": phone,
    };
    return map;
  }
}
