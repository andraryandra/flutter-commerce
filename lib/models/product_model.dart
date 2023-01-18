import 'package:commerce_flutter/models/category_model.dart';
import 'package:commerce_flutter/models/gallery_model.dart';
import 'package:flutter/cupertino.dart';

class ProductModel{

  int? id;
  late String name;
  late double price;
  late String description;
  late String? tags;
  late CategoryModel category;
  late DateTime? createdAt;
  late DateTime? updatedAt;
  late List<GalleryModel> galleries;

  //   int? id;
  // String? name;
  // double? price;
  // String? description;
  // String? tags;
  // // late CategoryModel category;
  
  // DateTime? createdAt;
  // DateTime? updatedAt;
  // // late List<GalleryModel> galleries;
  // // List<GalleryModel> galleries;


  ProductModel({
    this.id,
    required this.name,
    required this.price,
    required this.description,
    this.tags,
    required this.category,
    this.createdAt,
    this.updatedAt,
    required this.galleries,
  });

  // ProductModel.fromJson(Map<String, dynamic> json){
  //   id = json['id'];
  //   name = json['name'];
  //   price = double.parse(json['price'].toString());
  //   description = json['description'];
  //   tags = json['tags'];
  //   category = CategoryModel.fromJson(json['category']);
  //   galleries = json['galleries'].map<GalleryModel>((gallery) => GalleryModel.fromJson(gallery)).toList();
  //   createdAt = DateTime.parse(json['created_at']);
  //   updatedAt = DateTime.parse(json['updated_at']);
  // }

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = double.parse(json['price'].toString());
    description = json['description'];
    tags = json['tags'];
    category = CategoryModel.fromJson(json['category']);
    galleries = json['galleries']
        .map<GalleryModel>((gallery) => GalleryModel.fromJson(gallery))
        .toList();
    createdAt = DateTime.parse(json['created_at']);
    updatedAt = DateTime.parse(json['updated_at']);
  }

   Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'description': description,
      'tags': tags,
      'category': category.toJson(),
      'galleries': galleries.map((gallery) => gallery.toJson()).toList(),
      'created_at': createdAt.toString(),
      'updated_at': updatedAt.toString(),
    };
  }


  // Map<String, dynamic> toJson(){
  //   return {
  //     'id': id,
  //     'name': name,
  //     'price': price,
  //     'description': description,
  //     'tags': tags,
  //     'category': category!.toJson(),
  //     // 'galleries': galleries.map((gallery) => gallery.toJson()).toList(),
  //     'galleries': galleries!.map((gallery) => gallery.toJson()).toList(),
  //     'created_at': createdAt.toString(),
  //     'updated_at': updatedAt.toString(),
  //   };
  // }
}
