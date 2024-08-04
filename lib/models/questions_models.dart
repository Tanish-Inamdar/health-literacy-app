//question models

class Question{
  //what our questions will look like
  final String id;
  //ID of each question
  final String title;
  final Map<String, bool> options;
  //options of the question {1; true, 2; false}

  Question({
    required this.id,
    required this.title, 
    required this.options,

  });

  @override
  String toString() {
    return 'Question(id: $id, title: $title, options: $options)';
  }
}
