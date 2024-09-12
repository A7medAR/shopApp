import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/layout/news_app/cubit/cubit.dart';
import 'package:untitled/layout/news_app/cubit/states.dart';
import 'package:untitled/shared/components/components.dart';

class SearchScreen extends StatelessWidget {
    SearchScreen({super.key});


  @override
  var searchController =TextEditingController();
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener:(context,state){},
      builder:(context,state)
      {

        var list=NewsCubit.get(context).search;

        return Scaffold(
        appBar: AppBar(
          title: const Text('Search'),
        ),
        body: Column(
          children:
          [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: defaultFormFiled(controller: searchController,
                  type: TextInputType.text,
                  validate: (String? value)
                  {
                    if(value!.isEmpty)
                      {
                        return 'cant be Empty';
                      }
                    return null;
                  },
                  label: 'Search',
                  prefix: Icons.search,
                functionChange: (value)
                {
                  NewsCubit.get(context).getSearch(value);
                },
              ),
            ),
            Expanded(child: Articlebuilder(context,list)),

          ],
        ),
      );}
    );
  }
}