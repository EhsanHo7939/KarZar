import 'package:kar_zar/custom_widgets/question_holder_bubble.dart';
import 'package:kar_zar/custom_widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:kar_zar/networking/api.dart';

class AdminAddQuestionScreen extends StatefulWidget {
  const AdminAddQuestionScreen({Key? key}) : super(key: key);
  static const String id = 'admin_add_question_screen';

  @override
  _AdminAddQuestionScreenState createState() => _AdminAddQuestionScreenState();
}

class _AdminAddQuestionScreenState extends State<AdminAddQuestionScreen> {
  String? qBody;
  String? option1;
  String? option2;
  String? option3;
  String? option4;

  @override
  Widget build(BuildContext context) {
    double? isWeb = MediaQuery.of(context).size.width;
    return isWeb <= 420
        ? const Scaffold()
        : Scaffold(
            body: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 50, horizontal: 100)
                        .copyWith(bottom: 0),
                child: Column(
                  children: <Widget>[
                    const CustomAdminAppBar(),
                    Padding(
                      padding: isWeb > 420 && isWeb < 1200
                          ? const EdgeInsets.symmetric(
                                  vertical: 50, horizontal: 0)
                              .copyWith(bottom: 0)
                          : const EdgeInsets.symmetric(
                                  vertical: 50, horizontal: 200)
                              .copyWith(bottom: 0),
                      child: Column(
                        children: <Widget>[
                          AdminQuestionHolderBubble(
                            qBody: (value) {
                              qBody = value;
                            },
                            option1: (value) {
                              option1 = value;
                            },
                            option2: (value) {
                              option2 = value;
                            },
                            option3: (value) {
                              option3 = value;
                            },
                            option4: (value) {
                              option4 = value;
                            },
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            width: 250,
                            child: MaterialButton(
                                color: Colors.lightBlueAccent,
                                height: 50,
                                child: const Center(
                                  child: Text('ثبت سوال'),
                                ),
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: const Text(
                                          'ارسال سوال',
                                          textDirection: TextDirection.rtl,
                                        ),
                                        content: const Text(
                                            'ایا از ارسال نظرسنجی مطمعن هستید'),
                                        actions: [
                                          TextButton(
                                            child: const Text('خیر'),
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                          ),
                                          TextButton(
                                            child: const Text('بله'),
                                            onPressed: () {
                                              Navigator.pop(context);
                                              Networking().createQ(
                                                qBody!,
                                                option1!,
                                                option2!,
                                                option3!,
                                                option4!,
                                                context,
                                              );
                                            },
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                }),
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
