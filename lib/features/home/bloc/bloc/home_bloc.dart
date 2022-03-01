import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerce/features/home/model/product_model.dart';
import 'package:flutter_e_commerce/features/home/service/product_service.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  IProductService _productService;
  HomeBloc(this._productService) : super(HomeInitial()) {
    on<GetProducts>((event, emit) async {
      emit(HomeLoading());
      try {
        var response = await _productService.fetchAllProducts();
        emit(HomeLoaded(response!));
      } catch (e) {
        emit(HomeError(e.toString()));
      }
    });
  }
}
