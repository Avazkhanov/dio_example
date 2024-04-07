import 'package:bloc/bloc.dart';
import 'package:dio_example/bloc/users_bloc/users_event.dart';
import 'package:dio_example/bloc/users_bloc/users_state.dart';
import 'package:dio_example/data/models/users_model.dart';
import 'package:dio_example/data/repositories/users_repository.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  UsersBloc() : super(UsersInitialState()) {
    on<UsersGetEvent>(_getUsers);
    on<UsersAddEvent>(_insertUser);
  }

  Future<void> _getUsers(UsersGetEvent event, Emitter<UsersState> emit) async {
    emit(UsersLoadingState());
    List<UserModel> users = await UserRepository.getAllUser();
    if (users.isEmpty) {
      emit(UsersErrorState(message: "Nomalum xatolik"));
    } else {
      emit(UsersLoadedState(users: users));
    }
  }

  Future<void> _insertUser(
      UsersAddEvent event, Emitter<UsersState> emit) async {
    emit(UsersLoadingState());
    await UserRepository.insertUser(event.user);
    add(UsersGetEvent());
  }
}
