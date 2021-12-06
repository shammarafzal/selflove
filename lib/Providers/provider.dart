import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Provider extends GetConnect{

  Future<dynamic> getCategories() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    final response = await get('http://selflove.spphotography.info/api/fetchCategories', headers: {
      'Authorization': 'Bearer $token',
    });
    if(response.status.hasError){
      return Future.error(response.statusText!);
    }
    else{
      return response.body['categories'];
    }
  }
}
