import 'package:flutter/material.dart';
import 'package:kar_zar/web/custom_widgets/appbar.dart';
import 'package:kar_zar/web/custom_widgets/chart.dart';

class WebAdminResultsPage extends StatefulWidget {
  const WebAdminResultsPage({Key? key}) : super(key: key);
  static const String id = 'admin_results_page';

  @override
  _WebAdminResultsPageState createState() => _WebAdminResultsPageState();
}

class _WebAdminResultsPageState extends State<WebAdminResultsPage> {
  int clickCardColor = 0;

  @override
  Widget build(BuildContext context) {
    double? pageWidth = MediaQuery.of(context).size.width;
    double? pageHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 100)
                  .copyWith(bottom: 25),
              child: const AdminWebBar(),
            ),
            Row(
              children: [
                SizedBox(
                  height: pageHeight,
                  width: pageWidth * .65,
                  child: TheChart(
                    index: clickCardColor,
                  ),
                ),
                SizedBox(
                  height: pageHeight,
                  width: pageWidth * .35,
                  child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      // var modelQuestion;
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Expanded(
                            child: Card(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              color: index == clickCardColor
                                  ? Colors.cyan
                                  : Colors.transparent,
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              child: InkWell(
                                onTap: () => setState(() {
                                  clickCardColor = index;
                                  // print(clickCardColor);
                                  // print(index);
                                  // print(index == clickCardColor);
                                }),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 16, bottom: 16, right: 20, left: 20),
                                  child: Text(
                                    'سوال ${index + 1} اینگونه میباشددددددددددددددددددددددددددددددددددددددددددددددددددددددددددددددددددددددددددددددددددددددددددددددددددددددد',
                                    textAlign: TextAlign.end,
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
                          ),
                        ],
                      );
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
