import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:nb_utils/nb_utils.dart';
import 'package:sportapp/api_urls/urls.dart';

class NewNetworkManager {
  NewNetworkManager._privateConstructor();

  static final NewNetworkManager instance =
      NewNetworkManager._privateConstructor();
  factory NewNetworkManager() {
    return instance;
  }

  String? readResponse(response) {
    switch (response.statusCode) {
      case 200:
      case 201:
        return response.body;
      default:
        throw (response.statusCode.toString());
    }
  }

  Future<String?> putData(
      {Map<String, dynamic>? data, String? path, String? token}) async {
    final response = await http.put(
      Uri.parse('$HOST$path'),
      body: jsonEncode(data),
      headers: token == null
          ? <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            }
          : {'Content-Type': 'application/json', 'Authorization': token},
    );
    return readResponse(response);
  }

  Future postData(
      {Map<String, dynamic>? data, String? path, String? token}) async {
    final response = await http.post(
      Uri.parse('$HOST$path'),
      body: jsonEncode(data),
      headers: token == null
          ? <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            }
          : {'Content-Type': 'application/json', 'Authorization': token},
    );
    log('${response.body}');
    return response.body;
  }

  Future getData({String? path, String? token}) async {
    log('data $HOST$path');
    final response = await http.get(
      Uri.parse('$HOST$path'),
      headers: token == null
          ? {
              'Content-Type': 'application/json; charset=UTF-8',
            }
          : {
              'Content-Type': 'application/json',
              'Authorization': token,
            },
    );
    return response.body;
  }

  Future uploadData(
      {required data,
      required List<String> files,
      String? filekey,
      required String token,
      String? path}) async {
    var headers = {'Authorization': token};
    var postUri = Uri.parse("$HOST$path");
    var request = new http.MultipartRequest("POST", postUri);
    request.fields.addAll(data);
    for (int i = 0; i < files.length; i++) {
      request.files.add(await http.MultipartFile.fromPath(filekey!, files[i]));
    }
    request.headers.addAll(headers);
    http.StreamedResponse _response = await request.send();
    var response = await http.Response.fromStream(_response);
    return readResponse(response);
  }
}
