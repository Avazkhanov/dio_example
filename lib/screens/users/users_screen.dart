import 'package:dio_example/bloc/users_bloc/users_bloc.dart';
import 'package:dio_example/bloc/users_bloc/users_event.dart';
import 'package:dio_example/bloc/users_bloc/users_state.dart';
import 'package:dio_example/data/models/users_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users'),
      ),
      body: BlocBuilder<UsersBloc, UsersState>(
        builder: (context, state) {
          if (state is UsersLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is UsersErrorState) {
            return Center(child: Text(state.message));
          }
          if (state is UsersLoadedState) {
            return ListView.builder(
              itemCount: state.users.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(state.users[index].lastName),
                  subtitle: Text(state.users[index].firstName),
                );
              },
            );
          }
          return const Center(child: Text("error"));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          UserModel user = UserModel(
            uuid: "",
            firstName: "Ali",
            lastName: "Falonchiyev",
            birthDate: "28",
            age: 21,
            profileImage: "",
          );
          context.read<UsersBloc>().add(UsersAddEvent(user: user));
        },
        backgroundColor: Colors.blue,
        shape: const CircleBorder(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
