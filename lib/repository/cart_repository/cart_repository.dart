import 'package:getx_hr_management/data/network_apiServices.dart';
import 'package:getx_hr_management/res/url/urls.dart';

class CartRepository {
  final _apiServices = NetworkApiServices();

  Future<dynamic> getCartItems() async {
    try {
      final response = _apiServices.getApi(AppURL.cartItems);
      return response;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
