

import 'package:getx_hr_management/data/network_apiServices.dart';
import 'package:getx_hr_management/res/url/urls.dart';

class RegisterRepository{

  final _apiServices = NetworkApiServices();

  Future<dynamic>registerApi(Map data)async{
    final response = _apiServices.postApi(data,AppURL.registerUrl);
    return response;
  }
}