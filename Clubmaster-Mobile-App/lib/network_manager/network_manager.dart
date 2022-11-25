import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class NetworkManager {
  String? readResponse(response) {
    switch (response.statusCode) {
      case 200:
      case 201:
        return response.body;
      default:
        print(response.body);
        throw (response.statusCode.toString());
    }
  }

  static const HOST = "http://13.127.150.199/api/";

  Future<String?> logInData(
      {Map<String, dynamic>? data, String? path, String? token}) async {
    try {
      final response = await http.post(
        Uri.parse('$HOST$path'),
        body: jsonEncode(data),
        headers: token == null
            ? <String, String>{
                'Content-Type': 'application/json; charset=UTF-8',
              }
            : {'Content-Type': 'application/json', 'Authorization': token},
      );
      print(" LOGIIIIIIIIIIIIN : - ${response.statusCode}");
      return readResponse(response);
    } on SocketException {
      throw ("Unable to connect to server");
    } catch (e) {
      throw (e);
    }
  }

  Future<String?> putDatas({data, String? path, token}) async {
    print("OOOOOOOOOOOOOo :- ${jsonEncode(data)}");
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

  Future<Map<dynamic, dynamic>?> putData({data, String? path, token}) async {
    print("OOOOOOOOOOOOOo :- ${jsonEncode(data)}");
    final response = await http.put(
      Uri.parse('$HOST$path'),
      body: jsonEncode(data),
      headers: token == null
          ? <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            }
          : {'Content-Type': 'application/json', 'Authorization': token},
    );
    //return response.body;
    try {
      print("PPPPPPPPPPPPPPost : - ${response.body}");
      return {"status": response.statusCode, "response": response.body};
    } catch (e, s) {
      print("Exception $e");
      print("StackTrace $s");
      return null;
    }
  }

  Future<String?> postDatas({data, String? path, token}) async {
    print("OOOOOOOOOOOOOo :- $token");
    final response = await http.post(
      Uri.parse('$HOST$path'),
      body: jsonEncode(data),
      headers: token == null
          ? <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            }
          : {'Content-Type': 'application/json', 'Authorization': token},
    );
    //return response.body;
    try {
      print("PPPPPPPPPPPPPPost : - ${response.body}");
      return readResponse(response);
      // {"status": response.statusCode, "response": response.body};
    } catch (e, s) {
      print("Exception $e");
      print("StackTrace $s");
      return null;
    }
  }

  Future<Map<dynamic, dynamic>?> postData({data, String? path, token}) async {
    print("OOOOOOOOOOOOOo :- $data");
    // ignore: unused_local_variable
    final response = await http.post(
      Uri.parse('$HOST$path'),
      body: jsonEncode(data),
      headers: token == null
          ? <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            }
          : {'Content-Type': 'application/json', 'Authorization': token},
    );
    //return response.body;
    try {
      final response = await http.post(
        Uri.parse('$HOST$path'),
        body: jsonEncode(data),
        headers: token == null
            ? <String, String>{
                'Content-Type': 'application/json; charset=UTF-8',
              }
            : {'Content-Type': 'application/json', 'Authorization': token},
      );
      print("PPPPPPPPPPPPPPost : - ${response.body}");
      return {"status": response.statusCode, "response": response.body};
    } catch (e, s) {
      print("Exception $e");
      print("StackTrace $s");
      return null;
    }
  }

  Future<String?> getDatas(path, token) async {
    final response = await http.get(
      Uri.parse('$HOST$path'),
      headers: token == null
          ? <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            }
          : {'Content-Type': 'application/json', 'Authorization': token},
    );
    try {
      return readResponse(response);
      // {"status": response.statusCode, "response": response.body};
    } on Exception {
      return null;
    }
  }

  Future<Map<dynamic, dynamic>?> getData(path, token) async {
    final response = await http.get(
      Uri.parse('$HOST$path'),
      headers: token == null
          ? <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            }
          : {'Content-Type': 'application/json', 'Authorization': token},
    );
    try {
      return {"status": response.statusCode, "response": response.body};
    } on Exception {
      return null;
    }
  }

  Future uploadData(
      {required data,
      required List<String?> files,
      String? filekey,
      String? path}) async {
    print('inside upoad Meter Images');
    var postUri = Uri.parse("$HOST$path");
    var request = new http.MultipartRequest("POST", postUri);
    print('ppppppppppppppppppppppppppp');
    request.fields.addAll(data);

    print('ppppppppppppppppppppppppppp');
    print(files.length);
    for (int i = 0; i < files.length; i++) {
      request.files.add(await http.MultipartFile.fromPath(filekey!, files[i]!));
    }
    http.StreamedResponse _response = await request.send();
    var response = await http.Response.fromStream(_response);
    print('%%%%%%%%%%%%%%%$response');
    return readResponse(response);
  }
}
