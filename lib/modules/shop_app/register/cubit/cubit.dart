import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/layout/shop_app/shared/network/end_points.dart';
import 'package:untitled/layout/shop_app/shared/network/remote/dio_helper.dart';
import 'package:untitled/models/shop_app/login_model.dart';
import 'package:untitled/modules/shop_app/login/cubit/states.dart';
import 'package:untitled/modules/shop_app/register/cubit/states.dart';


class ShopRegisterCubit extends Cubit<ShopRegisterStates>
{
  ShopRegisterCubit():super(ShopRegisterInitialState());

  static ShopRegisterCubit get(context)=> BlocProvider.of(context);
  late ShopLoginModel loginModel;
bool isPassword=true;
  IconData suffix=Icons.visibility_off_outlined;
  void changePassword(){
    isPassword= !isPassword;
    suffix=isPassword?Icons.visibility_off_outlined:Icons.visibility_outlined;
    emit(ShopRegisterChangePasswordVisibilityState());
  }
  void userRegister({
    required String name,
    required String email,
    required String password,
    required String phone,

  })
  {
    emit(ShopRegisterLoadingState());
    DioHelper.postData(
      url: REGISTER,
      data: {
        'name' :name,
        'email' :email,
        'password':password,
        'phone' :phone,

      },

    ).then((value) {
      print(value.data);
      loginModel=ShopLoginModel.fromJson(value.data);
      print(loginModel.data?.name);
      emit(ShopRegisterSuccessState(loginModel));
    }).catchError((error)
    {
      emit(ShopRegisterErrorState(error.toString()));
      print(error.toString());
    }
    );
  }

}