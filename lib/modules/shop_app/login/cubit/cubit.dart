import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/layout/shop_app/shared/network/end_points.dart';
import 'package:untitled/layout/shop_app/shared/network/remote/dio_helper.dart';
import 'package:untitled/models/shop_app/login_model.dart';
import 'package:untitled/modules/shop_app/login/cubit/states.dart';


class ShopLoginCubit extends Cubit<ShopLoginStates>
{
  ShopLoginCubit():super(ShopLoginInitialState());

  static ShopLoginCubit get(context)=> BlocProvider.of(context);
  late ShopLoginModel loginModel;
bool isPassword=true;
  IconData suffix=Icons.visibility_off_outlined;
  void changePassword(){
    isPassword= !isPassword;
    suffix=isPassword?Icons.visibility_off_outlined:Icons.visibility_outlined;
    emit(ShopChangePasswordVisibilityState());
  }
  void userLogin({
    required String email,
    required String password,
  })
  {
    emit(ShopLoginLoadingState());
    DioHelper.postData(url: LOGIN,
      data: {
        'email' :email,
        'password':password,
      },

    ).then((value) {
      print(value.data);
      loginModel=ShopLoginModel.fromJson(value.data);
      print(loginModel.data?.name);
      emit(ShopLoginSuccessState(loginModel));
    }).catchError((error)
    {
      emit(ShopLoginErrorState(error.toString()));
      print(error.toString());
    }
    );
  }

}