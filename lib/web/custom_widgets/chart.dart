import 'package:percent_indicator/percent_indicator.dart';
import 'package:kar_zar/networking/api.dart';
import 'package:flutter/material.dart';

class TheChart extends StatefulWidget {
  const TheChart({
    Key? key,
    this.questionId,
  }) : super(key: key);
  final int? questionId;
  @override
  _TheChartState createState() => _TheChartState();
}

class _TheChartState extends State<TheChart> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
      future: Networking().getQ(widget.questionId),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          Map<String, dynamic> data = snapshot.data!;
          int under =
              (data['Option_1_count'] + data['Option_2_count'] + data['Option_3_count'] + data['Option_4_count']) != 0
                  ? (data['Option_1_count'] + data['Option_2_count'] + data['Option_3_count'] + data['Option_4_count'])
                  : 1;

          double option1Percent = data['Option_1_count'] / under;
          double option2Percent = data['Option_2_count'] / under;
          double option3Percent = data['Option_3_count'] / under;
          double option4Percent = data['Option_4_count'] / under;

          return SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(500)),
                    color: const Color(0xFF05193f),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(right: 200, bottom: 40, top: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 210, right: 40),
                                  child: Text(
                                    "${data['Q_Body']}",
                                    textAlign: TextAlign.end,
                                    style:
                                        const TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 200, right: 200),
                          child: LinearPercentIndicator(
                            backgroundColor: const Color(0xFF05193f),
                            animation: true,
                            lineHeight: 50.0,
                            animationDuration: 2000,
                            percent: option1Percent,
                            center: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                    " ${(data['Option_1_count'] * 100) / (data['Option_1_count'] + data['Option_2_count'] + data['Option_3_count'] + data['Option_4_count'])} %"),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Text(
                                    " ${data['Option_1']} ",
                                    textAlign: TextAlign.end,
                                    style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                            linearStrokeCap: LinearStrokeCap.roundAll,
                            progressColor: const Color(0xFF38c0ea),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 200, right: 200, top: 20, bottom: 20),
                          child: LinearPercentIndicator(
                            backgroundColor: const Color(0xFF05193f),
                            animation: true,
                            lineHeight: 50.0,
                            animationDuration: 2500,
                            percent: option2Percent,
                            center: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                    " ${(data['Option_2_count'] * 100) / (data['Option_1_count'] + data['Option_2_count'] + data['Option_3_count'] + data['Option_4_count'])} %"),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Text(
                                    " ${data['Option_2']} ",
                                    textAlign: TextAlign.end,
                                    style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                            linearStrokeCap: LinearStrokeCap.roundAll,
                            progressColor: const Color(0xFF38c0ea),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 200, right: 200),
                          child: LinearPercentIndicator(
                            backgroundColor: const Color(0xFF05193f),
                            animation: true,
                            lineHeight: 50.0,
                            animationDuration: 2500,
                            percent: option3Percent,
                            center: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                    " ${(data['Option_3_count'] * 100) / (data['Option_1_count'] + data['Option_2_count'] + data['Option_3_count'] + data['Option_4_count'])} %"),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Text(
                                    " ${data['Option_3']} ",
                                    textAlign: TextAlign.end,
                                    style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                            linearStrokeCap: LinearStrokeCap.roundAll,
                            progressColor: const Color(0xFF38c0ea),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 200, right: 200, top: 20, bottom: 20),
                          child: LinearPercentIndicator(
                            backgroundColor: const Color(0xFF05193f),
                            animation: true,
                            lineHeight: 50.0,
                            animationDuration: 2500,
                            percent: option4Percent,
                            center: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                    " ${(data['Option_4_count'] * 100) / (data['Option_1_count'] + data['Option_2_count'] + data['Option_3_count'] + data['Option_4_count'])} %"),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Text(
                                    " ${data['Option_4']} ",
                                    textAlign: TextAlign.end,
                                    style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                            linearStrokeCap: LinearStrokeCap.roundAll,
                            progressColor: const Color(0xFF38c0ea),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 100, left: 100),
                  child: Divider(color: Colors.black),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 100, left: 100, top: 0, bottom: 25),
                  child: FutureBuilder<List<dynamic>>(
                    future: Networking().getVote(widget.questionId),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        List<Widget> opinions = [];
                        for (int i = 0; i < snapshot.data!.length; i++) {
                          var opinion = snapshot.data![i]['Voter_Opinion'];

                          if (opinion != 'null') {
                            var newOpinion = Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 25),
                                  child: Text(
                                    opinion,
                                    textAlign: TextAlign.end,
                                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                                  ),
                                ),
                                const Divider(color: Colors.black),
                              ],
                            );
                            opinions.add(newOpinion);
                          }
                        }
                        return Column(children: opinions);
                      }

                      if (!snapshot.hasData) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      return const Center(child: CircularProgressIndicator());
                    },
                  ),
                ),
              ],
            ),
          );
        }
        return Container();
      },
    );
  }
}
