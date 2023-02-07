class CategoryModel {
  String id;
  final String name;
  final bool isActive;
  final String image;
  DateTime? createdOn;
  DateTime? updatedOn;

  CategoryModel(
      {required this.id,
      required this.name,
      required this.isActive,
      required this.image,
      required this.createdOn,
      required this.updatedOn});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'is_active': isActive,
      'image': image,
      'created_on': createdOn,
      'updated_on': updatedOn,
    };
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      id: map['id'] as String? ?? "",
      name: map['name'] as String,
      isActive: map['is_active'] as bool,
      image: map['image'] as String,
      createdOn: map['created_on'].toDate(),
      updatedOn: map['updated_on'].toDate(),
    );
  }
}
