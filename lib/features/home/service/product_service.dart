import 'package:flutter_e_commerce/features/home/model/product_model.dart';
import 'package:vexana/vexana.dart';

enum _HomeServicePath { products, categories }

abstract class IProductService {
  late final INetworkManager _networkManager;

  IProductService(INetworkManager networkManager) : _networkManager = networkManager;

  Future<List<ProductModel>?> fetchAllProducts({int count = 5});
  Future<List<String>?> fetchAllCategories();
}

class ProductService extends IProductService {
  ProductService(INetworkManager networkManager) : super(networkManager);

  @override
  Future<List<String>?> fetchAllCategories() async {
    final response = await _networkManager.sendPrimitive("${_HomeServicePath.products}/${_HomeServicePath.categories}");
    return response is List ? response.map((e) => '$e').toList() : null;
  }

  @override
  Future<List<ProductModel>?> fetchAllProducts({int count = 5}) async {
    final response = await _networkManager.send<ProductModel, List<ProductModel>>(_HomeServicePath.products.name,
        parseModel: ProductModel(), method: RequestType.GET);
    return response.data;
  }
}
