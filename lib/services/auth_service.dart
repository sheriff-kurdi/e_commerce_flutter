import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:localstorage/localstorage.dart';

class AuthService{
  final LocalStorage storage = LocalStorage("auth");

  Future<bool> login(String userName, String password) async {
    String token;
    final headers = {'Content-Type': 'application/json'};
    Map<String, dynamic> body = {'username': userName, 'password': password};
    String jsonBody = json.encode(body);
    final encoding = Encoding.getByName('utf-8');


    var url = Uri.parse('http://10.0.2.2:8080/login');
    var response = await http.post(
      url,
      headers: headers,
      body: jsonBody,
      encoding: encoding,);
    if (response.statusCode == 200) {
      token = response.headers["authentication"].toString();
      storage.setItem('token', token);
      return true;

    }else{
      return false;
    }

  }

}
