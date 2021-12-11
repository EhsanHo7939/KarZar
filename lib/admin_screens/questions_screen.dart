import 'package:kar_zar/custom_widgets/grids_bubble.dart';
import 'package:kar_zar/screens/question_screen.dart';
import 'package:kar_zar/custom_widgets/appbar.dart';
import 'package:kar_zar/networking/api.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class AdminQuestionsScreen extends StatefulWidget {
  const AdminQuestionsScreen({Key? key}) : super(key: key);
  static const String id = 'admin_questions_screen';

  @override
  _AdminQuestionsScreenState createState() => _AdminQuestionsScreenState();
}

class _AdminQuestionsScreenState extends State<AdminQuestionsScreen> {
  Random random = Random();
  List? colors = [
    Colors.amber[700],
    Colors.green[700],
    Colors.teal[800],
    Colors.blue[700],
    Colors.purple,
  ];

  Color getRandomColor() {
    int color = random.nextInt(5);
    return colors![color];
  }

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
                      padding: const EdgeInsets.only(top: 20),
                      child: SizedBox(
                        height: 570,
                        child: FutureBuilder<Map<String, dynamic>>(
                          future: Networking().getQs(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              List<Widget> questions = [];
                              for (int i = 0;
                                  i < snapshot.data!['data'].length;
                                  i++) {
                                String qBody = snapshot.data!['data'][i]
                                        ['qBody']
                                    .toString();
                                final gridBubble = GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(
                                      context,
                                      QuestionScreen.id,
                                      arguments: snapshot.data!['data'][i]['id']
                                          as int,
                                    );
                                  },
                                  child: AdminGridsBubble(
                                    qBody: qBody,
                                    color: getRandomColor(),
                                    onPressed: () {
                                      Networking().deleteQ(
                                          context, snapshot.data![i][0]);
                                    },
                                  ),
                                );

                                questions.add(gridBubble);
                              }

                              return GridView(
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: isWeb <= 1400
                                      ? isWeb <= 1006
                                          ? 1
                                          : 2
                                      : 3,
                                  crossAxisSpacing: 10,
                                ),
                                children: questions,
                              );
                            }
                            return Container();
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
