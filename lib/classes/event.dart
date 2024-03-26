class Event {
  int id;
  String text;
  bool isDone;

  Event({required this.id, required this.text, this.isDone = false});

  static List<Event> events = [
    Event(id: 1, text: 'Flutter'),
    Event(id: 2, text: 'Flutter Forward Extended', isDone: true),
  ];
    // add a controlle

}
