import 'dart:convert';
import 'package:flutter_interview/model/popular.dart';
import 'package:http/http.dart' as http;

class HttpService{
  Future<List<Popular>> fetchPost() async {
    final response = await http.get(Uri.parse(
        'https://api.nytimes.com/svc/mostpopular/v2/viewed/1.json?api-key=Kg37UmLg2MXDrnGhHWt979EaV2YBmyXP'));
    var alldata = jsonDecode(response.body);
    List<Popular> titles = List<Popular>.from(alldata["results"].map((e)=>Popular.fromJson(e)).toList());
    return titles;
  }
}