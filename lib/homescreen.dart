import 'dart:async';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:research/researchscreen.dart';
import 'package:research/splashscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Components.dart';
import 'login screen.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
final List<String> imgeUrl=['https://images.pexels.com/photos/2678059/pexels-photo-2678059.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
  'https://www.timeoutdubai.com/cloud/timeoutdubai/2022/07/27/doctors-dubai-golden-visa.jpg',
'https://www.timeoutdubai.com/cloud/timeoutdubai/2022/07/27/doctors-dubai-golden-visa.jpg'];
   String  old='option one';
   String  New='option2';
@override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.black,
      appBar:AppBar(
        backgroundColor: Colors.orange,
        bottom: TabBar(
      tabs: [
      Text('Research'),
          Text('Abstract'),
          Text('Upcoming'),
        Text('News')
          ],),
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width:340,
                  child: TextField(
                    decoration:InputDecoration(
                        hintText: 'search..',
                        border:InputBorder.none
                    ),
                  ),
                ),
              ),
            ]
      ),drawer:SafeArea(
        child: Drawer(
          backgroundColor: Colors.orange,
          child:ListView(
            children:[
              UserAccountsDrawerHeader(
                currentAccountPicture:CircleAvatar(
              child: Image.asset('assets/jhoo.png',height: 45,),

                      ),
                  accountName:Text('malak noorullah khan'),
                  accountEmail: Text('malaknoorkhan12345@gmail.com'),
                decoration:BoxDecoration(
                  color:Colors.blue
                )
              ),
              InkWell(
                onTap: (){},
                child: Row(
                  children:[
                    Icon(Icons.home),
                    InkWell(
                      onTap: (){
                        Navigator.push(context,MaterialPageRoute(builder: (context)=>HomeScreen()));
                      },
                        child: Text('home' ,)),
                  ]
                ),
              ),
              SizedBox(height: 12,),
              InkWell(
                onTap: (){},
                child: Row(
                  children:[
                    Icon(Icons.pages),
                    Text('pages'),
                  ],

                ),
              ),
              SizedBox(height: 12,),
              InkWell(
                onTap: (){},
                child: Row(
                    children:[
                      Icon(Icons.add),
                      Text('researches')
                    ]
                ),
              ),
              SizedBox(height: 12,),

                 Row(
                    children:[
                       Icon(Icons.logout),
                      InkWell(
                        onTap: ()async{
                          Future<void> del() async {
                            var prefs=await SharedPreferences.getInstance();
                            prefs.remove('email');
                            prefs.remove('password');
                            if(prefs==null){
                              Navigator.popUntil(context, (route) =>route.isFirst);
                              Navigator.pushReplacement(context,MaterialPageRoute(builder:(context)=>LoginScreen()));
                           }else{

                           }
                          }
                        },
                          child: Text('logout'))
                    ]
              ),
            ],

          )
        ),
      ),
        body:TabBarView(
          children: [
            Column(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(onTap:(){
                     Navigator.push(context, MaterialPageRoute(builder:(context)=>Research()));
                },child: Container(color:Colors.white,height:34,width:340,child: Center(child: Text('New')))),
                SizedBox(height: 12,),
                Container(color:Colors.white,height:34,width:340,child: Center(child: Text('old'))),
              ],
            ),
            Text('hi'),
            Text('hdf'),
            Text('dfd')

          ],
          ),
      ),
    );
  }
}
