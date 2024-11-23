import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/modules/BMI_app/bmi/cubit/states.dart';

class BmiCubit extends Cubit<BmiStates>
{
  BmiCubit():super( BmiInitialState());
  static BmiCubit get(context)=> BlocProvider.of(context);
  double height =120;
  int weight=40;
  int age=20;
  bool isMale = true;
  void changeMale({required bool male})
  {
    isMale = male;
    emit(BmiChangeIsMaleState());
  }
  void changeHeight({required double h})
  {
    height = h;
    emit( BmiChangeHeightState());
  }
  void plus()
  {
    weight++;
    emit(BmiPlusState());
  }
  void minus()
  {
    weight--;
    emit(BmiMinusState());
  }
  void plusAge()
  {
    age++;
    emit(BmiPlusAgeState());
  }
  void minusAge()
  {
    age--;
    emit(BmiMinusAgeState());
  }
}