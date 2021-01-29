class Question {
  int id;
  String question;
  String image;
  String answer;
  String typeOf;
  bool isCorrect;

  Question({
    this.id,
    this.question,
    this.image,
    this.answer,
    this.typeOf,
  });
}
List<Question> eng = [
  Question(
      id : 1,
      question : "Say this color in English",
      image : "assets/images/green.png",
      answer : "green",
      typeOf : "Say",
  )
];
