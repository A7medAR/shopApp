import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/modules/BMI_app/bmi_result/bmi_result_screen.dart';

import 'cubit/cubit.dart';
import 'cubit/states.dart';

class BMI_Calculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text(
            'BMI_Calculator'
        ),
      ),
      body: BlocBuilder<BmiCubit,BmiStates>(

        builder: (BuildContext context, BmiStates state) {
          BmiCubit cubit = BmiCubit.get(context);
          return Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            cubit.changeMale(male: true);
                          },
                          child: Container(

                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: cubit.isMale ? Colors.blue : Colors.grey[400],
                            ),

                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image(
                                  image: AssetImage('images/male.png'),
                                  height: 90.0,
                                  width: 90.0,),
                                SizedBox(
                                  height: 15.0,
                                ),
                                Text(
                                  'MALE',
                                  style: TextStyle(
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20.0,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            cubit.changeMale(male: false);
                          },
                          child: Container(

                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: !cubit.isMale ? Colors.blue : Colors.grey[400],
                            ),

                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image(
                                  image: AssetImage('images/female.png'),
                                  height: 90.0,
                                  width: 90.0,),
                                SizedBox(
                                  height: 15.0,
                                ),
                                Text(
                                  'FEMALE',
                                  style: TextStyle(
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.grey[400],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'HEIGHT',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25.0,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              ' ${cubit.height.round()} ',
                              style: const TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 40.0,
                              ),
                            ),
                            const SizedBox(
                              width: 5.0,
                            ),
                            const Text(
                              'CM',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Slider(value: cubit.height,
                          max: 220.0,
                          min: 80.0,
                          onChanged: (value) {
                            cubit.changeHeight(h: value);
                            print(value.round());
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.grey[400],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'WEIGHT',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25.0,
                                ),
                              ),
                              Text(
                                '${cubit.weight}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 40.0,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    child: FloatingActionButton(onPressed: () {
                                      cubit.minus();
                                    },
                                      heroTag: 'weight-',
                                      mini: true,
                                      child: const Icon(
                                        Icons.remove,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20.0,
                                  ),
                                  GestureDetector(
                                    child: FloatingActionButton(onPressed: () {
                                      cubit.plus();
                                    },
                                      heroTag: 'weight+',
                                      mini: true,
                                      child: const Icon(
                                        Icons.add,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20.0,
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.grey[400],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'AGE',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25.0,
                                ),
                              ),
                              Text(
                                '${cubit.age}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 40.0,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    child: FloatingActionButton(onPressed: () {
                                      cubit.minusAge();
                                    },
                                      heroTag: 'age-',
                                      mini: true,
                                      child: const Icon(
                                        Icons.remove,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20.0,
                                  ),
                                  GestureDetector(
                                    child: FloatingActionButton(onPressed: () {
                                      cubit.plusAge();
                                    },
                                      heroTag: 'age+',
                                      mini: true,
                                      child: const Icon(
                                        Icons.add,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                color: Colors.purpleAccent,
                child: MaterialButton(onPressed: () {
                  double result = cubit.weight / pow(cubit.height / 100, 2);
                  print(result.round());
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) =>
                          BMI_Result(
                            age: cubit.age,
                            isMale: cubit.isMale,
                            result: result.round(),
                          )),
                  );
                },
                  height: 50.0,
                  child: const Text(
                    'CALCULATE',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              )

            ],
          );
        },

      ),
    );
  }
}
