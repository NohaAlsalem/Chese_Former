import 'dart:collection';
import 'dart:math';
import 'package:collection/collection.dart';
import '../data_structure/base_structure.dart';

class logic_Game {
  base_Structure obj = base_Structure();
  List<base_Structure> listOfVisited = [];


  bool checkList(List<base_Structure> visit,base_Structure element){
    bool result =false;
    for(int i=0;i<visit.length;i++){
      if(element.isEqual(visit[i])){
        result=true;
      }
    }
    return result;
  }
int getHueistic(base_Structure element,base_Structure down) {
    int h=0;
    int disRow=(element.the_Castle.row-element.the_King.row).abs();
    int disCol=(element.the_Castle.col-element.the_King.col).abs();
    int disDown=(element.the_Castle.col-down.the_Castle.col).abs();
    int M=(disRow+disDown)+min(disDown,disCol).toInt();

    if(disRow==0&&disCol==0||disDown==0){
      h=0;
    }

    //the_king in same line the_castle
    if(disRow==0){
      if(element.twoDlist[element.the_Castle.row+1][element.the_Castle.col]==0){
        h=3;
      }
      M=disCol;
      h=1;
    }
    //the_king not in same line the_castle
    if(disRow!=0){
      if(element.twoDlist[element.the_Castle.row+1][element.the_Castle.col]==0){
        h=0;
        M=disRow;
      }
     if(disDown==0){
       h=0;

     }
     if(disDown!=0){
       h=1;
       M=(disRow+disCol)+disDown;
     }
      h=2;
    }
    h=h+M;
    return h;
  }
  void BFS() {
    print('\n\n\nthis BFS Algorithm ******************************************');
    List<base_Structure> visites = [];
    Queue<base_Structure> queue = Queue<base_Structure>();
    queue.addLast(obj);
    while (queue.isNotEmpty) {
      base_Structure V = queue.removeFirst();
      //print(V);
      V.the_Castle.path.add(V);
      if(checkList(visites,V)==false){
      visites.add(V);}
      if (V.isFinal()) {
        print('/*********$V');
        print(V.the_Castle.path);
        break;
      }
      listOfVisited = V.getNextSates();
      for(base_Structure element in listOfVisited) {
       if(checkList(visites, element)) continue;
        queue.addLast(element);
        element.the_Castle.path.add(V.the_Castle.path);
    }}
    print('this is num of VISITES ${visites.length}\n\n\n\n');
  }

  void DFS() {
    print('\n\n\nthis DFS Algorithm ******************************************');
    List<base_Structure> visites = [];
    my_Stack stack = my_Stack<base_Structure>();
    stack.push(obj);
    while (stack.isnotEmpity()) {
      base_Structure V = stack.pop();
      if(checkList(visites, V)==false){
     // print(V);
       // print('${V.the_Castle.path}');
      visites.add(V);}
      V.the_Castle.path.add(V);
      if (V.isFinal()) {
        print('/*********$V');

        print(V.the_Castle.path);
        break;
      }
      listOfVisited = V.getNextSates();
      for(base_Structure element in listOfVisited) {
        if(checkList(visites, element))continue;
        stack.push(element);
        element.the_Castle.path.add(V.the_Castle.path);
      }
    }
    print('this is num of VISITES ${visites.length}\n\n\n\n');
  }

  void UCS() {
    print('\n\n\nthis UCS Algorithm ******************************************');
    List<base_Structure> visites = [];
    PriorityQueue<base_Structure> queue = PriorityQueue<base_Structure>((p0, p1) =>p0.cost.compareTo(p1.cost));
    queue.add(obj);
    while (queue.isNotEmpty) {
      base_Structure V = queue.removeFirst();
      //print(V);
      //print('${V.the_Castle.path}');

      if(checkList(visites,V)==false){
        visites.add(V);
        V.the_Castle.path.add(V);
      }
      if (V.isFinal()) {
        print('/*********$V');
        print(V.the_Castle.path);
        break;
      }
      listOfVisited = V.getNextSates();
      for(base_Structure element in listOfVisited) {
       // element.cost++;V.cost+=element.cost;
        element.cost=V.cost+1;
        if(checkList(visites, element)) continue;
        queue.add(element);
        element.the_Castle.path.add(V.the_Castle.path);

      }}
    print('this is num of VISITES ${visites.length}\n\n\n\n');
  }
  void AStar() {
    print('\n\n\n this A*STAR Algorithm ******************************************');
    List<base_Structure> visites = [];
    PriorityQueue<base_Structure> queue = PriorityQueue<base_Structure>((p0, p1) =>p0.H.compareTo(p1.H));
    base_Structure down=obj;
    queue.add(obj);
    while (queue.isNotEmpty) {
      base_Structure V = queue.removeFirst();
      //print(V);
      //print('${V.the_Castle.path}');
      V.the_Castle.path.add(V);
     // print(V.the_Castle.path);
      if(checkList(visites,V)==false){
        visites.add(V);}
      if (V.isFinal()) {
        print('/*********$V');
        print(V.twoDlist);
        print(V.the_Castle.path);
        break;
      }
      listOfVisited = V.getNextSates();
      for(base_Structure element in listOfVisited) {
        if(V.the_Castle.row!=element.the_Castle.row){
          down=element;
        }
        element.H=V.cost+getHueistic(element,down);
        if(checkList(visites, element)) continue;
        queue.add(element);
        element.the_Castle.path.add(V.the_Castle.path);
      }}
    print('this is num of VISITES ${visites.length}\n\n\n\n');
  }


  // dx = abs(current_cell.x – goal.x)
  // dy = abs(current_cell.y – goal.y)
  // h = D * (dx + dy) + (D2 - 2 * D) * min(dx, dy)
 // where D is length of each node(usually = 1) and D2 is diagonal distance between each node (usually = sqrt(2) ).

  //this to show

}
