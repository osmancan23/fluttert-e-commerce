import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../model/product_model.dart';
import '../../service/product_service.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final IProductService _productService;
  int count = 0;

  HomeBloc(this._productService) : super(HomeInitial()) {
    on<GetProducts>((event, emit) async {
      count += 5;
      emit(HomeLoading());
      try {
        var response = await _productService.fetchLimitProducts(count: count);
        emit(HomeLoaded(response!));
      } catch (e) {
        emit(HomeError(e.toString()));
      }
    });
  }
}
