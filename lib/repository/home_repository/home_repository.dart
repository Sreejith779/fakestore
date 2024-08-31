import 'package:getx_hr_management/data/network_apiServices.dart';
import 'package:getx_hr_management/res/url/urls.dart';

class HomeRepository{

  final _apiService = NetworkApiServices();

  Future<dynamic>getAllProducts()async{
    dynamic response = _apiService.getApi(AppURL.allProducts);
    print("data : $response");
    return response;
  }

  Future<dynamic>addToCart(Map<String, dynamic> data)async{
    dynamic response = _apiService.postApi(data, AppURL.addToCart);
    return response;
  }
  
  Future<dynamic>category()async{
    dynamic response = _apiService.getApi(AppURL.category);
    return response;
  }
}