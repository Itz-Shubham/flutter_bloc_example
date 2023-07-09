import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_example/data/cart_items.dart';
import 'package:flutter_bloc_example/features/home/models/product_data_model.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartInitialEvent>(cartInitialEvent);
    on<CartRemoveFromCartEvent>(removeFromCartEvent);
  }

  Future<FutureOr<void>> cartInitialEvent(
    CartInitialEvent event,
    Emitter<CartState> emit,
  ) async {
    await Future.delayed(const Duration(seconds: 1));
    emit(CartLoadedState(products: cartItems));
  }

  FutureOr<void> removeFromCartEvent(
    CartRemoveFromCartEvent event,
    Emitter<CartState> emit,
  ) {
    cartItems.remove(event.removedProduct);
    emit(CartLoadedState(products: cartItems));
  }
}
