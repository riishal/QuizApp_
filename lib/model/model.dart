
import 'dart:convert';

List<Question> questionFromJson(String str) =>
    List<Question>.from(json.decode(str).map((x) => Question.fromJson(x)));

String questionToJson(List<Question> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Question {
  Question({
    required this.createdAt,
    required this.name,
    required this.avatar,
    required this.questions,
    required this.id,
  });

  DateTime createdAt;
  String name;
  String avatar;
  List<QuestionElement> questions;
  String id;

  factory Question.fromJson(Map<String, dynamic> json) => Question(
        createdAt: DateTime.parse(json["createdAt"]),
        name: json["name"],
        avatar: json["avatar"],
        questions: List<QuestionElement>.from(
            json["questions"].map((x) => QuestionElement.fromJson(x))),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "createdAt": createdAt.toIso8601String(),
        "name": name,
        "avatar": avatar,
        "questions": List<dynamic>.from(questions.map((x) => x.toJson())),
        "id": id,
      };
}

class QuestionElement {
  QuestionElement({
    required this.question,
    required this.answers,
    required this.correctIndex,
  });

  String question;
  List<String> answers;
  int correctIndex;

  factory QuestionElement.fromJson(Map<String, dynamic> json) =>
      QuestionElement(
        question: json["question"],
        answers: List<String>.from(json["answers"].map((x) => x)),
        correctIndex: json["correctIndex"],
      );

  Map<String, dynamic> toJson() => {
        "question": question,
        "answers": List<dynamic>.from(answers.map((x) => x)),
        "correctIndex": correctIndex,
      };
}