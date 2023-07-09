part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadedSuccessState extends HomeState {
  final List<ProductModel> products;
  HomeLoadedSuccessState({required this.products});
}

class HomeErrorState extends HomeState {
  final String error;
  HomeErrorState({required this.error});
}

abstract class HomeActionState extends HomeState {}

class HomeNavigateToWishlistPageActionState extends HomeActionState {}

class HomeNavigateToCartPageActionState extends HomeActionState {}

class HomeProductAddedToWishlistActionState extends HomeActionState {
  final String message;
  HomeProductAddedToWishlistActionState({required this.message});
}

class HomeProductAddedToCartActionState extends HomeActionState {
  final String message;
  HomeProductAddedToCartActionState({required this.message});
}
