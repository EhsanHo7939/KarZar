import 'package:kar_zar/web/pages/admin_add_question_page.dart';
import 'package:kar_zar/web/pages/admin_questions_page.dart';
import 'package:kar_zar/web/pages/admin_results_page.dart';
import 'package:kar_zar/web/pages/home_page.dart';
import 'package:flutter/material.dart';

class WebBar extends StatelessWidget {
  const WebBar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
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
                shape: const CircleBorder(side: BorderSide(width: 0, color: Colors.transparent)),
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
                  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(6))),
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
                    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(6))),
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
                  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(6))),
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
                    shape: const CircleBorder(side: BorderSide(width: 0, color: Colors.transparent)),
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
