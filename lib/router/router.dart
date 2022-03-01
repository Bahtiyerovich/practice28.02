import 'package:flutter/material.dart';
import 'package:prac28/models/news_model.dart';
import 'package:prac28/view/pages/info_page.dart';
import 'package:prac28/view/pages/home_page.dart';

class MyRouter extends Object {
  Route? onGenerate(RouteSettings settings) {
    var args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => const HomePage());
      case '/page':
        return MaterialPageRoute(builder: (context) => IndividualPage(data: args as Article,));
        
    }
  }
}
