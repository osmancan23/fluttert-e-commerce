import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerce/features/home/bloc/bloc/home_bloc.dart';
import 'package:flutter_e_commerce/features/home/model/product_model.dart';
import 'package:flutter_e_commerce/features/home/service/product_service.dart';
import 'package:flutter_e_commerce/product/network/product_network_manager.dart';
import 'package:flutter_e_commerce/product/widget/dropdown_button.dart';
import 'package:kartal/kartal.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late HomeBloc bloc;
  @override
  void initState() {
    super.initState();
    bloc = HomeBloc(ProductService(ProductNetworkManager()));
    bloc.add(GetProducts());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BlocBuilder<HomeBloc, HomeState>(
              bloc: bloc,
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
        reverse: true,
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
