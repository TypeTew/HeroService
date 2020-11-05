import 'dart:convert';
import 'package:HeroServiceApp/model/LoginModel.dart';
import 'package:HeroServiceApp/model/NewsDetailModel.dart';
import 'package:HeroServiceApp/model/NewsModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class CallAPI {
  _setHeaders() =>
      {'Content-Type': 'application/json', 'Accept': 'application/json'};

  final String baseAPIURL =
      'https://www.itgenius.co.th/sandbox_api/flutteradvapi/public/api/';

  loginAPI(data) async {
    return await http.post(baseAPIURL + 'login',
        body: convert.jsonEncode(data), headers: _setHeaders());
  }

  // Read User Profile
  Future<LoginModel> getProfile(data) async {
    final response = await http.post(baseAPIURL + 'login',
        body: jsonEncode(data), headers: _setHeaders());
    if (response.statusCode == 200) {
      return loginModelFromJson(response.body);
    } else {
      return null;
    }
  }

  // Read News
  Future<List<NewsModel>> getNews() async {
    final response =
        await http.get(baseAPIURL + 'news', headers: _setHeaders());
    if (response.body != null) {
      return newsModelFromJson(response.body);
    } else {
      return null;
    }
  }

  // Read lastNews
  Future<List<NewsModel>> getLastNews() async {
    final response =
        await http.get(baseAPIURL + 'lastnews', headers: _setHeaders());
    if (response.body != null) {
      return newsModelFromJson(response.body);
    } else {
      return null;
    }
  }

  // Read All News
  Future<List<NewsModel>> getAllNews() async {
    final response =
        await http.get(baseAPIURL + 'news', headers: _setHeaders());
    if (response.body != null) {
      return newsModelFromJson(response.body);
    } else {
      return null;
    }
  }

  // Read News Detail By ID
  Future<NewsDetailModel> getNewsDetail(id) async {
    final response =
        await http.get(baseAPIURL + 'news/' + id, headers: _setHeaders());
    if (response.body != null) {
      return newsDetailModelFromJson(response.body);
    } else {
      return null;
    }
  }
}
