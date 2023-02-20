class ProductModel {
  String? id;
  DateTime createdOn;
  DateTime updatedOn;
  final String createdBy;
  final List<String> images;
  final String categoryId;
  final String categoryName;
  final String manufacturer;
  final List<String> features;
  final String description;
  final num modelYear;
  final num powerRating;
  final num capacity;
  final String capacityUnit;
  final num price;
  final bool isBillAvailable;
  final bool isEmiAvailable;
  final bool isWarrantyAvailable;
  final String warrantyDetails;
  final num warrantyPeriodInMonths;
  final bool isFreeServiceAvailable;
  final num freeServicePeriodInMonths;
  final bool isHomeDeliveryFree;
  final bool isFreeInstallationAvailable;
  final bool isAccessoriesAvailable;
  final bool isReseller;
  final num energyStarRating;

  ProductModel({
    this.id,
    required this.createdOn,
    required this.updatedOn,
    required this.createdBy,
    required this.categoryId,
    required this.images,
    required this.categoryName,
    required this.features,
    required this.description,
    required this.modelYear,
    required this.price,
    required this.powerRating,
    required this.capacity,
    required this.capacityUnit,
    required this.isBillAvailable,
    required this.isEmiAvailable,
    required this.isWarrantyAvailable,
    required this.warrantyDetails,
    required this.warrantyPeriodInMonths,
    required this.isFreeServiceAvailable,
    required this.freeServicePeriodInMonths,
    required this.manufacturer,
    required this.isHomeDeliveryFree,
    required this.isFreeInstallationAvailable,
    required this.isReseller,
    required this.isAccessoriesAvailable,
    required this.energyStarRating,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'created_on': createdOn,
      'updated_on': updatedOn,
      'created_by': createdBy,
      'category_id': categoryId,
      'images': images,
      'category_name': categoryName,
      'manufacturer': manufacturer,
      'features': features,
      'description': description,
      'model_year': modelYear,
      'power_rating': powerRating,
      'capacity': capacity,
      'capacity_unit': capacityUnit,
      'price': price,
      'is_bill_available': isBillAvailable,
      'is_emi_available': isEmiAvailable,
      'is_warranty_available': isWarrantyAvailable,
      'warranty_details': warrantyDetails,
      'warranty_period_in_months': warrantyPeriodInMonths,
      'is_free_service_available': isFreeServiceAvailable,
      'free_service_period_in_months': freeServicePeriodInMonths,
      'is_home_delivery_free': isHomeDeliveryFree,
      'is_free_installation_available': isFreeInstallationAvailable,
      'is_accessories_available': isAccessoriesAvailable,
      'is_reseller': isReseller,
      'energy_star_rating': energyStarRating,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'] as String,
      createdOn: map['created_on'].toDate(),
      updatedOn: map['updated_on'].toDate(),
      createdBy: map['created_by'] as String,
      categoryId: map['category_id'] as String,
      categoryName: map['category_name'] as String,
      manufacturer: map['manufacturer'] as String,
      images: (map['images'] as List<dynamic>?)
              ?.map((item) => item as String)
              .toList() ??
          [],
      features: (map['features'] as List<dynamic>)
          .map((item) => item.toString())
          .toList(),
      description: map['description'] as String,
      modelYear: map['model_year'] as num,
      powerRating: map['power_rating'] as num,
      capacity: map['capacity'] as num,
      capacityUnit: map['capacity_unit'] as String,
      price: map['price'] as num,
      isBillAvailable: map['is_bill_available'] as bool,
      isEmiAvailable: map['is_emi_available'] as bool,
      isWarrantyAvailable: map['is_warranty_available'] as bool,
      warrantyDetails: map['warranty_details'] as String,
      warrantyPeriodInMonths: map['warranty_period_in_months'] as num,
      isFreeServiceAvailable: map['is_free_service_available'] as bool,
      freeServicePeriodInMonths: map['free_service_period_in_months'] as num,
      isHomeDeliveryFree: map['is_home_delivery_free'] as bool,
      isFreeInstallationAvailable:
          map['is_free_installation_available'] as bool,
      isAccessoriesAvailable: map['is_accessories_available'] as bool,
      isReseller: map['is_reseller'] as bool,
      energyStarRating: map['energy_star_rating'] as num,
    );
  }

  factory ProductModel.fromMapToFirebase(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'] as String,
      createdOn: map['created_on'],
      updatedOn: map['updated_on'],
      createdBy: map['created_by'] as String,
      categoryId: map['category_id'] as String,
      images: (map['images'] as List<dynamic>?)
              ?.map((item) => item as String)
              .toList() ??
          [],
      categoryName: map['category_name'] as String,
      manufacturer: map['manufacturer'] as String,
      features: (map['features'] as List<dynamic>)
          .map((item) => item.toString())
          .toList(),
      description: map['description'] as String,
      modelYear: map['model_year'] as num,
      powerRating: map['power_rating'] as num,
      capacity: map['capacity'] as num,
      capacityUnit: map['capacity_unit'] as String,
      price: map['price'] as num,
      isBillAvailable: map['is_bill_available'] as bool,
      isEmiAvailable: map['is_emi_available'] as bool,
      isWarrantyAvailable: map['is_warranty_available'] as bool,
      warrantyDetails: map['warranty_details'] as String,
      warrantyPeriodInMonths: map['warranty_period_in_months'] as num,
      isFreeServiceAvailable: map['is_free_service_available'] as bool,
      freeServicePeriodInMonths: map['free_service_period_in_months'] as num,
      isHomeDeliveryFree: map['is_home_delivery_free'] as bool,
      isFreeInstallationAvailable:
          map['is_free_installation_available'] as bool,
      isAccessoriesAvailable: map['is_accessories_available'] as bool,
      isReseller: map['is_reseller'] as bool,
      energyStarRating: map['energy_star_rating'] as num,
    );
  }
}
