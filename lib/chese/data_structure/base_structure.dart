import 'dart:collection';
import 'package:chese_former/chese/data_structure/castle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class base_Structure extends GetxController{
  static var row = 11;
  static var col = 16;
  int cost=1;
  int H=0;
  var Value;
  Color color=const Color(0xAAdec328);
   List<List<Castle>> twoDlist=[];
  Castle the_Castle=Castle(2,1,2);
  Castle the_King=Castle(3,4,1);
  List<Castle> possablePostion=[];

  base_Structure(){
    twoDlist=generate2List();
    this.cost=cost;
  }
  List<Castle> listOfstate=[];
  List<Castle> buildLists() {
    twoDlist[1][2].value=2;
    twoDlist[9][9].value=3;
    for (int i = 0; i < base_Structure.row; i++) {
      for (int j = 0; j < base_Structure.col; j++) {
        listOfstate.add(twoDlist[i][j]);
      }
    }
    // print(listOfstate);
    return listOfstate;
  }
   generate2List() {
   twoDlist = List.generate(base_Structure.row, (i) {
      return List.filled(base_Structure.col,Castle(0,0,0), growable: false);
    }, );

    for (int i = 0; i < base_Structure.col; i++) {
     twoDlist[0][i] = Castle(0,0,i);
     twoDlist[1][i] = Castle(0,1,i);
     twoDlist[2][i] = Castle(1,2,i);
     twoDlist[3][i] = Castle(0,3,i);
     twoDlist[4][i] = Castle(0,4,i);
     twoDlist[5][i] = Castle(1,5,i);
     twoDlist[6][i] = Castle(0,6,i);
     twoDlist[7][i] = Castle(0,7,i);
     twoDlist[8][i] = Castle(1,8,i);
     twoDlist[9][i] = Castle(0,9,i);
     twoDlist[10][i] = Castle(1,10,i);
      if (i == 8 || i == 10) {
       twoDlist[9][i] = Castle(1,9,i);
      }
      if (i == 9) {
       twoDlist[8][i] = Castle(0,8,i);
       twoDlist[9][i] = Castle(0,9,i);
      }
      if (i == 2) {
       twoDlist[5][i] = Castle(0,5,i);
      }
      if (i == 11 || i == 13) {
       twoDlist[3][i] = Castle(1,3,i);
      }
      if (i == 1 || i == 3) {
       twoDlist[6][i] = Castle(1,6,i);
      }
      if (i == 12) {
       twoDlist[2][i] = Castle(0,2,i);
      }
    }
    return twoDlist;
  }
  List<Castle> listOfMoves=[];
  List<Castle> checkMoves(value,row,c) {
    listOfMoves=[];
    if (value != 1) {
       //print('row ${the_Castle.row}, col ${the_Castle.col}');
      while (twoDlist[row + 1][c].value == 0||twoDlist[row+1][c]==3) {
        row++;
      }
      for (int i = 0; i < base_Structure.row; i++) {
        for (int j = 0; j < base_Structure.col; j++) {
          if (i == row && twoDlist[i][j].value != 1 && j != c) {
            Castle possible=Castle(twoDlist[i][j].value,i,j);
            listOfMoves.add(possible);
          }
        }
      }
    }
    //print('listOfMoves $listOfMoves');
    return listOfMoves;
  }

 List<List<Castle>> moves(int r,int c) {
    int state = twoDlist[r][c].value;
    if (state != 1 && state != 3) {
      twoDlist[the_Castle.row][the_Castle.col] .value=0;
      while (twoDlist[r + 1][c].value == 0) {
        r++;
      }
      the_Castle.setR(r);
      the_Castle.setC(c);
      twoDlist[r][c].value =2 ;
    }
    buildLists();
   // twoDlist.forEach((element) {
   //   print(element);
   // });
    return twoDlist;
  }
  List<base_Structure> getNextSates() {
    List<base_Structure> nextStates = [];
    possablePostion=checkMoves(twoDlist[the_Castle.row][the_Castle.col].value, the_Castle.row, the_Castle.col);
    for(Castle position in possablePostion){
      List<List<Castle>> copy=[];
      copy = List.generate(base_Structure.row, (i) {
        return List.filled(base_Structure.col,Castle(0,0,0), growable: false);});
      for(int i=0;i<row;i++){
        for(int j=0;j<col;j++){
          copy[i][j]=Castle(twoDlist[i][j].value,i,j);
        }
      }
      //List<List<Castle>> copy=jsonDecode(jsonEncode(twoDlist));
      Castle copy1=Castle(the_Castle.value,the_Castle.row,the_Castle.col);
      // copy1.setR(position.row);
      // copy1.setC(position.col);
      base_Structure S = base_Structure();
      S.twoDlist=copy;
      //S.cost=cost+1;
      S.the_Castle=copy1;
      S.moves(position.row, position.col);
      nextStates.add(S);
    }
   // nextStates.forEach((element) {print(element);});
    return nextStates;
  }

  bool isEqual(base_Structure new2d){
    bool resulte=false;
        if(new2d.the_Castle.row==the_Castle.row
            &&new2d.the_Castle.col==the_Castle.col
        ){
          resulte=true;
  }
    return resulte;
  }
  isFinal() {
   // print("row ${the_Castle.row} col ${the_Castle.col} row king${the_King.row} col king${the_King.col}");
    if (the_Castle.row == the_King.row && the_Castle.col == the_King.col) {
      print('SUCCESS');
      return true;
    }
    return false;
  }
  @override
  String toString() {
    return '$the_Castle';
  }
}
class my_Stack<T> {
  Queue queu = Queue<T>();
  void push(T t) {
    queu.addFirst(t);
  }
bool isnotEmpity(){
    bool b=true;
    if(queu.isEmpty){
      b=false;
    }
    return b;
}
  T pop() {
    final first = queu.first;
    queu.removeFirst();
    return first;
  }
}