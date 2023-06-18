class ProductModel {
  ProductModel({
      this.id, 
      this.name, 
      this.category, 
      this.price, 
      this.imageUrl,});

  ProductModel.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    category = json['category'];
    price = json['price'];
    imageUrl = json['image_url'];
  }
  num? id;
  String? name;
  String? category;
  num? price;
  String? imageUrl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['category'] = category;
    map['price'] = price;
    map['image_url'] = imageUrl;
    return map;
  }

}