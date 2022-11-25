import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:sportapp/api_urls/urls.dart';
import 'package:sportapp/module/authentication_modules/verify_otp_module.dart';
import 'package:sportapp/module/authentication_modules/sigup_module.dart';
import 'package:sportapp/module/get_city_list_module.dart';
import 'package:sportapp/module/get_state_list_module.dart';
import 'package:sportapp/network_manager/new_network_manager.dart';

class ApiManager {
  NewNetworkManager network = NewNetworkManager.instance;

  loginApi({
    String? mobileNumber,
  }) async {
    var _resData;
    log('inside logi');
    try {
      _resData = await (network.getData(
          path: '${sendOtp}' '?Mobilenumber=$mobileNumber'));
    } catch (e) {
      log(' hhhhhhhhhhhh $e');
    }
    log('respose ${json.decode(_resData)["status"]}');
    log('respose $_resData');

    return _resData;
  }

  verifyOtp({
    String? mobileNumber,
    String? otp,
    print(username)?,
  }) async {
    var _resData;
    log('respose inside verifyOtp');
    try {
      _resData = await (network.getData(
          path: '${confirmoOtp}'
              '?otp=$otp'
              '&Mobilenumber=$mobileNumber'));
    } catch (e) {
      log(' hhhhhhhhhhhh $e');
    }
    return _resData;
  }

  signUpApi({
    String? email,
    String? mobileNumber,
    print(username)?,
  }) async {
    log('inside Signup');
    var _resData;
    try {
      _resData = await (network.postData(data: {
        "email": email,
        "password": "Satvir@12",
        "phoneNumber": mobileNumber
      }, path: RegisterAcedmy));
    } catch (e) {
      log('dde');
    }
    log('respose ${json.decode(_resData)["status"]}');

    return _resData;
  }

  StateListModule? stateListModule;
  Future getStateListApi() async {
    var _resData;
    log('respose inside verifyOtp');
    try {
      _resData = await (network.getData(path: getStateList));
    } catch (e) {
      log(' hhhhhhhhhhhh $e');
    }
    List jsonResponse = json.decode(_resData);

    return jsonResponse
        .map((job) => new StateListModule.fromJson(job))
        .toList();
  }

  Future<List<CityListModule>> getCityListApi(id) async {
    var _resData;
    log('respose inside verifyOtp');
    try {
      _resData = await (network.getData(path: '${getCityList}' '?stateId=$id'));
    } catch (e) {
      log(' hhhhhhhhhhhh $e');
    }

    final List<CityListModule> _cityList = cityListModuleFromJson(_resData);
    return _cityList;
  }

/* 
   commonApi({requestType: 'GET', path: "", token, data, table}) async {
    Map<dynamic, dynamic>? resData;

    if (requestType == 'POST') {
      resData = await netManager.postData(data: data, path: path, token: token);
      return resData;
    } else {
      resData = await netManager.getData(path, token);
      print("Response ggggg :- $resData");
      log('$resData');
      //  print("common api called 2 : - $resData");
    }

    if (resData != null && resData['status'] == 200 ||
        resData!['status'] == 201) {
      print("Response savedata jjjjj:- ${resData!['response']}");
      print(
          "Response savedata jkljkljklkjl:-  and $path and $table and $token");
      saveData(table, resData['response'], currentUserIdString);
      print("Inside SaveData 5555");
    } else {
      return false;
    }
    return;
  } */

}
