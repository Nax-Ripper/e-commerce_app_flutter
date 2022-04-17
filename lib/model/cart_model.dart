import 'package:e_commerce/model/Product_model.dart';
import 'package:equatable/equatable.dart';

class Cart extends Equatable {
  Cart();

  double get subtotal => cartProducts.fold(0, (total, current) {
        double d = total + current.price;
        String toS = d.toStringAsFixed(3);
        double totalSub = double.parse(toS);
        return totalSub;
      });
  
  double get deliveryFee{
    if(subtotal>=20.00){
      return 0.0;
    }else{
      return 10.00;
    }
  }

  double get total => subtotal+deliveryFee;

  List<Product> cartProducts = [
    Product(
        name: "Sprite",
        category: "Soft Drinks",
        imageURL:
            "https://cf.shopee.com.my/file/7cd7326d1fb3f80dbac29000a948c792",
        price: 5.11,
        isRecomended: true,
        isPopular: true),
    Product(
        name: "Coca-Cola",
        category: "Soft Drinks",
        imageURL:
            "https://static.dezeen.com/uploads/2021/02/coca-cola-recycled-plastic-news_dezeen_2364_col_1.jpg",
        price: 5.55,
        isRecomended: true,
        isPopular: true),
    Product(
        name: "Pepsi",
        category: "Soft Drinks",
        imageURL:
            "https://www.foodnavigator-asia.com/var/wrbm_gb_food_pharma/storage/images/_aliases/wrbm_large/publications/food-beverage-nutrition/foodnavigator-asia.com/headlines/formulation/pepsi-goes-local-in-china-osmanthus-flavoured-drink-first-to-tap-local-culture-and-comfort/11403305-1-eng-GB/Pepsi-goes-local-in-China-Osmanthus-flavoured-drink-first-to-tap-local-culture-and-comfort.jpg",
        price: 5.33,
        isRecomended: true,
        isPopular: true),
    Product(
        name: "Fanta",
        category: "Soft Drinks",
        imageURL:
            "https://www.ubuy.com.my/productimg/?image=aHR0cHM6Ly9tLm1lZGlhLWFtYXpvbi5jb20vaW1hZ2VzL0kvNzF3clJqY2RyREwuX1NMMTUwMF8uanBn.jpg",
        price: 5.12,
        isRecomended: true,
        isPopular: false),
  ];

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
