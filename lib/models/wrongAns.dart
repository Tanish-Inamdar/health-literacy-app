//models for when you get a question wrong 

class wrongAns{
  //what the wrong answers are saved as
  final String title;
  //ID of each question
  final String option;
  wrongAns({
    required this.title,
    required this.option, 
  });

  @override
  String toString() {
    return 'Question(title: $title, option: $option)';
  }
}
