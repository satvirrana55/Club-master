import 'dart:convert';

import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:sportapp/api/api.dart';

class SignUpController extends GetxController {
  ApiManager apiManager = ApiManager();
  @override
  void onInit() {
    super.onInit();
  }

  bool? status;
  String? message;

  signup({String? email, String? phone}) async {
    var _resData = await apiManager.signUpApi(
      email: email,
      mobileNumber: phone,
    );
    status = json.decode(_resData)["status"];
    message = json.decode(_resData)["message"];
    update();
  }
}
