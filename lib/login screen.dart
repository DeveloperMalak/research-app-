import 'package:flutter/material.dart';
import 'package:research/Components.dart';
import 'package:research/homescreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen> {
  var emailController=TextEditingController();
  var passwordController=TextEditingController();
  Future<void> data()async{
    SharedPreferences prefs=await SharedPreferences.getInstance();
    prefs.setString('email',emailController.text.toString());
    prefs.setString('password',passwordController.text.toString());
    prefs.setBool('ture',true);
    if(emailController.text.toString()=='malak'&&passwordController.text.toString()=='mnkd'){
      Navigator.push(context,MaterialPageRoute(builder:(context)=>HomeScreen()));
    }else{
      Navigator.push(context,MaterialPageRoute(builder:(context)=>LoginScreen()));
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        mainAxisAlignment:MainAxisAlignment.center,
        crossAxisAlignment:CrossAxisAlignment.center,
        children:[
          TextFormField(
            controller:emailController,
            decoration:InputDecoration(
              hintText: 'Enter email',
              hintStyle: noor,
              labelText: 'email'
            )
          ),
          TextFormField(
              controller:passwordController,
              decoration:InputDecoration(
                  hintText: 'Enter password',
                  hintStyle: noor,
                  labelText: 'password'
              )
          ),
          SizedBox(
            height:12
          ),
          InkWell(
            onTap:(){
              data();
            },
            child: Container(
              height:50,
              width:300,
              decoration: BoxDecoration(color:Colors.orange,
              borderRadius: BorderRadius.circular(34)),
              child:Center(
                child:Text('Login')
              )
            ),
          )
        ]
      )
    );
  }
}
