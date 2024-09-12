import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatelessWidget
{


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
      backgroundColor: Colors.teal,
        leading: Icon(
          Icons.menu,
        ),
        title: Text(
          'FirstApp',
        ),
        actions: [
          IconButton(icon: Icon(
            Icons.notification_important,
          ),onPressed: (){
            print("саша");
          }
          ),
          IconButton(icon:  Icon(
            Icons.search,
          ),onPressed: (){
            print("ruslan");
          }
          ),


        ],


      ),
      body:Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(50.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadiusDirectional.only(
                topStart: Radius.circular(20.0),
              ),
            ),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children:
              [
                Image(
                  //SigleChildScrollView
                  height: 200.0,
                  width: 200.0,
                  fit: BoxFit.cover,
                  image: NetworkImage('data:image/jpeg;base64,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'
                  ),
                       ),
                Container(
                  width: 200.0,
                  padding:EdgeInsets.symmetric(
                    vertical: 10.0,
                  ),
                  color: Colors.black.withOpacity(0.5),
                  child: Text(
                      'Ahmed ',
                      textAlign: TextAlign.center,
                      style:TextStyle(
                        fontSize: 20.0,
                        color:Colors.white,
                      ),

                  ),
                ),
              ],
            ),
          ),
        ),
      ],
      ),

    );
  }

}