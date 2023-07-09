part of 'wishlist_bloc.dart';

@immutable
abstract class WishlistEvent {}

class WishlistInitialEvent extends WishlistEvent {}

class WishlistRemoveFromWishlistEvent extends WishlistEvent {
  final ProductModel removedProduct;
  WishlistRemoveFromWishlistEvent(this.removedProduct);
}
