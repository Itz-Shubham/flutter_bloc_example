part of 'cart_bloc.dart';

@immutable
abstract class CartState {}

class CartInitial extends CartState {}

class CartLoadedState extends CartState {
  final List<ProductModel> products;
  CartLoadedState({required this.products});
}

class CartErrorState extends CartState {
  final String error;
  CartErrorState(this.error);
}

// class CartRemoveFromCartState extends CartState {
//   final List<ProductModel> products;
//   CartRemoveFromCartState({required this.products});
// }

@immutable
abstract class CartActionState extends CartState {}
