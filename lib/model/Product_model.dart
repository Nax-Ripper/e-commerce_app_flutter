import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String name;
  final String category;
  final String imageURL;
  final double price;
  final bool isRecomended;
  final bool isPopular;

  Product({
    required this.name,
    required this.category,
    required this.imageURL,
    required this.price,
    required this.isRecomended,
    required this.isPopular,
  });

  static Product fromSnapshot(DocumentSnapshot snap) {
    Product product = Product(
        name: snap["name"],
        category: snap["category"],
        imageURL: snap["imageURL"],
        price: snap["price"],
        isRecomended: snap["isRecomended"],
        isPopular: snap["isPopular"]);

    return product;
  }

  static List<Product> staticProducts = [
    Product(
        name: "Sprite",
        category: "Soft Drinks",
        imageURL:
            "https://cf.shopee.com.my/file/7cd7326d1fb3f80dbac29000a948c792",
        price: 5.10,
        isRecomended: true,
        isPopular: true),
    Product(
        name: "Coca-Cola",
        category: "Soft Drinks",
        imageURL:
            "https://static.dezeen.com/uploads/2021/02/coca-cola-recycled-plastic-news_dezeen_2364_col_1.jpg",
        price: 5.00,
        isRecomended: true,
        isPopular: true),
    Product(
        name: "Pepsi",
        category: "Soft Drinks",
        imageURL:
            "https://www.foodnavigator-asia.com/var/wrbm_gb_food_pharma/storage/images/_aliases/wrbm_large/publications/food-beverage-nutrition/foodnavigator-asia.com/headlines/formulation/pepsi-goes-local-in-china-osmanthus-flavoured-drink-first-to-tap-local-culture-and-comfort/11403305-1-eng-GB/Pepsi-goes-local-in-China-Osmanthus-flavoured-drink-first-to-tap-local-culture-and-comfort.jpg",
        price: 5.20,
        isRecomended: true,
        isPopular: true),
    Product(
        name: "Fanta",
        category: "Soft Drinks",
        imageURL:
            "https://www.ubuy.com.my/productimg/?image=aHR0cHM6Ly9tLm1lZGlhLWFtYXpvbi5jb20vaW1hZ2VzL0kvNzF3clJqY2RyREwuX1NMMTUwMF8uanBn.jpg",
        price: 5.10,
        isRecomended: true,
        isPopular: false),
    Product(
        name: "Jacobs",
        category: "Biscut",
        imageURL:
            "https://secure.ap-tescoassets.com/assets/MY/983/7622210974983/ShotType1_540x540.jpg",
        price: 6.00,
        isRecomended: false,
        isPopular: true),
    Product(
        name: "Oat krunch",
        category: "Biscut",
        imageURL:
            "https://www.pantryexpress.my/862-large_default/munchy-s-oat-krunch-crackers-15x26g-chunky-hazelnut.jpg",
        price: 10.10,
        isRecomended: true,
        isPopular: true),
  ];

  @override
  // TODO: implement props
  List<Object?> get props =>
      [name, category, imageURL, price, isRecomended, isPopular];
}
