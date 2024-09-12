import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/layout/news_app/cubit/states.dart';
import 'package:untitled/modules/search/search_screen.dart';
import 'package:untitled/shared/components/components.dart';
import 'package:untitled/layout/shop_app/shared/cubit/cubit.dart';
import 'cubit/cubit.dart';


class NewsLayout extends StatelessWidget {
  const NewsLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
        listener: (context,state){},
        builder: (BuildContext context, NewsStates state) {
      NewsCubit cubit = NewsCubit.get(context);
      return  Scaffold(
        appBar: AppBar(
          title: const Text('News App'),
          actions: [
              IconButton(onPressed: (){
                navigatorTo(context, SearchScreen(),);
              }, icon: const Icon(
                Icons.search,
              ),),
              IconButton(onPressed: (){
                AppCubit.get(context).changeAppMode();
              }, icon: const Icon(
                Icons.brightness_4_outlined,
              ),),

          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: cubit.currentIndex,
          onTap: (index){
            cubit.ChangeBottomNavBar(index);
          },
          items:cubit.bottomItems,
        ),
        body: cubit.screens[cubit.currentIndex],
      );
       });
 }
}
