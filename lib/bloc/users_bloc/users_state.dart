
import 'package:dio_example/data/models/users_model.dart';

abstract class UsersState {}

class UsersInitialState extends UsersState {}

class UsersLoadingState extends UsersState {}

class UsersLoadedState extends UsersState {
  final List<UserModel> users;

  UsersLoadedState({required this.users});
}

class UsersErrorState extends UsersState {
  final String message;
  UsersErrorState({required this.message});
}

class UsersEmptyState extends UsersState {}

