import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
class Screen1 extends StatelessWidget{
  const Screen1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String string = "";
    int x=1;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Sign up screen "),
            Image.asset(
              "images/registerr.jpg",
            ),


            Text(" hello "),
            SizedBox(
              height: 100,
              width: 300,
              child: TextFormField(
                onChanged: (value) {
                  string = value;
                },
              ),
            ),
            SizedBox(
              height: 100,
              width: 300,
              child: TextFormField(
                onChanged: (value) {
                  string = value;
                },
              ),
            ),




            ElevatedButton(
              onPressed: () {
                Get.to(
                      () => const Screen2(),
                  arguments: string,
                );
              },
              child: const Text(
                "Go To Screen2",
              ),
            ),



          ],
        ),
      ),
    );
  }
}


class Screen2 extends StatelessWidget {
  const Screen2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String string = "";
    String stringFromScreen1 = Get.arguments;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Log in screen "),
            Image.asset(
              "images/loginn.jpg",
            ),
            Text(stringFromScreen1),
            SizedBox(
              height: 100,
              width: 300,
              child: TextFormField(
                onChanged: (value) {
                  string = value;
                },
              ),
            ),
            SizedBox(
              height: 100,
              width: 300,
              child: TextFormField(
                onChanged: (value) {
                  string = value;
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(
                      () => const Screen3(),
                  arguments: string,
                );
              },
              child: const Text(
                "Go To Screen3",
              ),
            ),

          ],
        ),
      ),
    );
  }
}



class Screen3 extends StatelessWidget {
  const Screen3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String stringFromScreen = Get.arguments;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Image.asset(
              "images/iphoneee.jpg",
            ),
            Image.asset(
              "images/iphoneee.jpg",
            ),
            Image.asset(
              "images/iphoneee.jpg",
            ),

            Text(
              stringFromScreen,
            ),

            ElevatedButton(
              onPressed: () {
                Get.back();
              },
              child: const Text(
                "Back To Screen2",
              ),
            ),

          ],
        ),
      ),
    );
  }
}
