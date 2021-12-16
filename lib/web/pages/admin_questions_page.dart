import 'package:kar_zar/web/custom_widgets/appbar.dart';
import 'package:kar_zar/web/custom_widgets/grids.dart';
import 'package:kar_zar/web/pages/question_page.dart';
import 'package:kar_zar/networking/api.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class WebAdminQuestionsPage extends StatefulWidget {
  const WebAdminQuestionsPage({Key? key}) : super(key: key);
  static const String id = 'admin_questions_screen';

  @override
  _AdminQuestionsScreenState createState() => _AdminQuestionsScreenState();
}

class _AdminQuestionsScreenState extends State<WebAdminQuestionsPage> {
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
    double? pageWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 100).copyWith(bottom: 0),
          child: Column(
            children: <Widget>[
              const AdminWebBar(),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: SizedBox(
                  height: 570,
                  child: FutureBuilder<List<dynamic>>(
                    future: Networking().getQs(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        List<Widget> questions = [];
                        for (int i = 0; i < snapshot.data!.length; i++) {
                          String qBody = snapshot.data![i]['Q_Body'].toString();
                          int id = snapshot.data![i]['id'] as int;
                          String authorFirstName = snapshot.data![i]['author_info']['first_name'];
                          String authorLastName = snapshot.data![i]['author_info']['last_name'];
                          final gridBubble = GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => WebQuestionPage(
                                    questionId: id,
                                  ),
                                ),
                              );
                            },
                            child: AdminGridsBubble(
                              qBody: qBody,
                              vote: id,
                              authorFirstName: authorFirstName,
                              authorLastName: authorLastName,
                              color: getRandomColor(),
                              onPressed: () => setState(() {
                                Networking().deleteQ(id);
                              }),
                            ),
                          );

                          questions.add(gridBubble);
                        }

                        return Directionality(
                          textDirection: TextDirection.rtl,
                          child: GridView(
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: pageWidth <= 1400
                                  ? pageWidth <= 1006
                                      ? 1
                                      : 2
                                  : 3,
                              crossAxisSpacing: 10,
                            ),
                            children: questions,
                          ),
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
