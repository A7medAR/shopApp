import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:untitled/layout/shop_app/cubit/cubit.dart';
import 'package:untitled/shared/cubit/cubit.dart';

Widget defaultButton({
   double width=double.infinity,
   Color background=Colors.blue,
   bool isUpperCase=true,
  required Function function,
  required String text,
   double radius=0.0
}) =>
    Container(
      width:width,
      height: 40.0,
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(radius,)
      ),

  child: MaterialButton(onPressed:(){function();},
    child: Text(
     isUpperCase? text.toUpperCase():text,
      style: const TextStyle(
          color: Colors.white
      ),
    ),
  ),
);
Widget defaultFormFiled({
  required TextEditingController controller,
  required TextInputType type,
   Function(String)? functionChange,
  Function(String)? OnSubmit,
  required String? Function(String?) validate,
  required String label,
  required IconData prefix,
   IconData? suffix,
  bool isPassword =false,
  Function()? onTap,
  Function()? suffixPressed,

})=>
TextFormField(
  controller: controller,
  decoration:InputDecoration(
    labelText: label,
    border: const OutlineInputBorder(),
    prefixIcon:Icon(prefix,),
    suffixIcon:suffix !=null?IconButton(icon: Icon(suffix,), onPressed: suffixPressed,):null,
  ) ,
  validator: validate,
  onTap:onTap,
  onChanged:functionChange,
  onFieldSubmitted:OnSubmit,
  keyboardType: type ,
  obscureText: isPassword,

);
Widget buildTaskItem(Map model,context) =>Padding(
  padding: const EdgeInsets.all(20.0),
  child: Row(
    children: [
      CircleAvatar(
        radius: 40.0,
        child: Text(
          '${model['time']}',
        ),
      ),
      const SizedBox(
        width: 20.0,
      ),
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${model['title']}',
              style: const TextStyle(
                fontSize:18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '${model['date']}',
              style: const TextStyle(
                color: Colors.grey,
              ),
            ),

          ],
        ),
      ),
      IconButton(
        color: Colors.green,
          onPressed: (){
          AppCubit.get(context).updateData(status: 'done', id: model['id']);
          }, icon: const Icon(Icons.check_box,)),
      const SizedBox(
        width: 20.0,
      ),
      IconButton(
          color: Colors.grey,
          onPressed: (){
            AppCubit.get(context).updateData(status: 'archive', id: model['id']);
          }, icon: const Icon(Icons.archive,)),

    ],
  ),
);
//'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQVOStJRNitUlzrTqCuMH_uiwgIfq9ajDXiLg&usqp=CAU'

Widget myDivider()=>Padding(
  padding: const EdgeInsets.all(20.0),
  child: Container(
    height: 1.0,
    width: double.infinity,
    decoration: const BoxDecoration(
      color: Colors.grey,
    ),
  ),
);
void navigatorTo(context,widget)=>Navigator.push(context, MaterialPageRoute(
builder: (context) =>widget
),);

void navigatorToAndFinish(context,widget)=>Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
    builder: (context) =>widget),
    (Route<dynamic> route)=>false,
     );

void showToast({required String text,required ToastStates state})=>Fluttertoast.showToast(
msg: text,
toastLength: Toast.LENGTH_LONG,
gravity: ToastGravity.BOTTOM,
timeInSecForIosWeb: 5,
backgroundColor: chooseToastColor(state),
textColor: Colors.white,
fontSize: 16.0
);

enum ToastStates{ SUCCESS,ERROR,WARNING}

Color chooseToastColor(ToastStates state)
{
  Color color;
  switch(state)
      {

    case ToastStates.SUCCESS:
       color=Colors.green;
         break;
    case ToastStates.ERROR:
       color=Colors.red;
       break;
    case ToastStates.WARNING:
       color=Colors.amber;
       break;

  }
  return color;
}

Widget buildListProduct( model,context,{bool isOldPrice =true})=>Padding(
  padding: const EdgeInsets.all(20.0),
  child: Container(
    height: 120.0,
    child: Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:
        [
          Stack(
            alignment: AlignmentDirectional.bottomStart,
            children: [
              Image(
                image: NetworkImage(model.image!),
                width: 120.0,
                height: 120.0,
              ),
              if(model.discount !=0 && isOldPrice)
                Container(
                  color: Colors.red,
                  padding: EdgeInsets.symmetric(horizontal: 5.0,),
                  child: Text(
                    'DISCOUNT',
                    style: TextStyle(
                      fontSize: 8.0,
                    ),
                  ),
                ),
            ],
          ),
          SizedBox(
            width: 20.0,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model.name!,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14.0,
                    height: 1.3,
                  ),
                ),
                Spacer(),
                Row(
                    children: [
                      Text(
                        '${model.price}',
                        style: TextStyle(
                            fontSize: 12.0,
                            color: Colors.blue
                        ),
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      if(model.discount!=0 && isOldPrice)
                        Text(
                          '${model.oldPrice}',
                          style: TextStyle(
                            fontSize: 10.0,
                            color: Colors.grey,
                            decoration:TextDecoration.lineThrough,
                          ),
                        ),
                      Spacer(),
                      CircleAvatar(
                        radius: 15.0,
                        backgroundColor: ShopCubit.get(context).favorites[model.id]!  ? Colors.red : Colors.grey  ,
                        child: IconButton(
                          onPressed: ()
                          {
                            ShopCubit.get(context).changeFavorites(model.id!);
                          },
                          icon: Icon(Icons.favorite_border,
                            size: 14.0,
                            color: Colors.white,
                          ),

                        ),
                      ),


                    ]
                ),
              ],
            ),
          ),


        ],
      ),
    ),
  ),
);

PreferredSizeWidget defaultAppBar({
  required BuildContext context,
  String? title,
  List<Widget>?actions,
})=>AppBar(
  leading: IconButton(
    onPressed: (){
      Navigator.pop(context);
      },
    icon: Icon(
      IconBroken.Arrow___Left_2,
    ),
  ),
titleSpacing: 0.0,
title: Text(
  title!,
),
  actions: actions,

);