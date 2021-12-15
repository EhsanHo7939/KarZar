import 'package:kar_zar/web/custom_widgets/question_holder.dart';
import 'package:kar_zar/web/custom_widgets/appbar.dart';
import 'package:kar_zar/networking/api.dart';
import 'package:flutter/material.dart';

class WebAdminAddQuestionPage extends StatefulWidget {
  const WebAdminAddQuestionPage({Key? key}) : super(key: key);
  static const String id = 'admin_add_question_page';

  @override
  _WebAdminAddQuestionPageState createState() => _WebAdminAddQuestionPageState();
}

class _WebAdminAddQuestionPageState extends State<WebAdminAddQuestionPage> {
  String qBody = 'روی سوال داده نشده';
  String option1 = 'گزینه داده نشده';
  String option2 = 'گزینه داده نشده';
  String option3 = 'null';
  String option4 = 'null';

  @override
  Widget build(BuildContext context) {
    double? pageWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 100).copyWith(bottom: 0),
          child: Column(
            children: <Widget>[
              const AdminWebBar(),
              Padding(
                padding: pageWidth > 420 && pageWidth < 1200
                    ? const EdgeInsets.symmetric(vertical: 50, horizontal: 0).copyWith(bottom: 0)
                    : const EdgeInsets.symmetric(vertical: 50, horizontal: 200).copyWith(bottom: 0),
                child: Column(
                  children: <Widget>[
                    AdminWebQuestionHolder(
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
                                content: const Text('ایا از ارسال نظرسنجی مطمعن هستید'),
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
                                        qBody,
                                        option1,
                                        option2,
                                        option3,
                                        option4,
                                        context,
                                      );
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        },
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
