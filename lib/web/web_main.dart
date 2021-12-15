import 'package:kar_zar/web/pages/admin_add_question_page.dart';
import 'package:kar_zar/web/pages/admin_questions_page.dart';
import 'package:kar_zar/web/pages/admin_results_page.dart';
import 'package:kar_zar/web/pages/question_page.dart';
import 'package:kar_zar/web/pages/home_page.dart';
import 'package:flutter/material.dart';

class WebMain extends StatelessWidget {
  const WebMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: WebHomePage.id,
      routes: {
        WebHomePage.id: (context) => const WebHomePage(),
        WebQuestionPage.id: (context) => const WebQuestionPage(),
        WebAdminAddQuestionPage.id: (context) => const WebAdminAddQuestionPage(),
        WebAdminQuestionsPage.id: (context) => const WebAdminQuestionsPage(),
        WebAdminResultsPage.id: (context) => const WebAdminResultsPage(),
      },
    );
  }
}
