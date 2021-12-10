import 'package:kar_zar/admin_screens/add_question_screen.dart';
import 'package:kar_zar/admin_screens/questions_screen.dart';
import 'package:kar_zar/admin_screens/results_screen.dart';
import 'package:kar_zar/screens/home_screen.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
    this.headerFontSize,
    this.descriptionFontSize,
  }) : super(key: key);
  final double? headerFontSize;
  final double? descriptionFontSize;

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
                children: <Widget>[
                  Text(
                    'دارالصفا',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: headerFontSize,
                    ),
                  ),
                  Text(
                    'بنیاد توسعه خوی',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: descriptionFontSize,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 20),
              const CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage('images/Logo.jpg'),
              ),
            ],
          ),
          onTap: () {
            Navigator.popAndPushNamed(
              context,
              HomeScreen.id,
            );
          },
        ),
        const SizedBox(height: 5),
        Divider(color: Colors.grey[600]),
      ],
    );
  }
}

class CustomAdminAppBar extends StatelessWidget {
  const CustomAdminAppBar({Key? key}) : super(key: key);

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
                TextButton(
                  child: const Text('سوال ها'),
                  onPressed: () {
                    Navigator.popAndPushNamed(context, AdminQuestionsScreen.id);
                  },
                ),
                const SizedBox(width: 24),
                TextButton(
                  child: const Text('افزودن سوال'),
                  onPressed: () {
                    Navigator.popAndPushNamed(
                        context, AdminAddQuestionScreen.id);
                  },
                ),
                const SizedBox(width: 24),
                TextButton(
                  child: const Text('گزارش'),
                  onPressed: () {
                    Navigator.popAndPushNamed(context, AdminResultsScreen.id);
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
                        'کارزار',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                        ),
                      ),
                      Text(
                        'پلتفرم مستقل جمع اوری ارای شهرستان خوی',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 20),
                  const CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(
                      'https://media.istockphoto.com/photos/low-angle-of-tall-building-in-manhattan-picture-id1291177121?b=1&k=20&m=1291177121&s=170667a&w=0&h=aI1PkWS_GkXJ4Qz0gz2cTOud95SS4hUa4iZc1kqWYL4=',
                    ),
                  ),
                ],
              ),
              onTap: () {
                Navigator.popAndPushNamed(
                  context,
                  HomeScreen.id,
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
