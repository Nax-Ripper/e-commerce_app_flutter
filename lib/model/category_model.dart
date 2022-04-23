import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final String name;
  final String imageURL;
   Category({
    required this.name,
    required this.imageURL,
  });

  static Category fromSnapshot(DocumentSnapshot snap) {
    Category category =
        Category(name: snap["name"], imageURL: snap["imageUrl"]);
    return category;
  }

  static List<Category> staticListCategory = [
    Category(
        name: "Biscut",
        imageURL:
            "https://cf.shopee.com.my/file/233f58ce8d4903a0cf69bdef6b5614c9"),
    Category(
        name: "Soft Drinks",
        imageURL:
            "https://us.coca-cola.com/content/dam/nagbrands/us/coke/en/Coke_PageProperties.jpg"),
    Category(
        name: "Toothpastes",
        imageURL:
            "https://www.stlawrencedentistry.com/wp-content/uploads/2012/12/toothpaste.jpg"),
    Category(
        name: "Stationery",
        imageURL:
            "https://eezee.sg/blog/wp-content/uploads/2018/04/aboutus2.png")
  ];

  @override
  // TODO: implement props
  List<Object?> get props => [name, imageURL];
}
