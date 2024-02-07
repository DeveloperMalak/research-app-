import 'dart:async';

import 'package:flutter/material.dart';
import 'package:research/login%20screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'homescreen.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
   void initState()  {
    super.initState();
    Timer(Duration(seconds:3),(){
         reg();
    });
  }
  void  reg()async{
     final prefs=await SharedPreferences.getInstance();
     if(prefs.getString('password')!=null){
       Navigator.push(context,MaterialPageRoute(builder:(context)=>HomeScreen()));
     }else{
       Navigator.push(context,MaterialPageRoute(builder:(context)=>LoginScreen()));
     }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.black,
      body:Center(
        child: Container(
          color:Colors.white,
          child:Text('Research')
        ),
      )
    );
  }
}
