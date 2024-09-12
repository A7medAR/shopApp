import 'package:flutter/material.dart';
import 'package:untitled/shared/components/components.dart';

class Login_Screen extends StatefulWidget {
  @override
  State<Login_Screen> createState() => _Login_ScreenState();
}

class _Login_ScreenState extends State<Login_Screen> {
bool isPassword=true;

 var emailController =TextEditingController();

 var passwordController =TextEditingController();

 var formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: Icon(
          Icons.menu,
        ),
        title: Text(
          'Second App',
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
      body:Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key:formKey ,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:
                [
                  const Text(
                    'Login',
                        style:TextStyle(
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold,
                        )
                      ),
                  const SizedBox(
                    height: 30.0,
                  ),

                  defaultFormFiled(controller: emailController, type: TextInputType.emailAddress,
                    validate: (value){
                     if(value!.isEmpty){
                        return 'email is empty';
                      }
                      return null;
                    },
                    label: 'Email',
                    prefix: Icons.email,
                    functionChange: (String? value) {
                     print(value);
                    },
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  defaultFormFiled( controller: passwordController,
                    type: TextInputType.visiblePassword,
                    validate: (value){
                      if(value!.isEmpty){
                        return 'password is empty';
                      }
                      return null;
                    },
                      isPassword:isPassword ,
                    label: 'password',
                    prefix: Icons.lock,
                    functionChange: (String? value) {
                      print(value);
                    },
                    suffix:isPassword?Icons.visibility_off : Icons.visibility ,
                    suffixPressed:(){
                      setState(() {
                        isPassword=!isPassword;
                      });
                    }

                  ),

                  const SizedBox(
                    height: 15.0,
                  ),
                  defaultButton(
                    radius: 10.0,
                      function: (){
                      if(formKey.currentState!.validate())
                        {
                          print(emailController.text);
                          print(passwordController.text);
                        }

                  },
                      text:'login'),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Row(
                    children: [
                      const Text(
                        'Don\'t have account?',
                          style:TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),
                      ),
                      TextButton(onPressed: (){},
                          child: const Text('Create a new account'),

                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ) ,
    );
  }
}
