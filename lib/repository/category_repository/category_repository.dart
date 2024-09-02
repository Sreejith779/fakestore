import 'package:getx_hr_management/data/network_apiServices.dart';

class CategoryRepository {
  final _apiServices = NetworkApiServices();

  Future<dynamic> getCategoryProducts({required String categoryName}) async {
    final String url =
        "https://fakestoreapi.com/products/category/$categoryName";
    print("url : ${url}");
    dynamic response = _apiServices.getApi(url);
    print(response);
    return response;
  }
}
