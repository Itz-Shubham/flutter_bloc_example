import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/features/cart/bloc/cart_bloc.dart';
import 'package:flutter_bloc_example/features/home/models/product_data_model.dart';

class CartTile extends StatelessWidget {
  final ProductModel product;
  final CartBloc cartBloc;
  const CartTile({
    super.key,
    required this.product,
    required this.cartBloc,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: SizedBox(
        height: 64,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Image.network(product.imageUrl),
            ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  textScaleFactor: 1.6,
                ),
                Text(
                  product.description,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),
            const Spacer(),
            IconButton(
              onPressed: () {
                cartBloc.add(CartRemoveFromCartEvent(product));
              },
              icon: const Icon(Icons.clear),
              color: Colors.red,
            ),
            const SizedBox(width: 8),
          ],
        ),
      ),
    );
  }
}
