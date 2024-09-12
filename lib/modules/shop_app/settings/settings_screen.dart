import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/layout/shop_app/cubit/cubit.dart';
import 'package:untitled/layout/shop_app/cubit/states.dart';
import 'package:untitled/shared/components/components.dart';
import 'package:untitled/shared/components/constants.dart';


class Settings_Screen extends StatelessWidget {
var formKey=GlobalKey<FormState>();
var nameController =TextEditingController();
var emailController =TextEditingController();
var phoneController =TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit,ShopStates>(
      listener: (context,state){},
      builder: (context,state){
        var model = ShopCubit.get(context).userModel;
        nameController.text = model?.data?.name ?? '';
        emailController.text = model?.data?.email ?? '';
        phoneController.text = model?.data?.phone ?? '';

        return SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: formKey,
                child: Column(

                  children: [
                     if(state is ShopLoadingUpdateUserState)
                       LinearProgressIndicator(),
                    SizedBox(
                      height: 20.0,
                    ),



                    defaultFormFiled(
                      controller: nameController,
                      type: TextInputType.name,
                      validate: (String? value) {
                        if (value!.isEmpty) {
                          return 'can\'t be empty';
                        }
                        return null;
                      },
                      label: 'User Name',
                      prefix: Icons.person,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    defaultFormFiled(controller: emailController,
                      type: TextInputType.emailAddress,
                      validate: (String? value) {
                        if (value!.isEmpty) {
                          return 'can\'t be empty';
                        }
                        return null;
                      },
                      label: 'Email Address',
                      prefix: Icons.email_outlined,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    defaultFormFiled(controller: phoneController,
                      type: TextInputType.phone,
                      validate: (String? value) {
                        if (value!.isEmpty) {
                          return 'can\'t be empty';
                        }
                        return null;
                      },
                      label: 'Phone',
                      prefix: Icons.phone_android_outlined,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    defaultButton(function: () {
                      if(formKey.currentState!.validate())
                      {
                        ShopCubit.get(context).updateUserData(
                            name: nameController.text,
                            email: emailController.text,
                            phone: phoneController.text,
                        );
                      }
                    },
                      text: 'update',
                      isUpperCase: true,
                      radius: 10.0,

                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    defaultButton(function: () {
                      signOut(context);
                    },
                      text: 'logout',
                      isUpperCase: true,
                      radius: 10.0,

                    ),
                  ],
                ),
              ),
            ),
        );


      },
    );
  }
}
