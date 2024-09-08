class Person {
  int placePerson;
  List past_node;
  double haveTime;
  double haveMony;
  double haveV;

  Person(
    this.placePerson,
    this.haveTime,
    this.haveMony,
    this.haveV,
    this.past_node,
  );

  @override
  String toString() {
    return 'Person{placePerson: $placePerson, haveTime: $haveTime, haveMony: $haveMony, haveV: $haveV}';
  }
}
