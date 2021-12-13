import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:movieproject/DataModel/first_model_page.dart';

class ProviderPage extends ChangeNotifier {
  var res;
  List<ModelPage> listPage = [];

  void apihit() async {
    var url = Uri.parse('https://api.androidhive.info/json/movies.json');
    var response = await http.get(url);
    res = jsonDecode(response.body);
    for (int i = 0; i < res.length; i++) {
      listPage.add(ModelPage.fromjson(res[i]));
    }
    notifyListeners();
  }
}
