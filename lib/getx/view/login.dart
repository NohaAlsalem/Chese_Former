import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class log extends StatelessWidget {

  const log({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LOGIN',style: TextStyle(fontSize: 20.0),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextFormField(
              keyboardType: TextInputType.name,
              decoration: InputDecoration(

              ),
            ),
            SizedBox(height: 20.0,),
            TextFormField(
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
              ),
            ),
            Spacer(),
            OutlinedButton(onPressed: (){
              Get.toNamed('/home');
            }, child:Text('hi'))
          ],
        ),
      ),
    );
  }
}
