import 'package:getx_hr_management/data/network_apiServices.dart';
import 'package:getx_hr_management/res/url/urls.dart';

class LoginRepository {
  final _apiService = NetworkApiServices();

  Future<dynamic> loginApi(Map data) async {

    dynamic response = _apiService.postApi(data, AppURL.loginUrl);
    print("response : $response");
    return response;
  }


}
