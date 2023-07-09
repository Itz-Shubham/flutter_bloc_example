part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class HomeAddProductToWishlistEvent extends HomeEvent {
  final ProductModel clickedProduct;
  HomeAddProductToWishlistEvent({required this.clickedProduct});
}

class HomeAddProductCartEvent extends HomeEvent {
  final ProductModel clickedProduct;
  HomeAddProductCartEvent({required this.clickedProduct});
}

class HomeNavigateToWishlistEvent extends HomeEvent {}

class HomeNavigateToCartEvent extends HomeEvent {}
