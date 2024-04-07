import 'package:dio/dio.dart';
import 'package:dio_example/data/models/users_model.dart';
import 'package:dio_example/utils/app_constants/app_constants.dart';
import 'package:flutter/cupertino.dart';

class ApiProvider {
  static Future<List<UserModel>> getUsers() async {
    List<UserModel> users = [];
    Dio dio = Dio();
    try {
      Response response = await dio.get(AppConstants.baseUrl,options: Options(
        headers: {

          "Content-Type": "application/json",
          "Authorization": "Bearer ${AppConstants.apiKey}",
        }
      ));
      if (response.statusCode ==  200) {
        users = (response.data as List?)
                ?.map((e) => UserModel.fromJson(e))
                .toList() ??
            [];
      }
    } catch (error) {
      debugPrint(error.toString());
    }
    return users;
  }
  static Future<void> insertUser(UserModel userModel) async{
    Dio dio = Dio();
    try {
      Response response = await dio.post(AppConstants.baseUrl,data: userModel.toJson(),options: Options(
        headers: {

          "Content-Type": "application/json",
          "Authorization": "Bearer ${AppConstants.apiKey}",
        }
      ));
      if (response.statusCode ==  200) {
        print(response.data);
      }
    } catch (error) {
      debugPrint(error.toString());
    }
  }
}
