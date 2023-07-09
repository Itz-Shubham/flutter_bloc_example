part of 'wishlist_bloc.dart';

@immutable
abstract class WishlistState {}

class WishlistInitial extends WishlistState {}

class WishlistLoadedState extends WishlistState {
  final List<ProductModel> products;
  WishlistLoadedState({required this.products});
}

class WishlistErrorState extends WishlistState {
  final String error;
  WishlistErrorState(this.error);
}

@immutable
abstract class WishlistActionState extends WishlistState {}
