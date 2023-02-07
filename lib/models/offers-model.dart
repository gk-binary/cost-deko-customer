class OffersModel {
  String id;
  final String name;
  final bool isActive;
  final String image;
  final String description;
  DateTime? createdOn;
  DateTime? updatedOn;

  OffersModel(
      {required this.id,
      required this.name,
      required this.isActive,
      required this.image,
      required this.description,
      required this.createdOn,
      required this.updatedOn});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'is_active': isActive,
      'image': image,
      'description': description,
      'created_on': createdOn,
      'updated_on': updatedOn,
    };
  }

  factory OffersModel.fromMap(Map<String, dynamic> map) {
    return OffersModel(
      id: map['id'] as String? ?? "",
      name: map['name'] as String,
      isActive: map['is_active'] as bool,
      image: map['image'] as String,
      description: map['description'] as String,
      createdOn: map['created_on'].toDate(),
      updatedOn: map['updated_on'].toDate(),
    );
  }
}
