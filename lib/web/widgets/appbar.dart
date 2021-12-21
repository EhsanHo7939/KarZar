import 'package:kar_zar/web/pages/admin_add_question_page.dart';
import 'package:kar_zar/web/pages/admin_questions_page.dart';
import 'package:kar_zar/utilities/shared_preferences.dart';
import 'package:kar_zar/web/pages/admin_results_page.dart';
import 'package:kar_zar/web/pages/home_page.dart';
import 'package:kar_zar/utilities/api.dart';
import 'package:flutter/material.dart';

class WebBar extends StatefulWidget {
  const WebBar({Key? key}) : super(key: key);

  @override
  State<WebBar> createState() => _WebBarState();
}

class _WebBarState extends State<WebBar> {
  final formKey = GlobalKey<FormState>();
  String username = '';
  String password = '';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.admin_panel_settings_rounded,
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => Form(
                    key: formKey,
                    child: AlertDialog(
                      title: const Text(
                        'پنل ادمین',
                        textAlign: TextAlign.center,
                      ),
                      actions: [
                        TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'username',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(width: 1, color: Colors.grey),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(width: 1, color: Colors.cyan),
                            ),
                            label: Text('نام کاربری'),
                          ),
                          onChanged: (value) => username = value,
                          validator: (value) {
                            return 'نامکاربری را صحیح وارد کنید';
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: TextFormField(
                            decoration: const InputDecoration(
                              hintText: 'password',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                borderSide: BorderSide(width: 1, color: Colors.grey),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                borderSide: BorderSide(width: 1, color: Colors.cyan),
                              ),
                              label: Text('پسورد'),
                            ),
                            onChanged: (value) => password = value,
                            validator: (value) {
                              return 'پسورد را صحیح وارد کنید';
                            },
                          ),
                        ),
                        Center(
                          child: TextButton(
                            child: const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                              child: Text(
                                'ورود',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                ),
                              ),
                            ),
                            onPressed: () async {
                              Map<String, dynamic> tokens = await Api.login(username, password);

                              if (tokens['msg'] != 'bad request') {
                                UserSharedPreferences.setAccessToken(tokens['access_token']);
                                UserSharedPreferences.setRefreshToken(tokens['refresh_token']);
                                Navigator.pop(context);
                              } else {
                                formKey.currentState!.validate();
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            GestureDetector(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: const <Widget>[
                      Text(
                        'دارالصّفا',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                      Text(
                        'بنیاد توسعه خوی',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 20),
                  Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    shape:
                        const CircleBorder(side: BorderSide(width: 0, color: Colors.transparent)),
                    child: Image.asset(
                      'images/Logo.jpg',
                      height: 70,
                    ),
                  ),
                ],
              ),
              onTap: () {
                Navigator.popAndPushNamed(
                  context,
                  WebHomePage.id,
                );
              },
            ),
          ],
        ),
        const SizedBox(height: 5),
        Divider(color: Colors.grey[600]),
      ],
    );
  }
}

class AdminWebBar extends StatelessWidget {
  const AdminWebBar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                const SizedBox(width: 24),
                MaterialButton(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(6))),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'سوال ها',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  color: const Color(0xFF05193f),
                  onPressed: () {
                    Navigator.popAndPushNamed(context, WebAdminQuestionsPage.id);
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: MaterialButton(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(6))),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'افزودن سوال',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    color: const Color(0xFF05193f),
                    onPressed: () {
                      Navigator.popAndPushNamed(context, WebAdminAddQuestionPage.id);
                    },
                  ),
                ),
                MaterialButton(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(6))),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'گزارش',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  color: const Color(0xFF05193f),
                  onPressed: () {
                    Navigator.popAndPushNamed(context, WebAdminResultsPage.id);
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: MaterialButton(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(6))),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'خروج',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                    color: Colors.red,
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('خروج'),
                          content: const Text('ایا از خارح شدن مطمعن هستید؟'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('خیر'),
                            ),
                            TextButton(
                              child: const Text('بله'),
                              onPressed: () {
                                Navigator.pop(context);
                                UserSharedPreferences.setAccessToken('');
                                UserSharedPreferences.setRefreshToken('');
                                Api.logOut();
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            GestureDetector(
              child: Row(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: const <Widget>[
                      Text(
                        'دارالصّفا',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                        ),
                      ),
                      Text(
                        'بنیاد توسعه خوی',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 20),
                  Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    shape:
                        const CircleBorder(side: BorderSide(width: 0, color: Colors.transparent)),
                    child: Image.asset(
                      'images/Logo.jpg',
                      height: 70,
                    ),
                  ),
                ],
              ),
              onTap: () {
                Navigator.popAndPushNamed(
                  context,
                  WebHomePage.id,
                );
              },
            ),
          ],
        ),
        const SizedBox(height: 5),
        const Divider(color: Colors.grey),
      ],
    );
  }
}
