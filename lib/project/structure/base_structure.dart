import 'package:chese_former/project/structure/Edge.dart';
import 'package:chese_former/project/structure/Vertex.dart';
import 'package:chese_former/project/structure/cost.dart';
import 'package:chese_former/project/structure/graph.dart';
import 'package:chese_former/project/structure/person.dart';

class new_base_Structure {

  List<Edge> possablePostion = [];
  List<Cost> costsToNexts = [];
  Person person = Person(0, 0, 10000, 100, []);
  Cost? cost_bus;
  Cost? cost_taxi;
  Cost? cost_walk;
  bool isWalkOnly = false;
  double cost = 0;
  Wk ?wk;
  AdjacencyList<String> graph = AdjacencyList<String>();
  AdjacencyList<String> generate_graph() {
    final H = graph.createVertex('H', 0.30, 0.30); //hamak
    final M = graph.createVertex('M', 0.45, 0.30); //midan
    final F = graph.createVertex('F', 0.15, 0.10); //fahhama
    final S = graph.createVertex('S', 1, 0.30); //sana
    final J = graph.createVertex('J', 0.40, 0.15); //jser
    final D = graph.createVertex('D', 1, 1.14); //dommar bald
    final C = graph.createVertex('C', 0.33, 0.5); //dommar sharqeia
    final HM = graph.createVertex('HM', 0, 0); //Home

    graph.addEdge(H, M,
        distance: 1,
        avilablecross: true,
        nameLine: 'مهاجرين_صناعة',
        fastOfBus: 10,
        fastOfTaxi: 13);

    graph.addEdge(H, F,
        distance: 3,
        avilablecross: false,
        nameLine: '',
        fastOfBus: 8,
        fastOfTaxi: 12
    );

    graph.addEdge(H, J,
        distance: 4.5,
        avilablecross: true,
        nameLine: 'مهاجرين_صناعة',
        fastOfBus: 10,
        fastOfTaxi: 15); //H

    graph.addEdge(M, F,
        distance: 2,
        avilablecross: true,
        nameLine: 'ميدان_...',
        fastOfBus: 8,
        fastOfTaxi: 10); //M F

    graph.addEdge(F, S,
        distance: 1,
        avilablecross: true,
        nameLine: 'مهاجرين_صناعة',
        fastOfBus: 6.5,
        fastOfTaxi: 8);

    graph.addEdge(F, J,
      distance: 1.5,
      avilablecross: true,
      nameLine: '..._جسر الرئيس',
      fastOfBus: 7,
      fastOfTaxi: 8,
    );
    graph.addEdge(S, J,
        distance:0.5,
        avilablecross: true,
        nameLine: '..._...',
        fastOfBus: 5.5,
        fastOfTaxi: 5.5);
    graph.addEdge(J, D,
        distance: 4,
        avilablecross: true,
        nameLine: 'دمرالبلد_جسرالرئيس',
        fastOfBus: 10,
        fastOfTaxi: 15);
    graph.addEdge(J, C,
        distance: 5,
        avilablecross: true,
        nameLine: 'دمرالشرقية_جسرالرئيس',
        fastOfBus: 9,
        fastOfTaxi: 13);
    graph.addEdge(D, C,
        distance: 1,
        avilablecross: true,
        nameLine: 'دمر_...',
        fastOfBus: 6,
        fastOfTaxi:6);
    graph.addEdge(C, HM,
        distance: 0.25,
        avilablecross: false,
        nameLine: '',
        fastOfBus: 3,
        fastOfTaxi: 5
    );
    print(graph);
    //print(graph.my_Edges[0]);
    //  print(check_Moves(4));
    //move(S,J);
    //print(person);
    //is_Final();
    return graph;
  }

  base_Structure() {
    graph = generate_graph();
    this.costsToNexts = costsToNexts;
    this.cost = cost;
  }

  List<Edge> check_Moves(int index) {
    List<Edge> possable_moves = [];
    graph.my_Edges.forEach((element) {
      if (element.source.index == index) {
        possable_moves.add(element);
      } else if (element.destination.index == index) {
        possable_moves.add(element);
      }
    });
    return possable_moves;
  }

  move(Vertex S, Vertex D) {
    graph.my_Edges.forEach((element) {
      if (S.index == element.source.index &&
          D.index == element.destination.index) {
        person.placePerson = element.destination.index;
      }
    });
  }
  List<new_base_Structure> get_Next_States() {
    List<new_base_Structure> Next_States = [];
    costsToNexts = [];
    possablePostion = check_Moves(person.placePerson);
    //print(possablePostion[0].destination);
    for (Edge e in possablePostion) {
      //bool copyiswalk=isWalkOnly;
      AdjacencyList<String> copyGraph = AdjacencyList<String>();
      for (int i = 0; i < graph.my_vertices.length; i++) {
        copyGraph.createVertex(
          graph.my_vertices[i].name,
          graph.my_vertices[i].timeOfWaitBus,
          graph.my_vertices[i].timeOfWaitTaxi,
        );
      }
      for (int i = 0; i < graph.my_Edges.length; i++) {
        copyGraph.addEdge(
            graph.my_Edges[i].source, graph.my_Edges[i].destination,
            distance: graph.my_Edges[i].distance,
            avilablecross: graph.my_Edges[i].avilablecross,
            nameLine: graph.my_Edges[i].nameLine,
            fastOfBus: graph.my_Edges[i].fastOfBus,
            fastOfTaxi: graph.my_Edges[i].fastOfTaxi);
      }

      Person copy_person = Person(person.placePerson, person.haveTime,
          person.haveMony, person.haveV, person.past_node);
      new_base_Structure S = new_base_Structure();
      S.graph = copyGraph;
      S.person = copy_person;
      S.move(e.source, e.destination);
      //S.isWalkOnly=copyiswalk;
      graph.my_Edges.forEach((element) {
        //if(person.placePerson==e.source.index||person.placePerson==e.destination.index)
        if (S.person.placePerson == element.destination.index) {
          if (element.avilablecross == true) {
            S.isWalkOnly = false;
            cost_bus = e.calc_Cost(person.placePerson, Wk.bus);
            cost_taxi = e.calc_Cost(person.placePerson, Wk.taxi);
            cost_walk = e.calc_Cost(person.placePerson, Wk.walk);
          } else {
            S.isWalkOnly = true;
            cost_walk = e.calc_Cost(S.person.placePerson, Wk.walk);
          }
        }
      });
      if (isWalkOnly) {
        S.costsToNexts.add(cost_walk!);
      } else {
        S.costsToNexts.add(cost_bus!);
        S.costsToNexts.add(cost_taxi!);
        S.costsToNexts.add(cost_walk!);
      }
      //print(S.costsToNexts);
      Next_States.add(S);
    }
    // print(Next_States);
    return Next_States;
  }

  bool is_Final() {
    if (person.placePerson == graph.my_vertices.length - 1) {
      print('**************************** you arrived to your destination ****************************');
      return true;
    }
    return false;
  }
  bool isEqual(new_base_Structure newgraph) {
    bool resulte = false;
    if (newgraph.person.placePerson == person.placePerson) {
      resulte = true;
    }
    return resulte;
  }

  @override
  String toString() {
    if(wk==Wk.bus){
    return '{\n move to: ${person.placePerson} by $wk : \n Bus${cost_bus} \n';
    }
    if(wk==Wk.taxi){
      return '{\n move to: ${person.placePerson} by $wk : '; // n Taxi ${cost_taxi} \n';
    }
     if(wk==Wk.walk){
      return '{\n move to: ${person.placePerson} by $wk : \n Walk ${cost_walk} \n';
    }
    else {
      return '{\n from : ${person.placePerson} \n\n';
    }
  }
}
