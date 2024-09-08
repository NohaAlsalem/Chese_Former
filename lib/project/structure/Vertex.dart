class Vertex {
   Vertex({
    required this.index,
    required this.name,
    required this.timeOfWaitBus,
    required this.timeOfWaitTaxi,
  });

  late   int index;
  late String name;
  late double timeOfWaitBus;
  late double timeOfWaitTaxi;

   @override
   String toString() {
     return '{$index,$name}';
     //return '${[index,name,timeOfWaitBus,timeOfWaitTaxi]}';
   }

  //  @override
  // String toString() {
  //   return 'Vertex{index: $index, name: $name, timeOfWaitBus: $timeOfWaitBus, timeOfWaitTaxi: $timeOfWaitTaxi}';
  // }
}