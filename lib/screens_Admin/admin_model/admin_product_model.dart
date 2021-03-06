import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

import 'package:e_commerce/model/category_model.dart';

class AdminProduct extends Equatable {
  final String? id;
  final String name;
  final String category;
  final String imageURL;
  final bool isRecomended;
  final bool isPopular;
  final String description;
  double price;
  int quantity;
  AdminProduct({
    required this.description,
     this.id,
    required this.name,
    required this.category,
    required this.imageURL,
    required this.isRecomended,
    required this.isPopular,
    this.price = 0,
    this.quantity = 0,
  });

  AdminProduct copyWith({
    String? id,
    String? name,
    String? category,
    String? imageURL,
    bool? isRecomended,
    bool? isPopular,
    String? description,
    double? price,
    int? quantity,
  }) {
    return AdminProduct(
      id: id ?? this.id,
      name: name ?? this.name,
      category: category ?? this.category,
      imageURL: imageURL ?? this.imageURL,
      isRecomended: isRecomended ?? this.isRecomended,
      isPopular: isPopular ?? this.isPopular,
      description: description ?? this.description,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'category': category,
      'imageURL': imageURL,
      'isRecomended': isRecomended,
      'isPopular': isPopular,
      'description': description,
      'price': price,
      'quantity': quantity,
    };
  }

  factory AdminProduct.fromSnapshot(DocumentSnapshot map) {
    return AdminProduct(
      // id: map['id']?.toInt() ?? 0,
      id: map.id,
      name: map['name'] ?? '',
      category: map['category'] ?? '',
      imageURL: map['imageURL'] ?? '',
      isRecomended: map['isRecomended'] ?? false,
      isPopular: map['isPopular'] ?? false,
      description: map['description'] ?? '',
      price: map['price']?.toDouble() ?? 0.0,
      quantity: map['quantity']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());



  @override
  String toString() {
    return 'AdminProduct(id: $id, name: $name, category: $category, imageURL: $imageURL, isRecomended: $isRecomended, isPopular: $isPopular, description: $description, price: $price, quantity: $quantity)';
  }

  @override
  List<Object?> get props {
    return [
      id,
      name,
      category,
      imageURL,
      isRecomended,
      isPopular,
      description,
      price,
      quantity,
    ];
  }

  static List<AdminProduct> staticProducts = [
    AdminProduct(
        id: "1",
        name: "Sprite",
        category: "Soft Drinks",
        imageURL:
            "https://cf.shopee.com.my/file/7cd7326d1fb3f80dbac29000a948c792",
        price: 5.10,
        description: "This is a product",
        isRecomended: true,
        quantity: 2,
        isPopular: true),
    AdminProduct(
        id: '2',
        name: "Coca-Cola",
        category: "Soft Drinks",
         description: "This is a product",
        imageURL:
            "https://static.dezeen.com/uploads/2021/02/coca-cola-recycled-plastic-news_dezeen_2364_col_1.jpg",
        price: 5.00,
        isRecomended: true,
        isPopular: true),
    AdminProduct(
        id: '3',
        name: "Pepsi",
        category: "Soft Drinks",
         description: "This is a product",
        imageURL:
            "https://www.foodnavigator-asia.com/var/wrbm_gb_food_pharma/storage/images/_aliases/wrbm_large/publications/food-beverage-nutrition/foodnavigator-asia.com/headlines/formulation/pepsi-goes-local-in-china-osmanthus-flavoured-drink-first-to-tap-local-culture-and-comfort/11403305-1-eng-GB/Pepsi-goes-local-in-China-Osmanthus-flavoured-drink-first-to-tap-local-culture-and-comfort.jpg",
        price: 5.20,
        isRecomended: true,
        isPopular: true),
    AdminProduct(
        id: '4',
        name: "Fanta",
        category: "Soft Drinks",
         description: "This is a product",
        imageURL:
            "https://www.ubuy.com.my/productimg/?image=aHR0cHM6Ly9tLm1lZGlhLWFtYXpvbi5jb20vaW1hZ2VzL0kvNzF3clJqY2RyREwuX1NMMTUwMF8uanBn.jpg",
        price: 5.10,
        isRecomended: true,
        isPopular: false),
    AdminProduct(
        id: '5',
        name: "Jacobs",
        category: "Biscuits",
         description: "This is a product",
        imageURL:
            "https://secure.ap-tescoassets.com/assets/MY/983/7622210974983/ShotType1_540x540.jpg",
        price: 6.00,
        isRecomended: false,
        isPopular: true),
    AdminProduct(
        id: '6',
        name: "Oat krunch",
        category: "Biscuits",
         description: "This is a product",
        imageURL:
            "https://www.pantryexpress.my/862-large_default/munchy-s-oat-krunch-crackers-15x26g-chunky-hazelnut.jpg",
        price: 10.10,
        isRecomended: true,
        isPopular: true),
  ];
}
