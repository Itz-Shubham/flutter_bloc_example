import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_example/data/cart_items.dart';
import 'package:flutter_bloc_example/data/grocery_data.dart';
import 'package:flutter_bloc_example/data/wishlist_items.dart';
import 'package:flutter_bloc_example/features/home/models/product_data_model.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeNavigateToWishlistEvent>(homeNavigateToWishlistEvent);
    on<HomeNavigateToCartEvent>(homeNavigateToCartEvent);
    on<HomeAddProductToWishlistEvent>(homeAddProductToWishlistEvent);
    on<HomeAddProductCartEvent>(homeAddProductCartEvent);
  }
  FutureOr<void> homeInitialEvent(
    HomeInitialEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(HomeLoadingState());
    try {
      await Future.delayed(const Duration(seconds: 2));
      final map = GroceryData.groceryProducts.map(
        (e) => ProductModel(
            id: e['id'],
            name: e['name'],
            description: e['description'],
            price: e['price'],
            imageUrl: e['imageUrl']),
      );
      emit(HomeLoadedSuccessState(products: map.toList()));
    } catch (e) {
      emit(HomeErrorState(error: e.toString()));
    }
  }

  FutureOr<void> homeNavigateToWishlistEvent(
    HomeNavigateToWishlistEvent event,
    Emitter<HomeState> emit,
  ) {
    emit(HomeNavigateToWishlistPageActionState());
  }

  FutureOr<void> homeNavigateToCartEvent(
    HomeNavigateToCartEvent event,
    Emitter<HomeState> emit,
  ) {
    emit(HomeNavigateToCartPageActionState());
  }

  FutureOr<void> homeAddProductToWishlistEvent(
    HomeAddProductToWishlistEvent event,
    Emitter<HomeState> emit,
  ) {
    if (wishlistItems.contains(event.clickedProduct)) {
      emit(
        HomeProductAddedToWishlistActionState(
          message:
              "${event.clickedProduct.name} is already added in your wishlist",
        ),
      );
    } else {
      wishlistItems.add(event.clickedProduct);
      emit(
        HomeProductAddedToWishlistActionState(
          message: "${event.clickedProduct.name} is added in your wishlist",
        ),
      );
    }
  }

  FutureOr<void> homeAddProductCartEvent(
    HomeAddProductCartEvent event,
    Emitter<HomeState> emit,
  ) {
    if (cartItems.contains(event.clickedProduct)) {
      emit(
        HomeProductAddedToCartActionState(
          message: "${event.clickedProduct.name} is already added in your cart",
        ),
      );
    } else {
      cartItems.add(event.clickedProduct);
      emit(
        HomeProductAddedToCartActionState(
          message: "${event.clickedProduct.name} is added in your cart",
        ),
      );
    }
  }
}
