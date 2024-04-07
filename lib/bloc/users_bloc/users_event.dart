import 'package:dio_example/data/models/users_model.dart';

abstract class UsersEvent {}

class UsersGetEvent extends UsersEvent {}

class UsersUpdateEvent extends UsersEvent {}

class UsersDeleteEvent extends UsersEvent {}

class UsersAddEvent extends UsersEvent {
  final UserModel user;

  UsersAddEvent({required this.user});
}
