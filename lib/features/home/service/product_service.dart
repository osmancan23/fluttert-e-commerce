import 'package:vexana/vexana.dart';

import '../model/product_model.dart';

enum _HomeServicePath { products, limit }

abstract class IProductService {
  late final INetworkManager _networkManager;

  IProductService(INetworkManager networkManager) : _networkManager = networkManager;

  Future<List<ProductModel>?> fetchAllProducts();
  Future<List<ProductModel>?> fetchLimitProducts({int count = 5});
}

class ProductService extends IProductService {
  ProductService(INetworkManager networkManager) : super(networkManager);

  @override
  Future<List<ProductModel>?> fetchAllProducts() async {
    final response = await _networkManager.send<ProductModel, List<ProductModel>>(_HomeServicePath.products.name,
        parseModel: ProductModel(), method: RequestType.GET);
    return response.data;
  }

  @override
  Future<List<ProductModel>?> fetchLimitProducts({int count = 5}) async {
    final response = await _networkManager.send(_HomeServicePath.products.name,
        parseModel: ProductModel(), method: RequestType.GET, queryParameters: {_HomeServicePath.limit.name: count});
    return response.data;
  }
}
