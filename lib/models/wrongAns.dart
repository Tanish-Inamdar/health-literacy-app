//models for when you get a question wrong 

class wrongAns{
  //what our questions will look like
  final String title;
  //ID of each question
  final String option;
  //options of the question {1; true, 2; false}
  wrongAns({
    required this.title,
    required this.option, 
  });

  @override
  String toString() {
    return 'Question(title: $title, option: $option)';
  }
}