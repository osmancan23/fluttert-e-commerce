part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  late List<ProductModel> products;
  HomeLoaded(this.products);
  @override
  List<Object> get props => [products];
}

class HomeError extends HomeState {
  late String message;
  HomeError(this.message);
  @override
  List<Object> get props => [message];
}
