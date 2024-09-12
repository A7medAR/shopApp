import 'package:flutter/material.dart';
import 'package:untitled/models/user/user_model.dart';


class Users_Screen extends StatelessWidget {

List<User_Moudel> users =
[
  User_Moudel(id: 1,
      name: 'Ahmed Ramadan', phone: '+79534813533'),
  User_Moudel(id: 2,
      name: 'Yousef Ramadan', phone: '+79561813568'),
  User_Moudel(id: 3,
      name: 'Mohamed Ramadan', phone: '+79037813549'),
  User_Moudel(id: 1,
      name: 'Ahmed Ramadan', phone: '+79534813533'),
  User_Moudel(id: 2,
      name: 'Yousef Ramadan', phone: '+79561813568'),
  User_Moudel(id: 3,
      name: 'Mohamed Ramadan', phone: '+79037813549'),
  User_Moudel(id: 1,
      name: 'Ahmed Ramadan', phone: '+79534813533'),
  User_Moudel(id: 2,
      name: 'Yousef Ramadan', phone: '+79561813568'),
  User_Moudel(id: 3,
      name: 'Mohamed Ramadan', phone: '+79037813549'),
  User_Moudel(id: 1,
      name: 'Ahmed Ramadan', phone: '+79534813533'),
  User_Moudel(id: 2,
      name: 'Yousef Ramadan', phone: '+79561813568'),
  User_Moudel(id: 3,
      name: 'Mohamed Ramadan', phone: '+79037813549'),
  User_Moudel(id: 1,
      name: 'Ahmed Ramadan', phone: '+79534813533'),
  User_Moudel(id: 2,
      name: 'Yousef Ramadan', phone: '+79561813568'),
  User_Moudel(id: 3,
      name: 'Mohamed Ramadan', phone: '+79037813549'),
  User_Moudel(id: 1,
      name: 'Ahmed Ramadan', phone: '+79534813533'),
  User_Moudel(id: 2,
      name: 'Yousef Ramadan', phone: '+79561813568'),
  User_Moudel(id: 3,
      name: 'Mohamed Ramadan', phone: '+79037813549'),
  User_Moudel(id: 1,
      name: 'Ahmed Ramadan', phone: '+79534813533'),
  User_Moudel(id: 2,
      name: 'Yousef Ramadan', phone: '+79561813568'),
  User_Moudel(id: 3,
      name: 'Mohamed Ramadan', phone: '+79037813549'),
  User_Moudel(id: 1,
      name: 'Ahmed Ramadan', phone: '+79534813533'),
  User_Moudel(id: 2,
      name: 'Yousef Ramadan', phone: '+79561813568'),
  User_Moudel(id: 3,
      name: 'Mohamed Ramadan', phone: '+79037813549'),

];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Text(
        'Users',
      ),
      ),
      body:ListView.separated(
          itemBuilder: (context, index)=> buildItemUsers(users[index]),
          separatorBuilder:(context,index)=> Padding(
            padding: const EdgeInsetsDirectional.only(
              start: 20.0,
            ),
            child: Container(
              width: double.infinity,
              height: 1.0,
              color: Colors.grey[300],
            ),
          ) ,
          itemCount: users.length,),
    );
  }
  Widget buildItemUsers(User_Moudel user) =>Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        CircleAvatar(
          radius: 25.0,
          child: Text(
            '${user.id}',
            style: TextStyle(
              fontSize:25.0 ,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          width: 20.0,
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${user.name}',
              style: TextStyle(
                fontSize:25.0 ,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '${user.phone}',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ],
    ),
  );

}
