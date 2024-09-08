import 'package:chese_former/to_mom/screen1.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class start extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              Container(
                child: Center(child:Card(
                    shadowColor:const Color(0xAA420168),
                  elevation: 20,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  //color:const Color(0xAA93f0fc),
                  shape:const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40),bottomRight: Radius.circular(40)),
                  ),
                 //lifestyle-ramadan-2021
                // ramadan-kareem
                //ramadan
                //ramadan-2021
                  //the-quran-ramadan-2021
                  //of-ramadan
                   //child:Lottie.asset('asset/image/of-ramadan.json') ,
                  child: Image(image:AssetImage('asset/image/fb.jpg'),fit:BoxFit.cover,)
                ),),
              ),
              const SizedBox(height: 20.0,),
              const Text(
                'تهنئة من ام يوسف',
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xAA7E7F9A),

                ),
              ),
               Padding(
                padding:  const EdgeInsetsDirectional.only(top: 0,start: 150),
                child: Row(
                  children:[
                    TextButton(
                      onPressed: (){
                        Navigator.push(context,MaterialPageRoute(builder: (context)=>screen1()));
                      },
                      child: const Text(
                        'انقر هنا',
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          color: Color(0xAACF8189),
                          //color: Color(0xAA7E7F9A),
                        ),
                      ),
                    ),
                   // const Text(
                   //    'انقر',
                   //    style: TextStyle(
                   //      fontStyle: FontStyle.italic,
                   //      fontSize: 30.0,
                   //      fontWeight: FontWeight.bold,
                   //      color: Color(0xAACF8189),
                   //    ),
                   //  ),

                  ],
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}
