import 'package:dio_example/bloc/users_bloc/users_bloc.dart';
import 'package:dio_example/bloc/users_bloc/users_event.dart';
import 'package:dio_example/data/models/users_model.dart';
import 'package:dio_example/screens/update_users/update_users_screen.dart';
import 'package:dio_example/utils/styles/app_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UsersItem extends StatelessWidget {
  const UsersItem({super.key, required this.users});

  final List<UserModel> users;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        var user = users[index];
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 0,
                  blurRadius: 10.w,
                  offset: Offset(0, 10.w), // changes position of shadow
                ),
              ]),
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => UpdateUsersScreen(user: user),
                ),
              );
            },
            borderRadius: BorderRadius.circular(15.r),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.black,
                  backgroundImage: NetworkImage(user.profileImage),
                ),
                SizedBox(width: 15.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user.firstName,
                      style: AppStyle.interNunitoBold.copyWith(fontSize: 18.sp),
                    ),
                    Text(
                      user.lastName,
                      style: AppStyle.interNunitoBold.copyWith(fontSize: 18.sp),
                    ),
                    Text(
                      user.birthDate,
                      style: AppStyle.interNunitoBold.copyWith(fontSize: 18.sp),
                    ),
                  ],
                ),
                const Spacer(),
                IconButton(
                    onPressed: () {
                      context
                          .read<UsersBloc>()
                          .add(UsersDeleteEvent(id: user.uuid));
                    },
                    icon: Icon(
                      CupertinoIcons.delete,
                      color: Colors.red,
                      size: 24.sp,
                    )),
                SizedBox(width: 15.w),
              ],
            ),
          ),
        );
      },
    );
  }
}
