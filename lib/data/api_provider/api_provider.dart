import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dio_example/data/models/users_model.dart';
import 'package:dio_example/utils/app_constants/app_constants.dart';
import 'package:flutter/cupertino.dart';

class ApiProvider {
  static Dio dio = Dio();

  static Future<List<UserModel>> getUsers() async {
    List<UserModel> users = [];
    try {
      Response response = await dio.get("${AppConstants.baseUrl}/api/v1/users",
          options: Options(headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer ${AppConstants.apiKey}",
          }));
      if (response.statusCode == 200) {
        users = (response.data['items'] as List)
            .map((e) => UserModel.fromJson(e))
            .toList();
      }
    } catch (error) {
      debugPrint('getUsers error: $error');
    }
    return users;
  }

  static Future<void> insertUser(UserModel userModel) async {
    try {
      Response response = await dio.post("${AppConstants.baseUrl}/api/v1/users",
          data: jsonEncode([userModel.toJson()]),
          options: Options(headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer ${AppConstants.apiKey}",
          }));
      if (response.statusCode == 201) {
        print(response.data);
      }
    } catch (error) {
      debugPrint('insertUser error: $error');
    }
  }

  static Future<void> updateUser(UserModel userModel) async {
    try {
      Response response = await dio.put(
        "${AppConstants.baseUrl}/api/v1/users/${userModel.uuid}",
        data: userModel.toJsonForUpdate(),
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer ${AppConstants.apiKey}",
          },
        ),
      );
      if (response.statusCode == 200) {
        print(response.data);
      }
    } catch (error) {
      debugPrint('updateUser error: $error');
    }
  }

  static Future<void> deleteUser(String uuid) async {
    try {
      Response response =
          await dio.delete("${AppConstants.baseUrl}/api/v1/users/$uuid",
              options: Options(headers: {
                "Content-Type": "application/json",
                "Authorization": "Bearer ${AppConstants.apiKey}",
              }));
      if (response.statusCode == 200) {
        print(response.data);
      }
    } catch (error) {
      debugPrint('deleteUser error: $error');
    }
  }
}
