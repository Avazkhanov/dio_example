import 'package:dio_example/bloc/users_bloc/users_bloc.dart';
import 'package:dio_example/bloc/users_bloc/users_event.dart';
import 'package:dio_example/data/models/users_model.dart';
import 'package:dio_example/screens/add_users/widgets/add_textfield.dart';
import 'package:dio_example/utils/styles/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddUsersScreen extends StatelessWidget {
  const AddUsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController firstNameController = TextEditingController();
    TextEditingController lastNameController = TextEditingController();
    TextEditingController ageController = TextEditingController();
    TextEditingController birthDateController = TextEditingController();
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new),
            onPressed: () => Navigator.pop(context),
          ),
          title: const Text('Add Users'),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w),
          child: Column(
            children: [
              SizedBox(height: 30.h),
              AddTextField(label: "Name", controller: firstNameController),
              SizedBox(height: 20.h),
              AddTextField(label: "Last Name", controller: lastNameController),
              SizedBox(height: 20.h),
              AddTextField(label: "Age", controller: ageController),
              SizedBox(height: 20.h),
              AddTextField(
                  label: "Birth Date", controller: birthDateController),
              const Spacer(),
              Ink(
                height: 40.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  color: Colors.amber,
                ),
                child: InkWell(
                  onTap: () {
                    context.read<UsersBloc>().add(
                          UsersAddEvent(
                            user: UserModel(
                              uuid: "",
                              firstName: firstNameController.text,
                              lastName: lastNameController.text,
                              birthDate: birthDateController.text,
                              age: int.parse(ageController.text),
                              profileImage: "https://img.freepik.com/free-photo/artist-white_1368-3546.jpg",
                            ),
                          ),
                        );
                    Navigator.pop(context);
                  },
                  borderRadius: BorderRadius.circular(20.r),
                  child: Center(
                    child: Text(
                      "Save",
                      style: AppStyle.interNunitoBold
                          .copyWith(fontSize: 22.sp, color: Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ));
  }
}
