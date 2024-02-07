import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:research/homescreen.dart';
import 'package:research/news.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Research extends StatefulWidget {
  const Research({Key? key}) : super(key: key);

  @override
  State<Research> createState() => _ResearchState();
}
TextEditingController  title=TextEditingController();
TextEditingController  name=TextEditingController();
TextEditingController parag=TextEditingController();
class _ResearchState extends State<Research> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:Center(
          child:Text('New Research')
        )
      ),
      body:Expanded(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children:[
              TextField(
                controller:title,
                decoration: InputDecoration(
                  hintText: 'name'
                ),
              ),
              TextField(
                controller:name,
                maxLines: 3,
                decoration: InputDecoration(
                  hintText: 'title'
                ),
              ),
              TextField(
                controller:parag,
                maxLines:5,
                decoration:InputDecoration(
                  hintText: 'parag',
                )
              ),
              SizedBox(height:43),
              InkWell(
                onTap:(){
             sol();
             me();
                 showDialog(context: context ,builder: (BuildContext context){
                   return AlertDialog(
                       title: Text('saved'),
                     actions: [
                       Text('')
                     ],
                   );
                 });
                },
                child: Container(
                  height:54,
                  width:340,
                  child:Center(child: Text('Save',style:TextStyle(color:Colors.white))),
                  decoration:BoxDecoration(color:Colors.blue,)
                ),
              )
            ]
          ),
        ),
      )
    );
  }
}
List<Map<String,dynamic>>dataList=[];
void sol(){
Map<String,dynamic> mapData={
  'title':title.text.toString(),
  'name':name.text.toString(),
  'parag':parag.text.toString()};
  dataList.add(mapData);
  print(dataList[0]);
}
Future<void>me( )async{
    var datas=await SharedPreferences.getInstance();
     datas.setStringList('datass',dataList.cast<String>());
     List<String>?dataGet=datas.getStringList('datass');
      Map<String,dynamic> seqData=jsonDecode(dataGet.toString());
      String nn=seqData['title'];

}