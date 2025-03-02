import 'package:untitled/models/shop_app/login_model.dart';

abstract class ShopLoginStates {}

class ShopLoginInitialState extends ShopLoginStates{}

class ShopLoginLoadingState extends ShopLoginStates{}

class ShopLoginSuccessState extends ShopLoginStates
{
  final ShopLoginModel loginModel;

  ShopLoginSuccessState(this.loginModel);
}

class ShopChangePasswordVisibilityState extends ShopLoginStates{}


class ShopLoginErrorState extends ShopLoginStates
{

  final String error;

  ShopLoginErrorState(this.error);

}
