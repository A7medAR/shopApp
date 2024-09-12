import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/modules/counter/cubit/cubit.dart';
import 'cubit/states.dart';

class CounterScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
        title:const Text (
        'Counter',
        ),
        ),
        body: BlocBuilder<CounterCubit,CounterStates>(
          builder: (context,state){
         final   CounterCubit cubit=CounterCubit.get(context);
         return  Center(
          child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          TextButton(onPressed: (){

          cubit.minus();
          print(cubit.counter);
          },
          child: const Text('MIENS',
          ),
          ),
          Padding(
          padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          ),
          child: Text(

           '${cubit.counter}',

          style: const TextStyle(
          fontWeight: FontWeight.w300,
          fontSize:50.0,
          ),
          ),

          ),
          TextButton(onPressed: (){

          cubit.plus();
          print(cubit.counter);
          },
          child: const Text('PLUS',
          ),
          ),
          ],
          ),
          );
          },
        ),
        );
  }
}
