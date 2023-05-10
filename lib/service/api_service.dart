import 'dart:io';

import 'package:dio/dio.dart';
import '../model/post_model.dart';

class ApiService {
  static final dio = Dio();

  static String baseUrl = "https://jsonplaceholder.typicode.com";

  static Future<List<Post>?> getListPost() async {
    try {
      var response = await dio.get("$baseUrl/posts");

      if (response.statusCode == 200) {
        return postFromJson(response.data);
      }
    } on DioError catch (e) {
      if (e.error is SocketException) {
        throw "${e.error} Internetga Ulanmagan";
      } else {
        throw "${e.message} Serverda Xatolik";
      }
    }
  }
}
