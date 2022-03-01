import 'package:flutter_dotenv/flutter_dotenv.dart';

class UrlConst {
  static String apiKey = dotenv.env["API_KEY"]!;
  static String baseUrl = "https://newsapi.org/v2/everything?q=tesla&from=2022-02-01&sortBy=publishedAt&apiKey=$apiKey";
}
