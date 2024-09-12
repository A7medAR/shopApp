import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/layout/shop_app/cubit/cubit.dart';
import 'package:untitled/layout/shop_app/cubit/states.dart';
import 'package:untitled/shared/components/components.dart';

class Favorites_Screen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
        listener: (context, state) {},
        builder: (context, state) {
          final homeModel = ShopCubit.get(context).homeModel;
          final favoritesModel = ShopCubit.get(context).favoritesModel;
          if (homeModel != null && favoritesModel != null )
          {
            return ListView.separated(
              itemBuilder: (context,index)=>buildListProduct(favoritesModel!.data!.data![index].product!,context),
              separatorBuilder:(context,index)=>myDivider(),
              itemCount: favoritesModel!.data!.data!.length,
            );

          }
          else
            return Center(child: CircularProgressIndicator(),);
        }
    );
  }

}
