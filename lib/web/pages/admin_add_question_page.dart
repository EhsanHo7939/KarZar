import 'package:kar_zar/web/widgets/question_holder.dart';
import 'package:kar_zar/web/widgets/bottombar.dart';
import 'package:kar_zar/web/widgets/appbar.dart';
import 'package:kar_zar/utilities/api.dart';
import 'package:flutter/material.dart';

class WebAdminAddQuestionPage extends StatefulWidget {
  const WebAdminAddQuestionPage({Key? key}) : super(key: key);
  static const String id = 'admin_add_question_page';

  @override
  _WebAdminAddQuestionPageState createState() => _WebAdminAddQuestionPageState();
}

class _WebAdminAddQuestionPageState extends State<WebAdminAddQuestionPage> {
  String qBody = '';
  String option1 = '';
  String option2 = '';
  String option3 = '';
  String option4 = '';
  bool isLoggedIn = false;

  getLoginStatus() async {
    bool accessIsValid = await Api.accessChecker();
    if (accessIsValid) {
      isLoggedIn = true;
    } else if (!accessIsValid) {
      var data = await Api.accessMaker();
      if (data == {}) isLoggedIn = true;
      if (data['msg'] == 'no refresh token') isLoggedIn = false;
    }
  }

  @override
  void initState() {
    getLoginStatus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double? pageWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 50, horizontal: 100).copyWith(bottom: 0),
              child: Column(
                children: <Widget>[
                  const AdminWebBar(),
                  Padding(
                    padding: pageWidth > 420 && pageWidth < 1200
                        ? const EdgeInsets.symmetric(vertical: 50, horizontal: 0)
                            .copyWith(bottom: 0)
                        : const EdgeInsets.symmetric(vertical: 50, horizontal: 200)
                            .copyWith(bottom: 0),
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
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: SizedBox(
                            width: 250,
                            child: MaterialButton(
                              color: Colors.lightBlueAccent,
                              height: 50,
                              child: const Center(
                                child: Text('ثبت سوال'),
                              ),
                              onPressed: () {
                                if (qBody == '' || option1 == '' || option2 == '') {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return const AlertDialog(
                                        content: Text(
                                          'لطفا روی سوال و حداقل گزینه ی یک و دو را خالی نگذارید',
                                        ),
                                      );
                                    },
                                  );
                                } else {
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
                                              if (isLoggedIn) {
                                                Api.createQ(
                                                  qBody,
                                                  option1,
                                                  option2,
                                                  option3,
                                                  option4,
                                                  context,
                                                );
                                                Navigator.pop(context);
                                                showDialog(
                                                  context: context,
                                                  builder: (context) {
                                                    return const AlertDialog(
                                                      content: Text(
                                                        'سوال با موفقیت ثبت شد',
                                                        textAlign: TextAlign.center,
                                                        style: TextStyle(
                                                          fontSize: 20,
                                                          fontWeight: FontWeight.bold,
                                                        ),
                                                      ),
                                                      backgroundColor: Colors.green,
                                                    );
                                                  },
                                                );
                                              }
                                              if (!isLoggedIn) Api.accessMaker();
                                            },
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                }
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const WebBottomBar(),
          ],
        ),
      ),
    );
  }
}
