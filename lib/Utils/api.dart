import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:self_love/Models/fetchMeditations.dart';
import 'package:self_love/Models/get_categories.dart';
import 'package:self_love/Models/get_fitness.dart';
import 'package:self_love/Models/get_me.dart';
import 'package:self_love/Models/get_suggestion.dart';
import 'package:shared_preferences/shared_preferences.dart';

class API {
  static var client = http.Client();
  final String baseUrl = 'selflove.spphotography.info';
  var image_base_url = 'http://selflove.spphotography.info/storage/';
  register(String name, String email, String password, String confirm_password) async {
    var url = Uri.http(baseUrl, '/api/register', {"q": "dart"});
    final response = await http.post(url, body: {
      "name": name,
      "email": email,
      "password": password,
      "password_confirmation": confirm_password,
      "token": "13"
    });
    if (response.statusCode == 200) {
      final String responseString = response.body;
      return jsonDecode(responseString);
    } else if (response.statusCode == 500) {
      final String responseString = response.body;
      return jsonDecode(responseString);
    } else {
      final String responseString = response.body;
      return jsonDecode(responseString);
    }
  }
  verifyEmailToken(String token, String email) async {
    var url = Uri.http(baseUrl, '/api/verifyEmail', {"q": "dart"});
    final response = await http.post(url, body: {
      "token": token,
      "email": email
    });
    if (response.statusCode == 200) {
      final String responseString = response.body;
      return jsonDecode(responseString);
    } else if (response.statusCode == 400) {
      final String responseString = response.body;
      return jsonDecode(responseString);
    } else if (response.statusCode == 404) {
      final String responseString = response.body;
      return jsonDecode(responseString);
    } else if (response.statusCode == 500) {
      final String responseString = response.body;
      return jsonDecode(responseString);
    } else {
      final String responseString = response.body;
      return jsonDecode(responseString);
    }
  }
  login(String email, String password) async {
    var url = Uri.http(baseUrl, '/api/login', {"q": "dart"});
    final response = await http.post(url, body: {
      "email": email,
      "password": password,
    });
    if (response.statusCode == 200) {
      final String responseString = response.body;
      return jsonDecode(responseString);
    } else if (response.statusCode == 401) {
      final String responseString = response.body;
      return jsonDecode(responseString);
    } else if (response.statusCode == 500) {
      final String responseString = response.body;
      return jsonDecode(responseString);
    } else {
      final String responseString = response.body;
      return jsonDecode(responseString);
    }
  }
  logout() async {
    var url = Uri.http(baseUrl, '/api/logout', {"q": "dart"});
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final String responseString = response.body;
      return jsonDecode(responseString);
    } else if (response.statusCode == 401) {
      final String responseString = response.body;
      return jsonDecode(responseString);
    } else if (response.statusCode == 500) {
      final String responseString = response.body;
      return jsonDecode(responseString);
    } else {
      final String responseString = response.body;
      return jsonDecode(responseString);
    }
  }

    Future<List<Category>> getCategories() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    var url = Uri.http(baseUrl, '/api/fetchCategories', {"q": "dart"});
    var response = await client.get(url, headers: {
      'Authorization': 'Bearer $token',
    });
    if(response.statusCode == 200){
        return categoryFromJson(response.body);
    }
    else{
        return categoryFromJson(response.statusCode.toString());
    }
  }

  Future<List<FetchMeditations>> fetchMeditation() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    var url = Uri.http(baseUrl, '/api/fetchMeditations', {"q": "dart"});
    var response = await client.get(url, headers: {
      'Authorization': 'Bearer $token',
    });
    if(response.statusCode == 200){
        return fetchMeditationsFromJson(response.body);
    }
    else{
        return fetchMeditationsFromJson(response.statusCode.toString());
    }
  }

  Future<List<Fitness>> getFitnesses(String cat_id) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    var url = Uri.http(baseUrl, '/api/fetchFitnesses', {"q": "dart"});
    var response = await client.post(url, body: {
      "category_id": cat_id
    },headers: {
      'Authorization': 'Bearer $token',
    });
    if(response.statusCode == 200){
      return fitnessFromJson(response.body);
    }
    else{
      return fitnessFromJson(response.statusCode.toString());
    }
  }
  Future<List<Suggestion>> getSuggestions() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    var url = Uri.http(baseUrl, '/api/todayFitnessSugestions', {"q": "dart"});
    var response = await client.get(url, headers: {
      'Authorization': 'Bearer $token',
    });
    if(response.statusCode == 200){
      return suggestionFromJson(response.body);
    }
    else{
      return suggestionFromJson(response.statusCode.toString());
    }
  }
  Future<List<Me>> getMe() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    var url = Uri.http(baseUrl, '/api/user', {"q": "dart"});
    var response = await client.get(url, headers: {
      'Authorization': 'Bearer $token',
    });
    if(response.statusCode == 200){
      return meFromJson(response.body);
    }
    else{
      return meFromJson(response.statusCode.toString());
    }
  }

}
