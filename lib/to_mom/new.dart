import 'package:flutter/material.dart';

class newa extends StatelessWidget {


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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 100.0,),
          Text('اللهم أهله علينا بالأمن والايمان',
              style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xAA7E7F9A))),
          SizedBox(height: 30.0,),
          Text('والسلامة والاسلام والعون على الصيام والصلاة والقيام ',
              style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xAA7E7F9A))),
          Text('وتلاوة القرءان',
              style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xAA7E7F9A))),
          SizedBox(height: 30.0,),
          Text('اللهم سلمنا لرمضان وسلمه لنا وتسلمه منا متقبلا يارب ',
              style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xAA7E7F9A))),
          Text('العالمين ',
              style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xAA7E7F9A))),
          SizedBox(height: 30.0,),
          Text('وأهله أعواما عديدة وأزمنة مديدة بالصبر واليمن ',
              style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xAA7E7F9A))),
          Text('والبركات',
              style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xAA7E7F9A))),
        ],
      ),
    );
  }
}
