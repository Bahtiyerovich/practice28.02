import 'package:dio/dio.dart';
import 'package:prac28/core/constants/url_const.dart';
import 'package:prac28/models/news_model.dart';

class NewsApi {
  static Future<NewsModel> getData() async {
    Response res = await Dio().get(UrlConst.baseUrl);
    return NewsModel.fromJson(res.data);
  }
}
