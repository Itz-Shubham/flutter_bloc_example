import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/features/home/bloc/home_bloc.dart';
import 'package:flutter_bloc_example/features/home/models/product_data_model.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;
  final HomeBloc homeBloc;
  const ProductCard({super.key, required this.product, required this.homeBloc});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            width: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(product.imageUrl),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            product.name,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(product.description),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "\$${product.price}",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  IconButton.outlined(
                      onPressed: () {
                        homeBloc.add(
                          HomeAddProductToWishlistEvent(
                            clickedProduct: product,
                          ),
                        );
                      },
                      icon: const Icon(Icons.favorite_border)),
                  IconButton.outlined(
                    onPressed: () {
                      homeBloc.add(
                        HomeAddProductCartEvent(
                          clickedProduct: product,
                        ),
                      );
                    },
                    icon: const Icon(Icons.shopping_cart_outlined),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
