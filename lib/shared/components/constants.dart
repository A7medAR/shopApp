import 'package:untitled/layout/shop_app/shared/network/local/cahce_helper.dart';
import 'package:untitled/modules/shop_app/login/shop_login.dart';
import 'package:untitled/modules/social_app/social_login/social_login_screen.dart';
import 'package:untitled/shared/components/components.dart';

void signOut(context)
{
  CacheHelper.removeData(key: 'token').then((value) {navigatorToAndFinish(context,
     ShopLoginScreen()); });
}
String uId=CacheHelper.getData(key: 'uId');
// String uId='';
String token=CacheHelper.getData(key: 'token');