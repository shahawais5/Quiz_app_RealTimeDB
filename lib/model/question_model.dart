class Questions {
  //every Question have unique id
  final String id;

  //every Question have title Question itself is title
  final String title;

  // every Q have an option
  final Map<String, bool> options;

  ///create a constructor
  Questions({required this.id, required this.title, required this.options});

  @override
  String toString() {
    return 'Questions(id: $id, title: $title, options: $options)';
  }
}
