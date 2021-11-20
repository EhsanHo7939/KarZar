import 'package:flutter/material.dart';
import 'package:kar_zar/custom_widgets/appbar.dart';
import 'package:kar_zar/custom_widgets/question_holder_bubble.dart';

class AdminAddQuestionScreen extends StatefulWidget {
  const AdminAddQuestionScreen({Key? key}) : super(key: key);
  static const String id = 'admin_add_question_screen';

  @override
  _AdminAddQuestionScreenState createState() => _AdminAddQuestionScreenState();
}

class _AdminAddQuestionScreenState extends State<AdminAddQuestionScreen> {
  @override
  Widget build(BuildContext context) {
    double? isWeb = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 100)
              .copyWith(bottom: 0),
          child: Column(
            children: <Widget>[
              const CustomAppBar(),
              Padding(
                padding: isWeb > 420 && isWeb < 1200
                    ? const EdgeInsets.symmetric(vertical: 50, horizontal: 0)
                        .copyWith(bottom: 0)
                    : const EdgeInsets.symmetric(vertical: 50, horizontal: 200)
                        .copyWith(bottom: 0),
                child: Column(
                  children: <Widget>[
                    const AdminQuestionHolderBubble(),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: 250,
                      child: MaterialButton(
                        color: Colors.lightBlueAccent,
                        height: 50,
                        child: const Center(
                          child: Text('ثبت سوال'),
                        ),
                        onPressed: () {},
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
