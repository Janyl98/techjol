
import 'package:ecommerce_app_api/core/constants/api_constants.dart';
import 'package:ecommerce_app_api/core/constants/enums/request_types.dart';
import 'package:ecommerce_app_api/core/utils/network/network_manager.dart';
import 'package:ecommerce_app_api/features/product/models/product_model.dart';

class ShopService {
  final NetworkManager? _networkManager = NetworkManager.instance;

  Future<List<ProductModel>?> fetchAllProducts(
      {Map<String, dynamic>? params}) async {
    return await _networkManager!.request(

      method: ReqTypes.get,
      path: ApiConstants.products,
      model: ProductModel(),
      queryParameters: params,
    );
  }
}
