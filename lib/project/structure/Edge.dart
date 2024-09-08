import 'package:chese_former/project/structure/Vertex.dart';
import 'package:chese_former/project/structure/cost.dart';
import 'package:chese_former/project/structure/graph.dart';

class Edge {
  const Edge(
      this.source,
      this.destination,
      [
        this.distance,
        this.avilablecross,
        this.nameLine,
        this.fastOfBus,
        this.fastOfTaxi,
      ]);
  final Vertex source;
  final Vertex destination;
  final double? distance;
  final bool? avilablecross;
  final String ? nameLine;
  final double? fastOfBus;
  final double? fastOfTaxi;

  double? calc_Time(
      int startRoad,
      Wk  wk
      ) {
    var time_bus;
    var time_taxi;
    var timeW;
    //to time
    if(wk==Wk.bus) {
      if(startRoad==source.index){
        var timeB = distance! / fastOfBus!;
        time_bus = source.timeOfWaitBus + timeB;
        return time_bus;

      }
      else{
        //to not calc new time wait
        var timeB = distance! / fastOfBus!;
        time_bus = timeB;
        return time_bus;
      }
    }
    if(wk==Wk.taxi) {
      var timeT = distance! / fastOfTaxi!;
      time_taxi = source.timeOfWaitTaxi + timeT;
      return time_taxi;}
    if(wk==Wk.walk) {
      timeW=distance!/5.5;
      return timeW;
    }
  }

  double? calc_Mony(
      int startRoad,
      Wk  wk
      ){
    double ?mony;
    if(wk==Wk.bus) {
      if(startRoad==source.index) {
        mony = 400;
      }
      else{
        mony=0;
      }
    }
    if(wk==Wk.taxi) {
      mony=1000*distance!;
    }
    if(wk==Wk.walk) {
      mony=0;
    }
    return mony;
  }

  double? calc_V(
      int startRoad,
      Wk  wk
      ){
    double V=0;
    if(wk==Wk.bus) {
      V=distance!*(-5);
    }
    if(wk==Wk.taxi) {
      V=distance!*(5);
    }
    if(wk==Wk.walk) {
      V=distance!*(-10);
    }
    return V;
  }
  Cost? calc_Cost(
      int startRoad,
      Wk  wk){
    Cost cost=Cost(0,0,0,Wk.bus);
    cost.time=calc_Time(startRoad,wk)!;
    cost.mony=calc_Mony(startRoad,wk)!;
    cost.v=calc_V(startRoad,wk)!;
    cost.wk=wk;
    return cost;
  }
@override
String toString() {
  return 'this Edhe between($source,$destination)';
return '${[calc_Time(0, Wk.bus),calc_Mony(0, Wk.walk),calc_V(0, Wk.bus)]}';
}
}
