import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:untitled/shared/components/components.dart';
import 'package:untitled/layout/shop_app/shared/cubit/cubit.dart';
import 'package:untitled/layout/shop_app/shared/cubit/states.dart';




class HomeLayout extends StatelessWidget
{

  @override

  var scaffoldKey=GlobalKey<ScaffoldState>();

  var formKey=GlobalKey<FormState>();

  var titleController=TextEditingController();

  var timeController=TextEditingController();

  var dateController=TextEditingController();

  @override
  Widget build(BuildContext context) {
     AppCubit cubit=AppCubit.get(context);

    return BlocBuilder<AppCubit,AppStates>(
      builder: (context,state){
        return Scaffold(
          appBar: AppBar(
            title: Text(cubit.titles[cubit.currentIndex],),
            backgroundColor: Colors.purpleAccent[100],
          ),
          body: cubit.screens[cubit.currentIndex] ,
          floatingActionButton: FloatingActionButton(onPressed: ()
          {
            if(cubit.isBottomSheetShown){
              if(formKey.currentState!.validate()){
                cubit.insertDatabase(title: titleController.text, date: dateController.text, time: timeController.text);
              }

            }else
            {
              scaffoldKey.currentState!.showBottomSheet((context) =>Container(
                color: Colors.grey[100],
                padding: const EdgeInsets.all(20.0,),
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      defaultFormFiled(controller: titleController,
                          type: TextInputType.text, validate: (String? value){
                            if(value!.isEmpty)
                            {
                              return 'cant be empty';
                            }
                             return null;
                          }
                          , label: 'Title Task', prefix: Icons.title),
                      const SizedBox(
                        height: 15.0,
                      ),
                      defaultFormFiled(controller: timeController,
                          type: TextInputType.datetime,
                          validate: (String? value){
                            if(value!.isEmpty)
                            {
                              return 'cant be empty';
                            }
                            return null;
                          },
                          label: 'Time Task',
                          prefix: Icons.watch_later_outlined,
                          onTap: (){
                            showTimePicker(context: context, initialTime:TimeOfDay.now(),).then((value) {
                              timeController.text=value!.format(context).toString();
                            });
                          }
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      defaultFormFiled(controller: dateController,
                          type: TextInputType.datetime,
                          validate: (String? value){
                            if(value!.isEmpty)
                            {
                              return 'cant be empty';
                            }
                            return null;
                          },
                          label: 'Date Task',
                          prefix: Icons.calendar_today,
                          onTap: (){
                            showDatePicker(context: context, firstDate: DateTime.now(), lastDate: DateTime.parse('2024_03_16'),).
                            then((value) {
                              if (value != null) {
                                dateController.text = DateFormat.yMMMd().format(value);
                                cubit.changeBottomSheetState(isShow: true, icon: Icons.add);
                              }
                            } );
                          }
                      ),

                    ],
                  ),
                ),
              ),).closed.then((value) {
                cubit.changeBottomSheetState(isShow: false, icon: Icons.edit);
              });
              cubit.changeBottomSheetState(isShow: true, icon: Icons.add);

            }

          },
            child: Icon(cubit.fabIcon),

          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: cubit.currentIndex,
            onTap: (index){

                cubit.changeIndex(index);
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.menu),
                label: 'Tasks',),
              BottomNavigationBarItem(icon: Icon(Icons.check_circle_outline),
                label: 'Done',),
              BottomNavigationBarItem(icon: Icon(Icons.archive_outlined),
                label: 'Archived',),
            ],
          ),

        );
      },
    );
  }


}


