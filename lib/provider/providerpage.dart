import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import '../model.dart';
import '../utility/constats.dart';

class QuestionProvider with ChangeNotifier {
  bool match = false;
  int mark = 0;
  List<Question> data =[];
  ProviderStatus status=ProviderStatus.LOADING;
  void markIncreaser() {
    if (match) {
      mark++;
    }
    match=false;
    notifyListeners();
  }

  Future<void> answerCheck(int buttonindex, pageindex, index,int correctIndex )async {
    buttonindex = index;
    buttonindex == correctIndex
        ? match = true
        : match = false;
    // ignore: avoid_print
    print(match);
    notifyListeners();
  }
  fetchQuestion() async {
  final response = await http
      .get(Uri.parse('https://637dbfffcfdbfd9a639bba1e.mockapi.io/sample'));

  if (response.statusCode == 200) {
    data=questionFromJson(response.body);
    status=ProviderStatus.COMPLETED;
  } else {

    throw Exception('Failed to load album');
  }
  notifyListeners();
}
}
