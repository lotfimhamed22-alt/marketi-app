import 'package:hive/hive.dart';

part 'product_model_cart.g.dart';

@HiveType(typeId: 0)
class ProductResponseCart {
  @HiveField(0)
  List<ProductModel> list;

  @HiveField(1)
  int total;

  @HiveField(2)
  int skip;

  @HiveField(3)
  int limit;

  ProductResponseCart({
    required this.list,
    required this.total,
    required this.skip,
    required this.limit,
  });
}

@HiveType(typeId: 1)
class ProductModel {
  @HiveField(0)
  int id;

  @HiveField(1)
  String title;

  @HiveField(2)
  String description;

  @HiveField(3)
  String category;

  @HiveField(4)
  double price;

  @HiveField(5)
  double discountPercentage;

  @HiveField(6)
  double rating;

  @HiveField(7)
  int stock;

  @HiveField(8)
  List<String> tags;

  @HiveField(9)
  String brand;

  @HiveField(10)
  String sku;

  @HiveField(11)
  int weight;

  @HiveField(12)
  Dimensions dimensions;

  @HiveField(13)
  String warrantyInformation;

  @HiveField(14)
  String shippingInformation;

  @HiveField(15)
  String availabilityStatus;

  @HiveField(16)
  List<Review> reviews;

  @HiveField(17)
  String returnPolicy;

  @HiveField(18)
  int minimumOrderQuantity;

  @HiveField(19)
  Meta meta;

  @HiveField(20)
  List<String> images;

  @HiveField(21)
  String thumbnail;

  ProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.tags,
    required this.brand,
    required this.sku,
    required this.weight,
    required this.dimensions,
    required this.warrantyInformation,
    required this.shippingInformation,
    required this.availabilityStatus,
    required this.reviews,
    required this.returnPolicy,
    required this.minimumOrderQuantity,
    required this.meta,
    required this.images,
    required this.thumbnail,
  });
}

@HiveType(typeId: 2)
class Dimensions {
  @HiveField(0)
  double width;

  @HiveField(1)
  double height;

  @HiveField(2)
  double depth;

  Dimensions({required this.width, required this.height, required this.depth});
}

@HiveType(typeId: 3)
class Review {
  @HiveField(0)
  int rating;

  @HiveField(1)
  String comment;

  @HiveField(2)
  String date;

  @HiveField(3)
  String reviewerName;

  @HiveField(4)
  String reviewerEmail;

  Review({
    required this.rating,
    required this.comment,
    required this.date,
    required this.reviewerName,
    required this.reviewerEmail,
  });
}

@HiveType(typeId: 4)
class Meta {
  @HiveField(0)
  String createdAt;

  @HiveField(1)
  String updatedAt;

  @HiveField(2)
  String barcode;

  @HiveField(3)
  String qrCode;

  Meta({
    required this.createdAt,
    required this.updatedAt,
    required this.barcode,
    required this.qrCode,
  });
}
