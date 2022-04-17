import 'package:e_commerce/model/Product_model.dart';
import 'package:flutter/material.dart';

class CartProductCard extends StatelessWidget {
  final Product product;
  const CartProductCard({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Image.network(
            product.imageURL,
            height: 80,
            width: 100,
            fit: BoxFit.cover,
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  "RM " + product.price.toString(),
                  style: TextStyle(fontSize: 17),
                )
              ],
            ),
          ),
          SizedBox(width: 20,),
          Row(children: [
            IconButton(onPressed: (){}, icon: Icon(Icons.remove_circle)),
            Text("1"),
            IconButton(onPressed: (){}, icon: Icon(Icons.add_circle)),
          ],)
        ],
      ),
    );
  }
}
