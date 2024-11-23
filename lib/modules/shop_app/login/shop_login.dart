import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:untitled/shared/network/local/cahce_helper.dart';
import 'package:untitled/layout/shop_app/shop_layout.dart';
import 'package:untitled/modules/shop_app/login/cubit/cubit.dart';
import 'package:untitled/modules/shop_app/login/cubit/states.dart';
import 'package:untitled/shared/components/components.dart';
import 'package:untitled/shared/components/constants.dart';
import '../register/shop_register_screen.dart';

class ShopLoginScreen extends StatelessWidget {

var emailController=TextEditingController();
var passwordController=TextEditingController();
var formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context)=>ShopLoginCubit(),
      child: BlocConsumer<ShopLoginCubit,ShopLoginStates>(
        listener: (context,state)
        {

          if(state is ShopLoginSuccessState )
            {
              if(state.loginModel.status!)
                {
                  showToast(text: state.loginModel.message!, state: ToastStates.SUCCESS,);
                  CacheHelper.saveData(key: 'token', value: state.loginModel.data?.token).then((value) {
                    token =state.loginModel.data!.token!;
                    navigatorToAndFinish(context, ShopLayout());
                  });
                  print(state.loginModel.data?.name);
                }
              else
              {
                showToast(text: state.loginModel.message!, state: ToastStates.ERROR,);

              }
            }

        },
    builder: (BuildContext context, ShopLoginStates state) {
          ShopLoginCubit cubit=ShopLoginCubit.get(context);
        return Scaffold(
          appBar: AppBar(),
          body:Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'LOGIN',
                          style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      Text(
                        'Login now to browse our hot offers',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.grey),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      defaultFormFiled(
                        controller: emailController,
                        type: TextInputType.emailAddress,
                          validate: (String? value) {
                        if(value!.isEmpty)
                          {
                            return 'must not be empty';
                          }
                          },
                          label: 'Email Address',
                          prefix: Icons.email,
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      defaultFormFiled(
                        controller: passwordController,
                        type: TextInputType.emailAddress,
                        validate: (String? value) {
                          if(value!.isEmpty)
                          {
                            return 'must not be empty';
                          }
                        },
                        label: 'Password',
                        prefix: Icons.lock,
                        suffix: cubit.suffix,
                        isPassword: cubit.isPassword,
                        OnSubmit: (value)
                        {
                          if(formKey.currentState!.validate())
                        {
                          cubit.userLogin(email: emailController.text, password: passwordController.text);
                        };
                        },
                        suffixPressed:(){
                          cubit.changePassword();
                          } ,
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      defaultButton(function: (){
                        if(formKey.currentState!.validate())
                      {  cubit.userLogin(email: emailController.text, password: passwordController.text);}
                      },
                        text: 'login',
                      isUpperCase: true,
                        radius: 10.0,
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Don\'t have an account?'
                          ),
                          TextButton(onPressed: (){
                            navigatorTo(context, ShopRegisterScreen());
                          }, child: Text('REGISTER'),)
                        ],
                      ),

                    ],
                  ),
                ),
              ),
            ),
          )
        );}
      ),
    );
  }
}
