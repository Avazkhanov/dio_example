import 'package:dio_example/data/models/users_model.dart';

abstract class UsersEvent {}

class UsersGetEvent extends UsersEvent {}

class UsersUpdateEvent extends UsersEvent {
  final UserModel user;

  UsersUpdateEvent({
    required this.user,
  });
}

class UsersDeleteEvent extends UsersEvent {
  final String id;

  UsersDeleteEvent({
    required this.id,
  });
}

class UsersAddEvent extends UsersEvent {
  final UserModel user;

  UsersAddEvent({required this.user});
}
