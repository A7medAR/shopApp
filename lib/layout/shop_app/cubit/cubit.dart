import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/layout/shop_app/cubit/states.dart';
import 'package:untitled/shared/network/end_points.dart';
import 'package:untitled/models/shop_app/categories_model.dart';
import 'package:untitled/models/shop_app/change_favorites_model.dart';
import 'package:untitled/models/shop_app/favorites_model.dart';
import 'package:untitled/models/shop_app/home_model.dart';
import 'package:untitled/models/shop_app/login_model.dart';
import 'package:untitled/modules/shop_app/cateogries/categories_screen.dart';
import 'package:untitled/modules/shop_app/favorites/favorites_screen.dart';
import 'package:untitled/modules/shop_app/products/products_screen.dart';
import 'package:untitled/modules/shop_app/settings/settings_screen.dart';
import 'package:untitled/shared/components/constants.dart';

import '../../../shared/network/remote/dio_helper.dart';


class ShopCubit extends Cubit<ShopStates> {
  ShopCubit() : super(ShopInitialState());

  static ShopCubit get(context) => BlocProvider.of(context);
int  currentIndex=0;

List<Widget> bottomScreen=
[
ProductsScreen(),
CategoriesScreen(),
Favorites_Screen(),
Settings_Screen(),
];

void changeBottom(int index)
{
  currentIndex=index;
  emit(ShopChangeBottomNavState());
}

  HomeModel? homeModel;
Map<int,bool> favorites ={};
void getHomeData(){

  emit(ShopLoadingHomeDataState());
  DioHelper.getData(
      url: HOME,
      token: token,
  ).then((value)
  {
    homeModel=HomeModel.fromJson(value.data);
    homeModel?.data.products.forEach((element)
    {
      favorites.addAll({
        element.id :element.inFavorites,
      });
    });
print(favorites.toString());
    emit(ShopSuccessHomeDataState());
  }).catchError((error){
    emit(ShopErrorHomeDataState(error.toString()));
    print(error.toString());});
}

  CategoriesModel? categoriesModel;

  void getCategories(){


    DioHelper.getData(
        url: GET_GATEGORIES,
        token: token,
    ).then((value) {
      categoriesModel=CategoriesModel.fromJson(value.data);
      emit(ShopSuccessCategoriesDataState());
    }).catchError((error){
      emit(ShopErrorCategoriesDataState(error.toString()));
      print(error.toString());});
  }
  ChangeFavoritesModel? changeFavoritesModel;
  void changeFavorites(int productId)
  {
    favorites[productId]=! favorites[productId]!;
    emit(ShopSuccessChangeFavoritesDataState());
    DioHelper.postData(

      url: FAVORITES,
        data: {
      'product_id':productId,
        },
      token: token,
    ).then((value) {
      changeFavoritesModel=ChangeFavoritesModel.fromJson(value.data);
      print(value.data);
      if(!changeFavoritesModel!.status)
        {
          favorites[productId]=! favorites[productId]!;
        }
      else{
        getFavorites();
      }
      emit(ShopSuccessChangeFavoritesDataState());
    }).catchError((error){
      favorites[productId]=! favorites[productId]!;
      emit(ShopErrorChangeFavoritesDataState(error));
      print(error.toString());
    });
  }

  FavoritesModel? favoritesModel;

  void getFavorites(){

     emit(ShopLoadingGetFavoritesDataState());
    DioHelper.getData(
      url: FAVORITES,
      token: token,
    ).then((value) {
      favoritesModel=FavoritesModel.fromJson(value.data);
      emit(ShopSuccessGetFavoritesDataState());
    }).catchError((error){
      emit(ShopErrorGetFavoritesDataState(error.toString()));
      print(error.toString());});
  }

  ShopLoginModel? userModel;

  void getUserData() {
    emit(ShopLoadingUserDataState());
    try {
      DioHelper.getData(
        url: PROFILE,
        token: token,
      ).then((value) {
        userModel = ShopLoginModel.fromJson(value.data);
        emit(ShopSuccessUserDataState(userModel!));
      });
    } catch (error) {
      emit(ShopErrorUserDataState(error.toString()));
      print(error.toString());
    }
  }

  void updateUserData({
    required String name,
    required String email,
    required String phone,

  }) {
    emit(ShopLoadingUpdateUserState());
    try {
      DioHelper.putData(
        url: UPDATE_PROFILE,
        data:{
          'name':name,
          'email':email,
          'phone':phone,

        } ,
        token: token,
      ).then((value) {
        userModel = ShopLoginModel.fromJson(value.data);
        emit(ShopSuccessUpdateUserState(userModel!));
      });
    } catch (error) {
      emit(ShopErrorUpdateUserState(error.toString()));
      print(error.toString());
    }
  }
}