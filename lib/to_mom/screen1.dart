import 'package:chese_former/to_mom/new.dart';
import 'package:chese_former/to_mom/onBording.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class screen1 extends StatelessWidget{
 // static const routname='s1';
  @override
  Widget build(BuildContext context) {
    return Scaffold(

appBar: AppBar(
  backgroundColor:Color(0xAACF8189),
  // leading: IconButton(onPressed:(){
  //
  // },icon: Icon(Icons.brightness_2)),
  title: const Text(
    'رمضان كريم',
    style: TextStyle(
      fontStyle: FontStyle.italic,
      fontSize: 30.0,
      fontWeight: FontWeight.bold,
      color: Colors.white,
      //color:Color(0xAACF8189),
    ),
  ),
  actions: [
    IconButton(onPressed:(){
      Navigator.push(context,MaterialPageRoute(builder: (context)=>newa()));
    },icon: Icon(Icons.brightness_2)),
    //Icon(Icons.search),
    SizedBox(width: 10.0,),
    Icon(Icons.star),
    SizedBox(width: 10.0,),
  ],
),
      drawer: Drawer(
        backgroundColor:  Color(0xAA7E7F9A),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsetsDirectional.only(top: 40.0),
                child: CircleAvatar(
                  radius: 100.0,
                  backgroundImage:AssetImage('asset/image/fb.jpg'),
                 // child: Image(image:AssetImage('asset/image/fb.jpg')),
                  //backgroundImage:Image(image:AssetImage('')),
                ),
              ),
            ),
          //  DrivenScrollActivity(delegate, from: from, to: to, duration: duration, curve: curve, vsync: vsync)
            Expanded(
              flex: 5,
              child: ListView(children: [
              InkWell(

              child: ListTile(title:Text('ام يوسف',style:TextStyle(fontSize:25)),trailing:Icon(Icons.face,color: Colors.black,)),),

                InkWell(

                    child: ListTile(title:Text('نصائح ',style:TextStyle(fontSize:25)),trailing:Icon(Icons.check_circle_outline,color: Colors.black,)),
                    onTap:(){
                      Navigator.push(context,MaterialPageRoute(builder:(context)=>on_Bording()));
                    }
                ),
                InkWell(
                    child: ListTile(title:Text('الاعدادات',style:TextStyle(fontSize:25)),trailing:Icon(Icons.settings,color: Colors.black,)),
                    onTap:(){
                     // Navigator.push(context,MaterialPageRoute(builder:(context)=>edit_product()));
                    }
                ),
                //InkWell(child: ListTile()),
              ],),
            ),
          ],
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Column(children: [
          Expanded(
            flex: 3,
            child:Lottie.asset('asset/image/ramadan-kareem.json') ,),
          Expanded(
            flex: 2,
            child:Column(
              children: [
                Text('مبارك عليكم الشهر', style: TextStyle(
              fontStyle: FontStyle.italic,
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
              color: Color(0xAACF8189),)),
                SizedBox(height: 10.0,),
                Text('اهنئكم بحلول شهر رمضان المبارك',
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xAA7E7F9A))),
                Text('أهله الله علينا وعليكم بالأمن والايمان',
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xAA7E7F9A)

                  )),
                SizedBox(height: 10.0,),
                Text('كل عام وأنتم بخير',
                    style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xAA7E7F9A)

                    )),
              ],
            ),
          ),
        ],),
      ),
    );
  }
}
