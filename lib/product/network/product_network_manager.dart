import 'package:flutter_e_commerce/product/constants/app_constants.dart';
import 'package:vexana/vexana.dart';

class ProductNetworkManager extends NetworkManager {
  ProductNetworkManager() : super(options: BaseOptions(baseUrl: ApplicationConstants.instance!.baseUrl));
}
