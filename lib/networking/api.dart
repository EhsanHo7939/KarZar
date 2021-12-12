import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Networking {
  String? url;

  Future<List<dynamic>> getQs() async {
    url = 'http://127.0.0.1:8000/questions/';
    Uri _uri = Uri.parse(url!);
    Response response = await get(
      _uri,
      headers: {
        "Accept": "application/json",
        "Access-Control-Allow-Origin": "*"
      },
    );

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      return data;
    } else {
      return [];
    }
  }

  Future<Map<String, dynamic>> getQ(int id) async {
    url =
        'http://192.168.102.216/practice/view/flutter_select_question.php?id=$id';
    Uri _uri = Uri.parse(url!);
    Response response = await get(
      _uri,
      headers: {
        "Accept": "application/json",
        "Access-Control-Allow-Origin": "*"
      },
    );

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      return data;
    } else {
      return {};
    }
  }

  Future<void> createQ(
    String qBody,
    String option1,
    String option2,
    String option3,
    String option4,
    BuildContext context,
  ) async {
    url = 'http://192.168.102.216/practice/flutter_insert_question.php';
    Uri _uri = Uri.parse(url!);
    Response? response;
    try {
      response = await post(
        _uri,
        body: {
          "qBody": qBody,
          "option1": option1,
          "option2": option2,
          "option3": option3,
          "option4": option4,
        },
      );
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: Center(
            child: Text('something went wrong with error code:' +
                response!.statusCode.toString()),
          ),
        ),
      );
    }
  }

  Future<void> deleteQ(BuildContext context, int id) async {
    url = 'http://192.168.102.216/practice/flutter_delete_question.php?id=$id';
    Uri _uri = Uri.parse(url!);
    Response? response;
    try {
      response = await get(
        _uri,
        headers: {
          "Accept": "application/json",
          "Access-Control-Allow-Origin": "*"
        },
      );
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: Center(
            child: Text('something went wrong with error code:' +
                response!.statusCode.toString()),
          ),
        ),
      );
    }
  }
}
