import 'package:chese_former/project/structure/Edge.dart';
import 'package:chese_former/project/structure/Vertex.dart';


enum EdgeType { directed, undirected }
enum Wk { bus, taxi, walk }

abstract class Graph<E> {
  Iterable<Vertex> get vertices;

  Vertex createVertex(
    String name,
    double timeOfWaitBus,
    double timeOfWaitTaxi,
  );

  void addEdge(
    Vertex source,
    Vertex destination, {
    EdgeType edgeType,
    double? distance,
    bool? avilablecross,
    String? nameLine,
    double? fastOfBus,
    double? fastOfTaxi,
  });

  List<Edge> edges(Vertex source);
}

class AdjacencyList<E> implements Graph<E> {
  var nextIndex = 0;
  List<Vertex> my_vertices = [];
  List<Edge> my_Edges = [];
  Map<Vertex, List<Edge>> connictions = {};
  @override
  Iterable<Vertex> get vertices => connictions.keys;
  @override
  Vertex createVertex(String name, double timeOfWaitBus, double timeOfWaitTaxi) {
    // 1
    final vertex = Vertex(
      index: nextIndex,
      name: name,
      timeOfWaitBus: timeOfWaitBus,
      timeOfWaitTaxi: timeOfWaitTaxi,
    );
    nextIndex++;
    connictions[vertex] = [];
    my_vertices.add(vertex);
    return vertex;
  }
  @override
  void addEdge(
    Vertex source,
    Vertex destination, {
    EdgeType edgeType = EdgeType.undirected,
    double? distance,
    bool? avilablecross,
    String? nameLine,
    double? fastOfBus,
    double? fastOfTaxi,
  }) {
    // 1
    my_Edges.add(
      Edge(source, destination, distance, avilablecross, nameLine, fastOfBus,
          fastOfTaxi),
    );
    connictions[source]?.add(
      Edge(source, destination, distance, avilablecross, nameLine, fastOfBus,
          fastOfTaxi),
    );
    // 2
    if (edgeType == EdgeType.undirected) {
      connictions[destination]?.add(
        Edge(destination, source, distance, avilablecross, nameLine, fastOfBus,
            fastOfTaxi),
      );
    }
  }
  @override
  List<Edge> edges(Vertex source) {
    return connictions[source] ?? [];
  }

  @override
  String toString() {
    final result = StringBuffer();
    connictions.forEach((vertex, edges) {
      final destinations = edges.map((edge) {
        return edge.destination;
      }).join(', ');
      result.writeln('$vertex --> $destinations');
    });
    return result.toString();
  }
}
