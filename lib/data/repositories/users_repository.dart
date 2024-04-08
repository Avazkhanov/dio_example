import 'package:dio_example/data/api_provider/api_provider.dart';
import 'package:dio_example/data/models/users_model.dart';

class UserRepository {
  ApiProvider apiProvider = ApiProvider();

   Future<List<UserModel>> getAllUser() async => apiProvider.getUsers();

   Future<void> insertUser(UserModel userModel) async =>
      apiProvider.insertUser(userModel);

   Future<void> updateUser(UserModel userModel) async =>
      apiProvider.updateUser(userModel);

   Future<void> deleteUser(String uuid) async =>
      apiProvider.deleteUser(uuid);
}
