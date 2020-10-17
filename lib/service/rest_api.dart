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
}
