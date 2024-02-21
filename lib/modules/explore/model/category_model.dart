class CategoryModel {
  int? id;
  String? title;
  String? description;
  String? image;
  bool? status;

  CategoryModel(
      {this.id, this.title, this.description, this.image, this.status});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    image = json['image'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['image'] = image;
    data['status'] = status;
    return data;
  }
}
