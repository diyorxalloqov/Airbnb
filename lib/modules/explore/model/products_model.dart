class ProductsModel {
  int? id;
  String? region;
  String? name;
  String? description;
  int? price;
  String? priceCurrency;
  bool? status;
  Category? category;
  List<Amenits>? amenits;
  List<String>? images;

  ProductsModel(
      {this.id,
      this.region,
      this.name,
      this.description,
      this.price,
      this.priceCurrency,
      this.status,
      this.category,
      this.amenits,
      this.images});

  ProductsModel.fromJson(Map<String, dynamic> json) {
  id = json['id'];
  region = json['region'];
  name = json['name'];
  description = json['description'];
  price = json['price'];
  priceCurrency = json['price_currency'];
  status = json['status'];
  category = json['category'] != null ? Category.fromJson(json['category']) : null;
  if (json['amenits'] != null) {
    amenits = <Amenits>[];
    json['amenits'].forEach((v) {
      amenits!.add(Amenits.fromJson(v));
    });
  }
  // Check if images is null before casting
  if (json['images'] != null) {
    images = json['images'].cast<String>();
  } else {
    images = <String>[]; // or null, depending on your requirement
  }
}


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['region'] = region;
    data['name'] = name;
    data['description'] = description;
    data['price'] = price;
    data['price_currency'] = priceCurrency;
    data['status'] = status;
    if (category != null) {
      data['category'] = category!.toJson();
    }
    if (amenits != null) {
      data['amenits'] = amenits!.map((v) => v.toJson()).toList();
    }
    data['images'] = images;
    return data;
  }
}

class Category {
  int? id;
  String? title;
  String? description;

  Category({this.id, this.title, this.description});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    return data;
  }
}
class Amenits {
  int? id;
  String? name;
  Condition? condition;

  Amenits({this.id, this.name, this.condition});

  Amenits.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    condition = json['condition'] != null
        ? Condition.fromJson(json['condition'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    if (condition != null) {
      data['condition'] = condition!.toJson();
    }
    return data;
  }
}

class Condition {
  int? id;
  String? title;
  int? amenity;

  Condition({this.id, this.title, this.amenity});

  Condition.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    amenity = json['amenity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['amenity'] = amenity;
    return data;
  }
}
