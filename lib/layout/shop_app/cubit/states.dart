import 'package:untitled/models/shop_app/login_model.dart';

abstract class ShopStates{}

class ShopInitialState extends ShopStates{}

class ShopChangeBottomNavState extends ShopStates{}

class ShopLoadingHomeDataState extends ShopStates{}

class ShopSuccessHomeDataState extends ShopStates{}

class ShopErrorHomeDataState extends ShopStates
{

  String error;

  ShopErrorHomeDataState(this.error);

}

class ShopSuccessCategoriesDataState extends ShopStates{}

class ShopErrorCategoriesDataState extends ShopStates
{

  String error;

  ShopErrorCategoriesDataState(this.error);

}

class ShopSuccessChangeFavoritesDataState extends ShopStates{}

class ShopErrorChangeFavoritesDataState extends ShopStates
{

  String error;

  ShopErrorChangeFavoritesDataState(this.error);

}

class ShopSuccessGetFavoritesDataState extends ShopStates{}

class ShopLoadingGetFavoritesDataState extends ShopStates{}


class ShopErrorGetFavoritesDataState extends ShopStates
{

  String error;

  ShopErrorGetFavoritesDataState(this.error);

}

class ShopSuccessUserDataState extends ShopStates{
  final ShopLoginModel loginModel;
  ShopSuccessUserDataState(this.loginModel);
}

class ShopLoadingUserDataState extends ShopStates{}


class ShopErrorUserDataState extends ShopStates
{

  String error;

  ShopErrorUserDataState(this.error);

}

class ShopSuccessUpdateUserState extends ShopStates{
  final ShopLoginModel loginModel;
  ShopSuccessUpdateUserState(this.loginModel);
}

class ShopLoadingUpdateUserState extends ShopStates{}


class ShopErrorUpdateUserState extends ShopStates
{

  String error;

  ShopErrorUpdateUserState(this.error);

}

