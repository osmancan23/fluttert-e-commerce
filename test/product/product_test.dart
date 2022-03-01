import 'package:flutter_e_commerce/features/home/service/product_service.dart';
import 'package:flutter_e_commerce/product/network/product_network_manager.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late IProductService _productService;
  setUp(() {
    _productService = ProductService(ProductNetworkManager());
  });

  test("Test Fetch Products", () async {
    var response = await _productService.fetchAllProducts();
    expect(response, isNotEmpty);
  });
}
