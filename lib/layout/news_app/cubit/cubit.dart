import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/layout/news_app/cubit/states.dart';
import 'package:untitled/modules/business/business_screen.dart';
import 'package:untitled/modules/science/science_screen.dart';
import 'package:untitled/modules/sports/sports_screen.dart';
import '../../shop_app/shared/network/remote/dio_helper.dart';


class NewsCubit extends Cubit<NewsStates>
{

  NewsCubit() :super(NewsInitialStates());

  static NewsCubit get(context)=> BlocProvider.of(context);

  int currentIndex=0;


List<BottomNavigationBarItem> bottomItems=[
  const BottomNavigationBarItem(icon:
  Icon(
    Icons.business,
  ),
    label: 'Business',
  ),
  const BottomNavigationBarItem(icon:
  Icon(
    Icons.sports,
  ),
    label: 'Sports',
  ),
  const BottomNavigationBarItem(icon:
  Icon(
    Icons.science,
  ),
    label: 'Science',
  ),

];
List<Widget> screens=[
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),

];
void ChangeBottomNavBar(int index)
{
  currentIndex=index;
 if(index==1)
   getSports();
  if(index==2)
    getScience();
  emit(NewsBottomNavStates());
}

List<dynamic> business =[];

void getBusiness()
{
DioHelper.getData(
    url: 'v2/top-headlines',
    query:
{
'country' : 'eg',
  'category' : 'business',
  'apiKey' : '65f7f556ec76449fa7dc7c0069f040ca'
}
).then((value) {
  business=value.data['articles'];
  print(business[3]['title']);
  emit(NewsBusinessSuccessStates());

}).catchError((error){

  print(error.toString());

  emit(NewsBusinessErrorStates(error.toString()));
});
}

  List<dynamic> sports =[];

  void getSports()
  {
    DioHelper.getData(
        url: 'v2/top-headlines',
        query:
        {
          'country' : 'eg',
          'category' : 'sports',
          'apiKey' : '65f7f556ec76449fa7dc7c0069f040ca'
        }
    ).then((value) {
      sports=value.data['articles'];
      print(sports[3]['title']);
      emit(NewsSportsSuccessStates());

    }).catchError((error){

      print(error.toString());

      emit(NewsSportsErrorStates(error.toString()));
    });
  }


  List<dynamic> science =[];

  void getScience()
  {
    DioHelper.getData(
        url: 'v2/top-headlines',
        query:
        {
          'country' : 'eg',
          'category' : 'science',
          'apiKey' : '65f7f556ec76449fa7dc7c0069f040ca'
        }
    ).then((value) {
      science=value.data['articles'];
      print(science[3]['title']);
      emit(NewsScienceSuccessStates());

    }).catchError((error){

      print(error.toString());

      emit(NewsScienceErrorStates(error.toString()));
    });
  }


  List<dynamic> search =[];

  void getSearch(String value)
  {
    DioHelper.getData(
        url: 'v2/everything',
        query:
        {

          'q' : '$value',
          'apiKey' : '65f7f556ec76449fa7dc7c0069f040ca'
        }
    ).then((value) {
      search=value.data['articles'];
      print(search[3]['title']);
      emit(NewsSearchSuccessStates());

    }).catchError((error){

      print(error.toString());

      emit(NewsSearchErrorStates(error.toString()));
    });
  }



}