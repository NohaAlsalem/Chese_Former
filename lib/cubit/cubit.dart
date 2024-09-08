import 'package:bloc/bloc.dart';
import 'package:chese_former/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class appCubit extends Cubit<StateApp> {
  appCubit() : super(ineitialeState());
  static appCubit get(context) => BlocProvider.of(context);
  static Color? color;
  //var obj=new base_Structure.list(TwoDList.TwoDlist);

 // reBuildStates() {
 //    for (int i = 0; i <base_Structure.row; i++) {
 //      for (int j = 0; j <base_Structure.col; j++) {
 //        listOfstate.add(obj.twoDList[i][j]);
 //      }
 //    }
 //    emit(move());
 //  }
 //
  //  moves(state, r, c) {
 //   //obj.twoDList[1][2]=0;
 //   for (int i = 0; i < base_Structure.row; i++) {
 //     for (int j = 0; j < base_Structure.col; j++) {
 //       if(obj.twoDList[i][j]==2){
 //         obj.twoDList[i][j]=0;
 //       }
 //     }
 //   }
 //    if (obj.twoDList[r + 1][c] == 0 && state != 1) {
 //      state = obj.the_Castle.value;
 //      while (obj.twoDList[r][c]!=1) {
 //        obj.the_Castle.row = r;
 //        obj.the_Castle.col = c;
 //        r++;
 //      }
 //      obj.twoDList[r-1][c] = state;
 //
 //    }
 //    if (state !=1) {
 //      state = obj.the_Castle.value;
 //      obj.the_Castle.row = r;
 //      obj.the_Castle.col = c;
 //      obj.twoDList[r][c] = state;
 //    }
 //   emit(move());
 //    print('**************************');
 //    return obj.twoDList;
 //   }
   void changeColor(state){
     if (state == 0) {
       color = const Color(0xAAdec328);
       emit(move());
     }
     if (state == 1) {
       color = const Color(0xAA0adb21);
       emit(move());
     }
     if (state == 3) {
       color = const Color(0xAAbf303e);
       emit(move());
     }
     if (state == 2) {
       color = const Color(0xAA158abd);
       emit(move());
     }

   }
}