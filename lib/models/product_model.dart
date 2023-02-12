class ProductModel {
  String id;
  DateTime? createdOn;
  DateTime? updatedOn;
  final String createdBy;
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
  final bool isHomeDeliveryAvailable;
  final bool isHomeDeliveryFree;
  final bool isFreeInstallationAvailable;
  final bool isAccessoriesAvailable;
  final bool isReseller;
  final num energyStarRating;

  ProductModel({
    required this.id,
    required this.createdBy,
    required this.categoryId,
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
    required this.isHomeDeliveryAvailable,
    required this.isHomeDeliveryFree,
    required this.isFreeInstallationAvailable,
    required this.isReseller,
    required this.isAccessoriesAvailable,
    required this.energyStarRating,
  });
}
