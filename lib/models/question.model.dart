class Question {
  int id;
  String question;
  String image;
  int answer;
  String answerText;
  String typeOf;
  bool isCorrect;

  Question({
    this.id,
    this.question,
    this.image,
    this.answer,
    this.answerText,
    this.typeOf,
  });
}
List<Question> eng = [
  Question(
      id : 1,
      question : "1 How is this color called in English",
      image : "assets/images/green.png",
      answer : 1,
      answerText: "Green",
      typeOf : "Option",
  ),
  Question(
    id : 2,
    question : "2 Try to say the name of this color in English",
    image : "assets/images/red.png",
    answer : 1,
    answerText: "red",
    typeOf : "Sound",
  ),
  Question(
    id : 3,
    question : "3 How is this color called in English",
    image : "assets/images/yellow.png",
    answer : 0,
    answerText: "yellow",
    typeOf : "Option",
  ),
  Question(
    id : 4,
    question : "4 Try to say the name of this color in English",
    image : "assets/images/black.png",
    answer : 1,
    answerText: "black",
    typeOf : "Sound",
  )
];

List<Question> pt = [
  Question(
    id : 1,
    question : "1 How is this color called in Portuguese",
    image : "assets/images/purple.png",
    answer : 0,
    answerText: "roxo",
    typeOf : "Option",
  ),
  Question(
    id : 2,
    question : "2 Try to say the name of this color in Portuguese - it's called vermelho",
    image : "assets/images/red.png",
    answer : 1,
    answerText: "vermelho",
    typeOf : "Sound",
  ),
  Question(
    id : 3,
    question : "3 How is this color called in Portuguese",
    image : "assets/images/yellow.png",
    answer : 2,
    answerText: "yellow",
    typeOf : "Option",
  ),
  Question(
    id : 4,
    question : "4 Try to say the name of this color in Portuguese - it's called azul",
    image : "assets/images/blue.png",
    answer : 1,
    answerText: "azul",
    typeOf : "Sound",
  )
];
