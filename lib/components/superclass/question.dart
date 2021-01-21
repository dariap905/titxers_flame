
import 'dart:async' show Future;
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class Question{
  String id;
  int number;
  String text;
  String validAnswer;

  Question({this.id, this.number, this.text, this.validAnswer});

  factory Question.fromJson(Map<String, dynamic> json) {
    return new Question(
      id: json['id'] as String,
      number: json['number'] as int,
      text: json['text'] as String,
      validAnswer: json['answer'] as String,
    );
  }
/*
  Future<String> loadAsset() async {
    return await rootBundle.loadString('assets/text/api_titxers.txt');
  }*/


}