import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Networking {
  String? url;

  Future<List<dynamic>> getQs() async {
    url = 'http://127.0.0.1:8000/questions/';
    Uri _uri = Uri.parse(url!);
    Response response = await get(_uri);

    if (response.statusCode == 200) {
      var data = json.decode(utf8.decode(response.bodyBytes));
      return data;
    } else {
      return [];
    }
  }

  Future<Map<String, dynamic>> getQ(int? id) async {
    url = 'http://127.0.0.1:8000/questions/$id/';
    Uri _uri = Uri.parse(url!);
    Response response = await get(_uri);

    if (response.statusCode == 200) {
      var data = json.decode(utf8.decode(response.bodyBytes));
      return data;
    } else {
      return {};
    }
  }

  Future createQ(
    String qBody,
    String option1,
    String option2,
    String option3,
    String option4,
    BuildContext context,
  ) async {
    url = 'http://127.0.0.1:8000/questions/';
    Uri _uri = Uri.parse(url!);
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

  Future<void> deleteQ(BuildContext context, int id) async {
    url = 'http://127.0.0.1:8000/questions/$id/';
    Uri _uri = Uri.parse(url!);
    Response? response;
    try {
      response = await delete(_uri);
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

  Future<List<dynamic>> getVotes() async {
    url = 'http://127.0.0.1:8000/votes/';
    Uri _uri = Uri.parse(url!);
    Response? response = await get(_uri);

    if (response.statusCode == 200) {
      var data = json.decode(utf8.decode(response.bodyBytes));
      return data;
    } else {
      return [];
    }
  }

  Future<List<dynamic>> getVote(int id) async {
    url = 'http://127.0.0.1:8000/votes/?question=$id';
    Uri _uri = Uri.parse(url!);
    Response? response = await get(_uri);

    if (response.statusCode == 200) {
      var data = json.decode(utf8.decode(response.bodyBytes));
      return data;
    } else {
      return [];
    }
  }

  Future<void> setVote(String? phoneNumber, String credentials, int choice, String opinion, int? question) async {
    url = 'http://127.0.0.1:8000/votes/';
    Uri _uri = Uri.parse(url!);
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
}
