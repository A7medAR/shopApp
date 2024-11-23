import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:untitled/layout/social_app/cubit/cubit.dart';
import 'package:untitled/layout/social_app/social_layout.dart';
import 'package:untitled/layout/todo_app/home_layout.dart';
import 'package:untitled/layout/shop_app/cubit/cubit.dart';
import 'package:untitled/layout/shop_app/shop_layout.dart';
import 'package:untitled/modules/counter/Counter_Screen.dart';
import 'package:untitled/modules/home/Home_screen.dart';
import 'package:untitled/modules/messenger/Messenger_Screen.dart';
import 'package:untitled/modules/shop_app/login/shop_login.dart';
import 'package:untitled/shared/cubit/cubit.dart';
import 'package:untitled/shared/cubit/states.dart';
import 'package:untitled/shared/network/local/cahce_helper.dart';
import 'package:untitled/shared/network/remote/dio_helper.dart';
import 'package:untitled/shared/styles/themes.dart';
import 'firebase_options.dart';
import 'layout/news_app/cubit/cubit.dart';
import 'layout/news_app/news_layout.dart';
import 'shared/bloc_observer.dart';
import 'modules/BMI_app/bmi/BMI_Calculator.dart';
import 'modules/BMI_app/bmi/cubit/cubit.dart';
import 'modules/counter/cubit/cubit.dart';
import 'modules/login/Login_Screen.dart';
import 'modules/shop_app/on_boarding/on_boarding_screen.dart';
import 'modules/social_app/social_login/social_login_screen.dart';
import 'modules/user/Users_Screen.dart';
import 'modules/BMI_app/bmi_result/bmi_result_screen.dart';


void main() async
{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
   // options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
 await CacheHelper.init();


 // bool isDark =CacheHelper.getData(key: 'isDark');
  bool isDark=false;
Widget widget;

 bool? onBoarding =CacheHelper.getData(key: 'onBoarding');

  String? token =CacheHelper.getData(key: 'token');
  String? uId =CacheHelper.getData(key: 'uId');
print(uId);
// if(onBoarding != null)
// {
//   if(token != null) widget=ShopLayout();
//   else widget=ShopLoginScreen();
// }
// else
//   {widget=OnBoardingScreen();}
  if(uId != null)
  {
    widget=SocialLayout();
  }
  else{
    widget=SocialLoginScreen();

  }

  runApp(MyApp(isDark,widget
  ));
}

class MyApp extends StatelessWidget {
  final bool isDark;
  final Widget widget;

  MyApp(this.isDark,this.widget);

  @override
  Widget build(BuildContext context) {

        return MultiBlocProvider(
          providers: [

            BlocProvider(
            create: (context)=>AppCubit()..changeAppMode(
            fromShared: isDark,
            ),),
            BlocProvider(
                 create: (context)=>NewsCubit()..getBusiness()..getScience()..getSports(),
              ),
            BlocProvider(
              create: (context)=>ShopCubit()..getHomeData()..getCategories()..getFavorites()..getUserData(),
            ),
            BlocProvider(
              create: (context)=>SocialCubit()..getUserData()..getPosts()..getUsers(),
            ),
          ],
          child: BlocConsumer<AppCubit,AppStates>(
            listener: (context,state){},
            builder: (context,state)
            {
                  return  MaterialApp(
                            debugShowCheckedModeBanner: false,
                            theme: lightTheme,
                            darkTheme: darkTheme,
                            themeMode: AppCubit.get(context).isDark ? ThemeMode.dark:ThemeMode.light,
                            home: widget,

                     );

                  },
          ),
        );

  }
}
