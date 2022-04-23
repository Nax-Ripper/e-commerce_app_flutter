import 'package:e_commerce/bloc/cart/cart_bloc.dart';
import 'package:e_commerce/model/Product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartProductCard extends StatefulWidget {
  final Product product;
  final int quantity;
  const CartProductCard({
    Key? key,
    required this.product,
    required this.quantity,
  }) : super(key: key);

  @override
  State<CartProductCard> createState() => _CartProductCardState();
}

class _CartProductCardState extends State<CartProductCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Image.network(
            widget.product.imageURL,
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
                  widget.product.name,
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  "RM " + widget.product.price.toString(),
                  style: TextStyle(fontSize: 17),
                )
              ],
            ),
          ),
          SizedBox(
            width: 20,
          ),
          BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              if (state is CartLoading) {
                return const CircularProgressIndicator();
              }
              if (state is CartLoaded) {
                return Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          context
                              .read<CartBloc>()
                              .add(CartProductRemoved(widget.product));
                        },
                        icon: Icon(Icons.remove_circle)),
                    Text(widget.quantity.toString()),
                    
                    IconButton(
                        onPressed: () {
                          context
                              .read<CartBloc>()
                              .add(CartProductAdded(widget.product));
                        },
                        icon: Icon(Icons.add_circle)),
                  ],
                );
              } else {
                return Text("Something went wrong");
              }
            },
          )
        ],
      ),
    );
  }
}
