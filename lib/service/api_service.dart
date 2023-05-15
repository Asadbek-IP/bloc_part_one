import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import '../model/contact_model.dart';

class ApiService {
  static final dio = Dio();

  static String baseUrl =
      "https://645626895f9a4f23613bea38.mockapi.io/api/nem/users";

  static Future<List<Contact>?> getListPost() async {
    try {
      var response = await dio.get("$baseUrl");

      if (response.statusCode == 200) {
        return contactFromJson(response.data);
      }
    } on DioError catch (e) {
      if (e.error is SocketException) {
        throw "Internetga Ulanmagan";
      } else {
        throw "Serverda Xatolik";
      }
    }
  }

  static Future<bool> deleteContact(String id) async {
    try {
      var response = await dio.delete(baseUrl + "/" + id);

      return response.statusCode == 200;
    } on DioError catch (e) {
      if (e.error is SocketException) {
        throw "${e.error} Internetga Ulanmagan";
      } else {
        throw "${e.message} Serverda Xatolik";
      }
    }
  }

  static Future<bool> updateContact(Contact contact) async {
    try {
      var response = await dio.put(baseUrl + "/" + contact.id,
          data: jsonEncode(contact.toJson()));
      return response.statusCode == 200;
    } on DioError catch (e) {
      if (e.error is SocketException) {
        throw "Internetga ulanmagan, iltimos ulaning";
      } else {
        throw "Serverda xatolik, keyinroq urinib ko'ring";
      }
    }
  }
}
