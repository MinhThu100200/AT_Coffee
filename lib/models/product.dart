// // To parse this JSON data, do
// //
// //     final product = productFromJson(jsonString);

// import 'dart:convert';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:get/get.dart';

// List<Product> productFromJson(String str) =>
//     List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

// String productToJson(List<Product> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class Product {
//   Product({
//     this.id,
//     this.createdDate,
//     this.modifiedDate,
//     this.createdBy,
//     this.modifiedBy,
//     this.code,
//     this.state,
//     this.results,
//     this.name,
//     this.image,
//     this.file,
//     this.description,
//     this.discount,
//     this.rate,
//     this.numberReviewers,
//     this.categories,
//     this.stores,
//     this.sizes,
//   });

//   int id;
//   Timestamp createdDate;
//   Timestamp modifiedDate;
//   String createdBy;
//   String modifiedBy;
//   String code;
//   bool state;
//   List<dynamic> results;
//   String name;
//   dynamic file;
//   String description;
//   double discount;
//   double rate;
//   int numberReviewers;
//   List<Category> categories;
//   List<Store> stores;
//   List<Sizes> sizes;

//   factory Product.fromJson(Map<String, dynamic> json) => Product(
//         id: json["id"],
//         brand: brandValues.map[json["brand"]],
//         name: json["name"],
//         price: json["price"],
//         priceSign: json["price_sign"],
//         currency: json["currency"],
//         imageLink: json["image_link"],
//         productLink: json["product_link"],
//         websiteLink: json["website_link"],
//         description: json["description"],
//         rating: json["rating"] == null ? null : json["rating"].toDouble(),
//         category: json["category"] == null ? null : json["category"],
//         productType: json["product_type"],
//         tagList: List<dynamic>.from(json["tag_list"].map((x) => x)),
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//         productApiUrl: json["product_api_url"],
//         apiFeaturedImage: json["api_featured_image"],
//         productColors: List<ProductColor>.from(
//             json["product_colors"].map((x) => ProductColor.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "brand": brandValues.reverse[brand],
//         "name": name,
//         "price": price,
//         "price_sign": priceSign,
//         "currency": currency,
//         "image_link": imageLink,
//         "product_link": productLink,
//         "website_link": websiteLink,
//         "description": description,
//         "rating": rating == null ? null : rating,
//         "category": category == null ? null : category,
//         "product_type": productType,
//         "tag_list": List<dynamic>.from(tagList.map((x) => x)),
//         "created_at": createdAt.toIso8601String(),
//         "updated_at": updatedAt.toIso8601String(),
//         "product_api_url": productApiUrl,
//         "api_featured_image": apiFeaturedImage,
//         "product_colors":
//             List<dynamic>.from(productColors.map((x) => x.toJson())),
//       };
// }

// enum Brand { MAYBELLINE }

// final brandValues = EnumValues({"maybelline": Brand.MAYBELLINE});

// class ProductColor {
//   ProductColor({
//     this.hexValue,
//     this.colourName,
//   });

//   String hexValue;
//   String colourName;

//   factory ProductColor.fromJson(Map<String, dynamic> json) => ProductColor(
//         hexValue: json["hex_value"],
//         colourName: json["colour_name"] == null ? null : json["colour_name"],
//       );

//   Map<String, dynamic> toJson() => {
//         "hex_value": hexValue,
//         "colour_name": colourName == null ? null : colourName,
//       };
// }

// class EnumValues<T> {
//   Map<String, T> map;
//   Map<T, String> reverseMap;

//   EnumValues(this.map);

//   Map<T, String> get reverse {
//     if (reverseMap == null) {
//       reverseMap = map.map((k, v) => new MapEntry(v, k));
//     }
//     return reverseMap;
//   }
// }
