import 'package:getx_hr_management/data/network_apiServices.dart';
import 'package:getx_hr_management/res/url/urls.dart';

class AccountRepo {
  
  final _apiServices = NetworkApiServices();
  
  Future<dynamic>userData()async{
    final response = _apiServices.getApi(AppURL.user);
    print("response : $response");
    return response;
  }
}