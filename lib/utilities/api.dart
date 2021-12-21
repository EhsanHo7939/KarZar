import 'package:kar_zar/utilities/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Api {
  static Future<List<dynamic>> getQs() async {
    Uri _uri = Uri.parse('http://127.0.0.1:8000/questions/');
    Response response = await get(_uri);

    if (response.statusCode == 200) {
      var data = json.decode(utf8.decode(response.bodyBytes));
      return data;
    } else {
      return [];
    }
  }

  static Future<Map<String, dynamic>> getQ(int? id) async {
    Uri _uri = Uri.parse('http://127.0.0.1:8000/questions/$id/');
    Response response = await get(_uri);

    if (response.statusCode == 200) {
      var data = json.decode(utf8.decode(response.bodyBytes));
      return data;
    } else {
      return {};
    }
  }

  static Future<void> createQ(
    String qBody,
    String option1,
    String option2,
    String option3,
    String option4,
    BuildContext context,
  ) async {
    Uri _uri = Uri.parse('http://127.0.0.1:8000/questions/');
    Response? response;

    try {
      response = await post(
        _uri,
        body: {
          "Q_Body": qBody,
          "Option_1": option1,
          "Option_2": option2,
          "Option_3": option3,
          "Option_4": option4,
          "author": "1"
        },
      );
      print(response.statusCode);
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: Center(
            child: Text('something went wrong with error code:' + response!.statusCode.toString()),
          ),
        ),
      );
    }
  }

  static Future<void> deleteQ(int id) async {
    Uri _uri = Uri.parse('http://127.0.0.1:8000/questions/$id/');
    Response? response;
    try {
      response = await delete(_uri);

      print(response.statusCode);
    } catch (e) {
      print(e);
      print(response!.statusCode);
    }
  }

  static Future<List<dynamic>> getVotes() async {
    Uri _uri = Uri.parse('http://127.0.0.1:8000/votes/');
    Response? response = await get(_uri);

    if (response.statusCode == 200) {
      var data = json.decode(utf8.decode(response.bodyBytes));
      return data;
    } else {
      return [];
    }
  }

  static Future<List<dynamic>> getVote(int? id) async {
    Uri _uri = Uri.parse('http://127.0.0.1:8000/votes/?question=$id');
    Response? response = await get(_uri);

    if (response.statusCode == 200) {
      var data = json.decode(utf8.decode(response.bodyBytes));
      return data;
    } else {
      return [];
    }
  }

  static Future<void> setVote(
      String? phoneNumber, String credentials, int choice, String opinion, int? question) async {
    Uri _uri = Uri.parse('http://127.0.0.1:8000/votes/');
    Response? response;
    try {
      response = await post(
        _uri,
        body: {
          "Voter_Phone_Number": "$phoneNumber",
          "Voter_Fullname": credentials,
          "Voter_Choise": "$choice",
          "Voter_Opinion": opinion,
          "question": "$question"
        },
      );
    } catch (e) {
      print(e);
      print(response!.statusCode);
    }
  }

  static Future<void> countVote(
      String qBody,
      String option1,
      String option2,
      String option3,
      String option4,
      int option1count,
      int option2count,
      int option3count,
      int option4count,
      int? id) async {
    Uri _uri = Uri.parse('http://127.0.0.1:8000/questions/$id/');
    Response? response;
    try {
      response = await put(
        _uri,
        body: {
          "Q_Body": qBody,
          "Option_1": option1,
          "Option_2": option2,
          "Option_3": option3,
          "Option_4": option4,
          "Option_1_count": "$option1count",
          "Option_2_count": "$option2count",
          "Option_3_count": "$option3count",
          "Option_4_count": "$option4count",
          "author": "1"
        },
      );
    } catch (e) {
      print(e);
      print(response!.statusCode);
    }
  }

  static Future<List<dynamic>> searchQ(String value) async {
    Uri _uri = Uri.parse('http://127.0.0.1:8000/questions/?search=$value');
    Response? response = await get(_uri);

    if (response.statusCode == 200) {
      var data = json.decode(utf8.decode(response.bodyBytes));
      return data;
    } else {
      return [];
    }
  }

  static Future<Map<String, dynamic>> login(String username, String password) async {
    Uri _uri = Uri.parse('http://127.0.0.1:8000/auth/login/');
    Response? response;

    response = await post(
      _uri,
      body: {"username": username, "password": password},
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print("good request");
      return data;
    } else {
      print("bad request");
      return {
        "msg": "bad request",
      };
    }
  }

  static Future<bool> accessChecker() async {
    Uri _uri = Uri.parse('http://127.0.0.1:8000/auth/token/verify/');
    Response? response;

    response = await post(
      _uri,
      body: {"token": "${UserSharedPreferences.getAccessToken()}"},
    );

    if (response.statusCode == 200) return true;
    if (response.statusCode == 401) return false;
    return false;
  }

  static Future<Map<String, dynamic>> accessMaker() async {
    Uri _uri = Uri.parse('http://127.0.0.1:8000/auth/token/refresh/');
    Response? response;

    response = await post(
      _uri,
      body: {"refresh": "${UserSharedPreferences.getRefreshToken()}"},
    );

    if (response.statusCode == 200) {
      var access = jsonDecode(response.body);
      UserSharedPreferences.setAccessToken(access['access']);
      return {};
    } else {
      return {'msg': 'no refresh token'};
    }
  }

  static Future<void> logOut() async {
    Uri _uri = Uri.parse('http://127.0.0.1:8000/auth/logout/');
    Response? response;

    response = await post(_uri);

    if (response.statusCode != 200) print('log out failed');
  }
}
