import 'package:dio_example/data/api_provider/api_provider.dart';
import 'package:dio_example/data/models/users_model.dart';

class UserRepository {
  static Future<List<UserModel>> getAllUser() async => ApiProvider.getUsers();

  static Future<void> insertUser(UserModel userModel) async =>
      ApiProvider.insertUser(userModel);
}