import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/wishlist_items.dart';
import '../../home/models/product_data_model.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistInitial()) {
    on<WishlistInitialEvent>(wishlistInitialEvent);
    on<WishlistRemoveFromWishlistEvent>(removeFromWishlistEvent);
  }

  Future<FutureOr<void>> wishlistInitialEvent(
    WishlistInitialEvent event,
    Emitter<WishlistState> emit,
  ) async {
    await Future.delayed(const Duration(seconds: 1));
    emit(WishlistLoadedState(products: wishlistItems));
  }

  FutureOr<void> removeFromWishlistEvent(
    WishlistRemoveFromWishlistEvent event,
    Emitter<WishlistState> emit,
  ) {
    wishlistItems.remove(event.removedProduct);
    emit(WishlistLoadedState(products: wishlistItems));
  }
}
