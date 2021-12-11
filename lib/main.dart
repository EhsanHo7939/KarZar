import 'package:kar_zar/admin_screens/add_question_screen.dart';
import 'package:kar_zar/admin_screens/questions_screen.dart';
import 'package:kar_zar/admin_screens/results_screen.dart';
import 'package:kar_zar/screens/question_screen.dart';
import 'package:kar_zar/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(const KarZar());

class KarZar extends StatelessWidget {
  const KarZar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.id,
      routes: {
        HomeScreen.id: (context) => const HomeScreen(),
        QuestionScreen.id: (context) => const QuestionScreen(),
        AdminAddQuestionScreen.id: (context) => const AdminAddQuestionScreen(),
        AdminQuestionsScreen.id: (context) => const AdminQuestionsScreen(),
        AdminResultsScreen.id: (context) => const AdminResultsScreen(),
      },
    );
  }
}
