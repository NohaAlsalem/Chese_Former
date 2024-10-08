import 'package:chese_former/chese/data_structure/base_structure.dart';
import 'package:chese_former/getx/bind/my_Binding.dart';
import 'package:chese_former/getx/view/show2.dart';
import 'package:chese_former/to_mom/start.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'getx/view/home.dart';
import 'getx/view/show_result.dart';

void main() {
  logic_Game obj1=logic_Game();
  obj1.BFS();
  obj1.DFS();
  obj1.UCS();
 obj1.AStar();
  base_Structure list=base_Structure();
  //print(list.buildLists());
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // static var r;
  // static var c;
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Getx trainning',
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      initialRoute: '/',
      initialBinding: my_Binding(),
      getPages:[
        GetPage(name: '/',page:()=> start()),
        //GetPage(name: '/',page:()=> the_Cells()),
        GetPage(name:'/home', page:()=> home()),
        GetPage(name: '/1', page:()=> shwo2()),
        GetPage(name: '/show_result', page: ()=>Show_Resulte())
      ],
    );
  }
}
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//   // static var r;
//   // static var c;
//   @override
//   Widget build(BuildContext context) {
//    return GetMaterialApp(
//      title: 'Getx trainning',
//      theme: ThemeData(
//        primaryColor: Colors.blue,
//      ),
//      initialRoute: '/home',
//      initialBinding: my_Binding(),
//      getPages:[
//        GetPage(name:'/home', page:()=> home()
//        ),
//        GetPage(name: '/1', page:()=> shwo2()),
//        GetPage(name: '/show_result', page: ()=>Show_Resulte())
//      ],
//    );
//    }
//   cell(state) {
//     Color color=Colors.white10;
//     if (state == 0) {
//       color = const Color(0xAAdec328);
//     }
//     if (state == 1) {
//       color = const Color(0xAA0adb21);
//     }
//     if (state == 3) {
//       color = const Color(0xAAbf303e);
//     }
//     if (state == 2) {
//       color = const Color(0xAA158abd);
//     }
//         return InkWell(
//           onTap: () {
//
//           },
//           child: Container(
//             decoration: BoxDecoration(
//               color: color,
//             ),
//             child: Text(
//               '${state.toString()}',
//               style: TextStyle(fontSize: 10),
//             ),
//           ),
//         );
//   }
//  }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//   // static var r;
//   // static var c;
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (BuildContext context) => appCubit(),
//       child: BlocConsumer<appCubit, StateApp>(
//         listener: (context, state) {},
//         builder: (context, state) {
//           //logic_Game controller=Get.put(logic_Game());
//           var obj=base_Structure();
//           obj.buildLists();
//           // r=obj.listOfRow;
//           // c=obj.listOfIndexCol;
//           return
//             home();
//           //   MaterialApp(
//           //   debugShowCheckedModeBanner: false,
//           //   title: 'Chess Former',
//           //   //routes: {},
//           //   theme: ThemeData(
//           //     primarySwatch: Colors.green,
//           //   ),
//           //   home: Scaffold(
//           //     appBar: AppBar(
//           //       backgroundColor: Color(0xAA0adb21),
//           //       title: GestureDetector(
//           //         onTap: (){
//           //           Get.to(Show_Resulte());
//           //           //Get.back();
//           //          // Get.toNamed('/show resulte');
//           //           // Get.off(Show_Resulte());
//           //           //Get.offAll(Show_Resulte());
//           //         },
//           //         child: const Center(
//           //             child: Text(
//           //           'Chess Former',
//           //           style: TextStyle(
//           //             fontWeight: FontWeight.bold,
//           //             color: Color(0xAAbf303e),
//           //             fontSize: 30.0,
//           //           ),
//           //         )),
//           //       ),
//           //     ),
//           //     body: Padding(
//           //       padding:
//           //           const EdgeInsetsDirectional.only(top: 40.0, bottom: 10.0),
//           //       child: GridView.builder(
//           //           physics: const NeverScrollableScrollPhysics(),
//           //           gridDelegate:
//           //               const SliverGridDelegateWithFixedCrossAxisCount(
//           //             crossAxisCount: 16,
//           //             crossAxisSpacing: 0.5,
//           //             mainAxisSpacing: 0.5,
//           //           ),
//           //           itemCount: 11 * 16,
//           //           itemBuilder: (context, index) =>InkWell(
//           //             onTap: (){
//           //              // print(controller.listOfstate);
//           //             },
//           //             child:GetBuilder<base_Structure>(builder:(controller)=>cell(
//           //               obj.listOfstate[index],
//           //             ),)
//           //     )
//           //     )
//           //   ),
//           // ));
//         },
//       ),
//     );
//   }
//   //  cell(state) {
//   //   Color color=Colors.white10;
//   //    if (state == 0) {
//   //      color = const Color(0xAAdec328);
//   //    }
//   //    if (state == 1) {
//   //      color = const Color(0xAA0adb21);
//   //    }
//   //    if (state == 3) {
//   //      color = const Color(0xAAbf303e);
//   //
//   //    }
//   //    if (state == 2) {
//   //      color = const Color(0xAA158abd);
//   //
//   //    }
//   //   return StreamBuilder<appCubit>(
//   //     stream: null,
//   //     builder: (context, snapshot) {
//   //       appCubit.get(context).changeColor(state);
//   //       return InkWell(
//   //         onTap: () {
//   //         },
//   //         child: Container(
//   //           decoration: BoxDecoration(
//   //             color: color,
//   //           ),
//   //           child: Text(
//   //             '${state.toString()}',
//   //             style: TextStyle(fontSize: 10),
//   //           ),
//   //         ),
//   //       );
//   //     },
//   //   );
//   // }
// }
