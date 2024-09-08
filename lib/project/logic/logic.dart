import 'dart:math';

import 'package:chese_former/project/structure/base_structure.dart';
import 'package:chese_former/project/structure/cost.dart';
import 'package:chese_former/project/structure/graph.dart';
import 'package:collection/collection.dart';
class logic{
  new_base_Structure obj=new_base_Structure();

  List<new_base_Structure> listOfVisited=[];
  bool checkElementInList(List<new_base_Structure> visit,new_base_Structure element){
    bool result =false;
    for(int i=0;i<visit.length;i++){
      if(element.isEqual(visit[i])){
        result=true;
      }
    }
    return result;
  }
  double get_Heuristic(new_base_Structure element) {
    double H=0;
    Cost ?costBus;
    Cost ?costTaxi;
    Cost ?costWalk;
    element.graph.my_Edges.forEach((ele) {
    });
    if(element.isWalkOnly){
      costWalk=element.costsToNexts[1];
      H=0;
    }
    else{
     costBus=element.costsToNexts[0];
     costTaxi=element.costsToNexts[1];
     costWalk=element.costsToNexts[2];
    if(costBus.time==costTaxi.time||costBus.time==costWalk.time){
      H=getBy_Mony(costBus, costTaxi, costWalk);
    }
    else{
      H=getBy_Time(costBus, costTaxi, costWalk);
        //H=getBy_V(costBus, costTaxi, costWalk);
      //H=getBy_Mony(costBus, costTaxi, costWalk);

    }
    }
    return H;
  }
  double getBy_Time(Cost costBus,Cost costTaxi,Cost costWalk){
    double H=0;
      H=min(costBus.time,costTaxi.time);
      H=min(H,costWalk.time);
      return H;
  }
  double getBy_Mony(Cost costBus,Cost costTaxi,Cost costWalk){
    double H=0;
    H=min(costBus.mony,costTaxi.mony);
    //H=min(H,costWalk.mony);
    return H;
  }
  double getBy_V(Cost costBus,Cost costTaxi,Cost costWalk){
    double H=0;
    H=max(costBus.v,costTaxi.v);
    H=max(H,costWalk.v);
    return H;
  }
  Cost knowWK(new_base_Structure element,double value){
    Cost ?costToPerson;
    if(element.isWalkOnly){
      costToPerson= element.costsToNexts[1];
    }
    else{
      if(value==(element.costsToNexts[0].time/element.person.haveTime)+(element.costsToNexts[0].mony/element.person.haveMony)+(element.costsToNexts[0].v/element.person.haveV)){
        costToPerson= element.costsToNexts[0];
      }
      else if(value==(element.costsToNexts[1].time/element.person.haveTime)+(element.costsToNexts[1].mony/element.person.haveMony)+(element.costsToNexts[1].v/element.person.haveV)){
        costToPerson= element.costsToNexts[1];
      }
      else{
        costToPerson= element.costsToNexts[2];
      }
    }
    return costToPerson;
  }

double getCost(new_base_Structure element){
  double cost=0;
  Cost ?costBus;
  Cost ?costTaxi;
  Cost ?costWalk;

  if(element.isWalkOnly){
    costWalk=element.costsToNexts[1];
    cost=(costWalk.time/element.person.haveTime)+(costWalk.mony/element.person.haveMony)+(costWalk.v/element.person.haveV);
    //cost=0;
  }

  else{
    costBus=element.costsToNexts[0];
    costTaxi=element.costsToNexts[1];
    costWalk=element.costsToNexts[2];

    double cb=(costBus.time/element.person.haveTime)+(costBus.mony/element.person.haveMony)+(costBus.v/element.person.haveV);
    double ct=(costTaxi.time/element.person.haveTime)+(costTaxi.mony/element.person.haveMony)+(costTaxi.v/element.person.haveV);
   double cw= (costWalk.time/element.person.haveTime)+(costWalk.mony/element.person.haveMony)+(costWalk.v/element.person.haveV);
   cost=min(cb,cw);
   cost=min(cost,ct);
  }
  return cost;
}
void AStar() {
  print('\n\n\n this A*STAR Algorithm ******************************************');
  List<new_base_Structure> visites = [];
  Cost ?my_cost;
  obj.generate_graph();
   PriorityQueue<new_base_Structure> queue = PriorityQueue<new_base_Structure>((p0, p1) =>p0.cost.compareTo(p1.cost));
   queue.add(obj);
   while (queue.isNotEmpty) {
     new_base_Structure V = queue.removeFirst();
     V.person.past_node.add(V);
     if(checkElementInList(visites,V)==false){
       visites.add(V);
     }
     if (V.is_Final()) {
       print(obj.person);
       print(V.person.past_node);
       print(V.costsToNexts[1]);
       print(V.person);

       print('this is num of VISITES ${visites.length}\n');
       break;
     }
     listOfVisited = V.get_Next_States();
     for(new_base_Structure element in listOfVisited) {

       element.cost=V.cost+getCost(element)+get_Heuristic(element);

       my_cost=knowWK(element, getCost(element));
       element.person.haveTime=V.person.haveTime+my_cost.time;
       element.person.haveMony = V.person.haveMony-my_cost.mony;
       //here value my_cost.v negative -
       element.person.haveV=V.person.haveV+my_cost.v;
       element.wk=my_cost.wk;
       if(checkElementInList(visites, element)) continue;
       queue.add(element);
       element.person.past_node.add(V.person.past_node);
    }
   }
}
}