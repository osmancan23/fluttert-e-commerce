import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import '../bloc/bloc/home_bloc.dart';
import '../model/product_model.dart';
import '../service/product_service.dart';
import '../../../product/network/product_network_manager.dart';
import '../../../product/state/base_view.dart';
import 'package:kartal/kartal.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeBloc>(
      viewModel: HomeBloc(ProductService(ProductNetworkManager())),
      onModelReady: (model) {
        model.add(GetProducts());
      },
      onPageBuilder: (BuildContext context, value) => Scaffold(
        appBar: AppBar(),
        body: LazyLoadScrollView(
          onEndOfPage: () {
            value.add(GetProducts());
          },
          child: SingleChildScrollView(
            child: Column(
              children: [
                BlocBuilder<HomeBloc, HomeState>(
                  bloc: value,
                  builder: (context, state) {
                    if (state is HomeLoading) {
                      return _buildLoadingWidget();
                    } else if (state is HomeLoaded) {
                      return _buildLoadedWidget(context, state);
                    } else {
                      return _buildErrorWidget();
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildErrorWidget() {
    return const Center(
      child: Text(
        "Error",
      ),
    );
  }

  Widget _buildLoadedWidget(BuildContext context, HomeLoaded state) {
    return SizedBox(
      width: context.dynamicWidth(1),
      height: context.dynamicHeight(1),
      child: ListView.builder(
        itemCount: state.products.length,
        itemBuilder: (BuildContext context, int index) {
          ProductModel product = state.products[index];
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(product.title!, style: context.textTheme.headline6),
                  ),
                  Image.network(product.image!),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(product.description!, style: context.textTheme.bodyText1),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildLoadingWidget() => const Center(child: CircularProgressIndicator());
}
