import 'package:chese_former/project/structure/graph.dart';

class Cost{
  double time ;
  double mony ;
  double v ;
  Wk wk;
  Cost(this.time,this.mony,this.v,this.wk);

  @override
  String toString() {
    return 'Cost{time: $time, mony: $mony, v: $v }';
  }
// String toString() {
  //   return '{$time,#mony,v}';}
}