import 'package:flutter/material.dart';
import 'package:kar_zar/networking/api.dart';
import 'package:kar_zar/web/custom_widgets/chart.dart';
import 'package:kar_zar/web/custom_widgets/appbar.dart';

class WebAdminResultsPage extends StatefulWidget {
  const WebAdminResultsPage({Key? key}) : super(key: key);
  static const String id = 'admin_results_page';

  @override
  _WebAdminResultsPageState createState() => _WebAdminResultsPageState();
}

class _WebAdminResultsPageState extends State<WebAdminResultsPage> {
  int? clickCardColor;
  int? questionId;

  Widget chart() {
    if (questionId == null) {
      return const Padding(
        padding: EdgeInsets.only(top: 300),
        child: Text(
          'لطفا سوال مورد نظر را انتخاب کنید',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      );
    } else {
      return TheChart(questionId: questionId);
    }
  }

  @override
  Widget build(BuildContext context) {
    double? pageWidth = MediaQuery.of(context).size.width;
    double? pageHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 50, horizontal: 100).copyWith(bottom: 25),
              child: const AdminWebBar(),
            ),
            Row(
              children: [
                SizedBox(
                  height: pageHeight,
                  width: pageWidth * .65,
                  child: chart(),
                ),
                SizedBox(
                  height: pageHeight,
                  width: pageWidth * .35,
                  child: FutureBuilder<List<dynamic>>(
                    future: Networking().getQs(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        List<Widget> questions = [];
                        for (int i = 0; i < snapshot.data!.length; i++) {
                          String qBody = snapshot.data![i]['Q_Body'];
                          var newQuestion = SizedBox(
                            child: Card(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              color: i == clickCardColor
                                  ? const Color(0xFF05193f)
                                  : Colors.transparent,
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              child: InkWell(
                                onTap: () => setState(() {
                                  clickCardColor = i;
                                  questionId = snapshot.data![i]['id'];
                                }),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 16, bottom: 16, right: 20, left: 20),
                                  child: Text(
                                    qBody,
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                      fontSize: 24,
                                      color: i == clickCardColor ? Colors.white : Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(15),
                                  topLeft: Radius.circular(15),
                                ),
                              ),
                            ),
                            height: 100,
                            width: pageWidth,
                          );

                          questions.add(newQuestion);
                        }
                        return SingleChildScrollView(
                          child: Column(children: questions),
                        );
                      }
                      return Container();
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
