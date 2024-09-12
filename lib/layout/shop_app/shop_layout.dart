import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/layout/shop_app/cubit/cubit.dart';
import 'package:untitled/layout/shop_app/cubit/states.dart';
import 'package:untitled/modules/shop_app/login/shop_login.dart';
import 'package:untitled/modules/shop_app/search/search_screen.dart';
import 'package:untitled/shared/components/components.dart';

class ShopLayout extends StatelessWidget {
  const ShopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit=ShopCubit.get(context);
    return  BlocConsumer<ShopCubit,ShopStates>(
      listener: (context,state){},
      builder: (BuildContext context, state) {
        return  Scaffold(
          appBar: AppBar(
            title: Text('Salla'),
            actions: [IconButton(onPressed: (){navigatorTo(context, Search_Screen());}, icon: Icon(Icons.search))],
          ),
          body:cubit.bottomScreen[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index)
            {
              cubit.changeBottom(index);
            },
            currentIndex: cubit.currentIndex,
            items: 
          [
            BottomNavigationBarItem(icon: Icon(Icons.home),
            label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.apps),
                label: 'Categories'),
            BottomNavigationBarItem(icon: Icon(Icons.favorite),
                label: 'Favorites'),
            BottomNavigationBarItem(icon: Icon(Icons.settings),
                label: 'Settings'),

          ],
            
          ),
        );
      },
     
    );

  }
}
