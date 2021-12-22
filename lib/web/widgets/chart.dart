import 'package:percent_indicator/percent_indicator.dart';
import 'package:kar_zar/utilities/api.dart';
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
      future: Api.getQ(widget.questionId),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          Map<String, dynamic> data = snapshot.data!;
          int under = (data['Option_1_count'] +
                      data['Option_2_count'] +
                      data['Option_3_count'] +
                      data['Option_4_count']) !=
                  0
              ? (data['Option_1_count'] +
                  data['Option_2_count'] +
                  data['Option_3_count'] +
                  data['Option_4_count'])
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
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                    color: const Color(0xFF05193f),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(right: 100, bottom: 40, top: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 210, right: 40),
                                  child: Text(
                                    "${data['Q_Body']}",
                                    textAlign: TextAlign.end,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 100, right: 100, bottom: 20),
                          child: LinearPercentIndicator(
                            backgroundColor: const Color(0xFF05193f),
                            animation: true,
                            lineHeight: 50.0,
                            animationDuration: 1000,
                            percent: double.parse(option1Percent.toStringAsFixed(4)),
                            center: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("${double.parse(option1Percent.toStringAsFixed(3)) * 100} %"),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Text(
                                    " ${data['Option_1']} ",
                                    textAlign: TextAlign.end,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold, color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                            linearStrokeCap: LinearStrokeCap.roundAll,
                            progressColor: const Color(0xFF38c0ea),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 100, right: 100, bottom: 20),
                          child: LinearPercentIndicator(
                            backgroundColor: const Color(0xFF05193f),
                            animation: true,
                            lineHeight: 50.0,
                            animationDuration: 1000,
                            percent: double.parse(option2Percent.toStringAsFixed(4)),
                            center: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("${double.parse(option2Percent.toStringAsFixed(3)) * 100} %"),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Text(
                                    " ${data['Option_2']} ",
                                    textAlign: TextAlign.end,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold, color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                            linearStrokeCap: LinearStrokeCap.roundAll,
                            progressColor: const Color(0xFF38c0ea),
                          ),
                        ),
                        Visibility(
                          visible: data['Option_3'] == "" ? false : true,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 100, right: 100, bottom: 20),
                            child: LinearPercentIndicator(
                              backgroundColor: const Color(0xFF05193f),
                              animation: true,
                              lineHeight: 50.0,
                              animationDuration: 1000,
                              percent: double.parse(option3Percent.toStringAsFixed(4)),
                              center: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                      " ${double.parse(option3Percent.toStringAsFixed(3)) * 100} %"),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: Text(
                                      " ${data['Option_3']} ",
                                      textAlign: TextAlign.end,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold, color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                              linearStrokeCap: LinearStrokeCap.roundAll,
                              progressColor: const Color(0xFF38c0ea),
                            ),
                          ),
                        ),
                        Visibility(
                          visible: data['Option_4'] == "" ? false : true,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 100, right: 100, bottom: 30),
                            child: LinearPercentIndicator(
                              backgroundColor: const Color(0xFF05193f),
                              animation: true,
                              lineHeight: 50.0,
                              animationDuration: 1000,
                              percent: double.parse(option4Percent.toStringAsFixed(4)),
                              center: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                      " ${double.parse(option4Percent.toStringAsFixed(3)) * 100} %"),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: Text(
                                      " ${data['Option_4']} ",
                                      textAlign: TextAlign.end,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold, color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                              linearStrokeCap: LinearStrokeCap.roundAll,
                              progressColor: const Color(0xFF38c0ea),
                            ),
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
                    future: Api.getVote(widget.questionId),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        List<Widget> opinions = [];
                        for (int i = 0; i < snapshot.data!.length; i++) {
                          var opinion = snapshot.data![i]['Voter_Opinion'];

                          if (opinion != '') {
                            var newOpinion = Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 25),
                                  child: Text(
                                    opinion,
                                    textAlign: TextAlign.end,
                                    style:
                                        const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
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
