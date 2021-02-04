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
      question : "1 Say this color in English",
      image : "assets/images/green.png",
      answer : "green",
      typeOf : "Say",
  ),
  Question(
    id : 2,
    question : "2 Say this color in English",
    image : "assets/images/green.png",
    answer : "green",
    typeOf : "Say",
  ),
  Question(
    id : 3,
    question : "3 Say this color in English",
    image : "assets/images/green.png",
    answer : "green",
    typeOf : "Say",
  ),
  Question(
    id : 4,
    question : "4 Say this color in English",
    image : "assets/images/green.png",
    answer : "green",
    typeOf : "Say",
  )
];
