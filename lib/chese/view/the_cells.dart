import 'package:chese_former/chese/data_structure/base_structure.dart';
import 'package:chese_former/chese/data_structure/castle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

tobaseStructure(){
  base_Structure list=base_Structure();
  //print(list.buildLists());
  return list.buildLists();
}
class the_Cells extends StatelessWidget {
 List<Castle> State=tobaseStructure();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(padding: const EdgeInsetsDirectional.only(top: 40.0,bottom: 10.0),
        child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 16,
          crossAxisSpacing: 0.5,
          mainAxisSpacing: 0.5,
        ), itemBuilder: (context,index)=>cell(State[index]),
        itemCount: State.length,),
        ),
    );
  }
}
cell(Castle state){
  Color color=Colors.white10;
  if (state.value == 0) {
    color = const Color(0xAAdec328);
  }
  if (state.value == 1) {
    color = const Color(0xAA0adb21);
  }
  if (state.value == 3) {
    color = const Color(0xAAbf303e);
  }
  if (state.value == 2) {
    color = const Color(0xAA158abd);
  }
  return InkWell(
      onTap: () {
        base_Structure obj=base_Structure();
        obj.moves(state.row, state.col);
        //controller.moves(state.row, state.col);
        //controller.cost;
      },
      child: Container (
        decoration:BoxDecoration(
          color: color,
        ),
        // child:const Text('',
        //   //'${state.toString()}',
        //   style: TextStyle(fontSize: 10),
        // ),
      ),
  );
}