class StudentModel {
  String? id;
  String? name;
  String? department;
  String? phone;

  StudentModel({this.id, this.name, this.phone, this.department});

  StudentModel.fromJson(Map map) {
    id = map['id'];
    name = map['name'];
    department = map['department'];
    phone = map['phone'];
  }

  Map<String,dynamic> toJson() {
    Map<String,dynamic> map = {
      "id": id,
      "name": name,
      "department": department,
      "phone": phone,
    };
    return map;
  }
}
