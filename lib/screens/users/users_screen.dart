import 'package:dio_example/bloc/users_bloc/users_bloc.dart';
import 'package:dio_example/bloc/users_bloc/users_event.dart';
import 'package:dio_example/bloc/users_bloc/users_state.dart';
import 'package:dio_example/data/models/users_model.dart';
import 'package:dio_example/screens/add_users/add_users.dart';
import 'package:dio_example/screens/users/widgets/users_item.dart';
import 'package:flutter/cupertino.dart';
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
            return UsersItem(users: state.users);
          }
          return const Center(child: Text("error"));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()  {
          Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) => const AddUsersScreen(),
            ),
          );
        },
        backgroundColor: Colors.blue,
        shape: const CircleBorder(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
