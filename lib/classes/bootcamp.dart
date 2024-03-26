class Boot {
  int id;
  String text;
  bool isDone;

  Boot({required this.id, required this.text, this.isDone = false});

  static List<Boot> boots = [
    Boot(id: 1, text: 'Flutter Bootcamp', isDone: true),
  ];
}
