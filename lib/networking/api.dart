import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Networking {
  Networking({this.url});
  String? url;

  // the URL should be something like 124:0000/questions/
  Future<Map<String, String>> getQs() async {
    Uri _uri = Uri.parse(url!);
    Response response = await get(_uri);

    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
      //will return usable Map of Qs
    } else {
      return {};
    }
  }

  // the URL should be something like 124:0000/questions/id/
  Future<Map<String, String>> getQ() async {
    Uri _uri = Uri.parse(url!);
    Response response = await get(_uri);

    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
      //will return usable Map of Q
    } else {
      return {};
    }
  }

  // the URL should be something like 124:0000/questions/create/
  Future<void> createQ(
    String qBody,
    String option1,
    String option2,
    String option3,
    String option4,
    String extraOption,
    BuildContext context,
  ) async {
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
          "Extra_Option": extraOption
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

  // the URL should be something like 124:0000/questions/id/update/
  Future<void> updateQ(
    String qBody,
    String option1,
    String option2,
    String option3,
    String option4,
    String extraOption,
    BuildContext context,
  ) async {
    Uri _uri = Uri.parse(url!);
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
          "Extra_Option": extraOption
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

// the URL should be something like 124:0000/questions/id/delete/
  Future<void> deleteQ(BuildContext context) async {
    Uri _uri = Uri.parse(url!);
    Response? response;
    try {
      response = await delete(_uri);
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
