import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/features/wishlist/bloc/wishlist_bloc.dart';

import 'wishllist_tile.dart';

class Wishlist extends StatefulWidget {
  const Wishlist({super.key});

  @override
  State<Wishlist> createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  final WishlistBloc wishlistBloc = WishlistBloc();

  @override
  void initState() {
    wishlistBloc.add(WishlistInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Wishlist Page"),
      ),
      body: BlocConsumer<WishlistBloc, WishlistState>(
        bloc: wishlistBloc,
        listenWhen: (previous, current) => current is WishlistActionState,
        buildWhen: (previous, current) => current is! WishlistActionState,
        listener: (context, state) {},
        builder: (context, state) {
          switch (state.runtimeType) {
            case WishlistLoadedState:
              final wishlistloadedState = state as WishlistLoadedState;
              if (wishlistloadedState.products.isEmpty) {
                return const Center(
                  child: Text("Empty Wishlist!"),
                );
              } else {
                return ListView.builder(
                  itemCount: wishlistloadedState.products.length,
                  itemBuilder: (context, index) {
                    return WishlistTile(
                      product: wishlistloadedState.products[index],
                      wishlistBloc: wishlistBloc,
                    );
                  },
                );
              }
            case WishlistErrorState:
              final wishlistErrorState = state as WishlistErrorState;
              return Center(
                child: Text(wishlistErrorState.error),
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
