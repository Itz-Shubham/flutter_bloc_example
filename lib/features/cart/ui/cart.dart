import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/cart_bloc.dart';
import 'cart_tile.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  final CartBloc cartBloc = CartBloc();

  @override
  void initState() {
    cartBloc.add(CartInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart Page"),
      ),
      body: BlocConsumer<CartBloc, CartState>(
        bloc: cartBloc,
        listenWhen: (previous, current) => current is CartActionState,
        buildWhen: (previous, current) => current is! CartActionState,
        listener: (context, state) {},
        builder: (context, state) {
          switch (state.runtimeType) {
            case CartLoadedState:
              final cartloadedState = state as CartLoadedState;
              if (cartloadedState.products.isEmpty) {
                return const Center(
                  child: Text("Empty Cart!"),
                );
              } else {
                return ListView.builder(
                  itemCount: cartloadedState.products.length,
                  itemBuilder: (context, index) {
                    return CartTile(
                      product: cartloadedState.products[index],
                      cartBloc: cartBloc,
                    );
                  },
                );
              }
            case CartErrorState:
              final cartErrorState = state as CartErrorState;
              return Center(
                child: Text(cartErrorState.error),
              );
            default:
              return const Center(
                child: CircularProgressIndicator(),
              );
          }
        },
      ),
    );
  }
}
