import 'package:flutter/material.dart';
import 'package:kar_zar/mobile/pages/home_page.dart';
import 'package:kar_zar/mobile/pages/question_page.dart';

class MobileMain extends StatelessWidget {
  const MobileMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: MobileHomePage.id,
      routes: {
        MobileHomePage.id: (context) => const MobileHomePage(),
        MobileQuestionPage.id: (context) => const MobileQuestionPage(),
      },
    );
  }
}
