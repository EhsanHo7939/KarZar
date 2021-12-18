import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter/material.dart';

class TheChart extends StatefulWidget {
  const TheChart({Key? key, required this.index}) : super(key: key);
  final int index;
  @override
  _TheChartState createState() => _TheChartState();
}

class _TheChartState extends State<TheChart> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [widgets[widget.index]],
    );
  }
}

Widget cardTheChart(String questionHeader) {
  return Padding(
    padding: const EdgeInsets.all(25.0),
    child: Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(500)),
      color: const Color(0xFF05193f),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 200, bottom: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 210, right: 40),
                    child: Text(
                      "$questionHeader ",
                      textAlign: TextAlign.end,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white),
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
              percent: 40 / 100,
              center: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("30.0 %"),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Text(
                      "گزینه 1  تا حد امکان از سوالهای تازه و موقعیت های جدید استفاده کگزینه 1  تا حد امکان از سوالهای تازه و موقعیت های جدید استفاده ک",
                      textAlign: TextAlign.end,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                ],
              ),
              linearStrokeCap: LinearStrokeCap.roundAll,
              progressColor: const Color(0xFF38c0ea),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 200, right: 200),
            child: LinearPercentIndicator(
              backgroundColor: const Color(0xFF05193f),
              animation: true,
              lineHeight: 50.0,
              animationDuration: 2500,
              percent: 10 / 100,
              center: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("30.0 %"),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Text(
                      "گزینه 2    تا حد امکان از سوالهای تازه و موقعیت های جدید استفاده کنید. یعنی حفظ کتاب برای جواب دادن کارساز نباشد",
                      textAlign: TextAlign.end,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                ],
              ),
              linearStrokeCap: LinearStrokeCap.roundAll,
              progressColor: const Color(0xFF38c0ea),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 200, right: 200),
            child: LinearPercentIndicator(
              backgroundColor: const Color(0xFF05193f),
              animation: true,
              lineHeight: 50.0,
              animationDuration: 2500,
              percent: 30 / 100,
              center: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("30.0 %"),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Text(
                      "گزینه 3    تا حد امکان از سوالهای تازه و موقعیت های جدید استفاده کنید. یعنی حفظ کتاب برای جواب دادن کارساز نباشد",
                      textAlign: TextAlign.end,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                ],
              ),
              linearStrokeCap: LinearStrokeCap.roundAll,
              progressColor: const Color(0xFF38c0ea),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 200, right: 200),
            child: LinearPercentIndicator(
              backgroundColor: const Color(0xFF05193f),
              animation: true,
              lineHeight: 50.0,
              animationDuration: 2500,
              percent: 70 / 100,
              center: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "30.0 %",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Color(0xFFff4a39)),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Text(
                      "گزینه 4    تا حد امکان از سوالهای تازه و موقعیت های جدید استفاده کنید. یعنی حفظ کتاب برای جواب دادن کارساز نباشد",
                      textAlign: TextAlign.end,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                  ),
                ],
              ),
              linearStrokeCap: LinearStrokeCap.roundAll,
              progressColor: const Color(0xFF38c0ea),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
        ],
      ),
    ),
  );
}

Widget textLines(String commentText) {
  return Text(
    commentText,
    textAlign: TextAlign.end,
    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
  );
}

List<Widget> widgets = [
  Expanded(
    child: SingleChildScrollView(
      child: Column(
        children: [
          cardTheChart(
              'تا حد امکان از سوالهای تازه و موقعیت های جدید استفاده کنید. یعنی حفظ کتاب برای جواب دادن کارساز نباشد'),
          const Padding(
            padding: EdgeInsets.only(right: 100, left: 100),
            child: Divider(color: Colors.black),
          ),
          Padding(
            padding: const EdgeInsets.only(
                right: 100, left: 100, top: 25, bottom: 25),
            child: textLines(
                'تا حد امکان از سوالهای تازه و موقعیت های جدید استفاده کنید. ی111111111111111111111عنی حفظ کتاب برای جواب دادن کارساز نباشد'),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 100, left: 100),
            child: Divider(
              color: Colors.black,
            ),
          ),
        ],
      ),
    ),
  ),
  Expanded(
    child: SingleChildScrollView(
      child: Column(
        children: [
          cardTheChart(
              'تا حد امکان از سوالهای تازه و موقعیت های جدید استفاده کنید کارساز نباشد'),
          const Padding(
            padding: EdgeInsets.only(right: 100, left: 100),
            child: Divider(color: Colors.black),
          ),
          Padding(
            padding: const EdgeInsets.only(
                right: 100, left: 100, top: 25, bottom: 25),
            child: textLines(
                'تا حد امکان از سوالهای تازه و موقعیت های جدید استفاده کنید. یعنی 22222222222222222حفظ کتاب برای جواب دادن کارساز نباشد'),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 100, left: 100),
            child: Divider(
              color: Colors.black,
            ),
          ),
        ],
      ),
    ),
  ),
  Expanded(
    child: SingleChildScrollView(
      child: Column(
        children: [
          cardTheChart('منتلربنعتصلیبیذامسطم'),
          const Padding(
            padding: EdgeInsets.only(right: 100, left: 100),
            child: Divider(color: Colors.black),
          ),
          Padding(
            padding: const EdgeInsets.only(
                right: 100, left: 100, top: 25, bottom: 25),
            child: textLines(
                'تا حد امکان از سوالهای تازه و موقعیت های جدید استفاده کنید. یعنی 333333333333333333حفظ کتاب برای جواب دادن کارساز نباشد'),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 100, left: 100),
            child: Divider(
              color: Colors.black,
            ),
          ),
        ],
      ),
    ),
  ),
  Expanded(
    child: SingleChildScrollView(
      child: Column(
        children: [
          cardTheChart(
              'منتلربتا حد امکان از سوالهای تازه و موقعیت های جدید استفاده کنید. یعنی حفظ کتاب برای جواب دادن کارساز نباشدذامسطم'),
          const Padding(
            padding: EdgeInsets.only(right: 100, left: 100),
            child: Divider(color: Colors.black),
          ),
          Padding(
            padding: const EdgeInsets.only(
                right: 100, left: 100, top: 25, bottom: 25),
            child: textLines(
                'تا حد امکان از سوالهای تازه و موقعیت های جدید استفاده4444444444444444444444 کنید. یعنی حفظ کتاب برای جواب دادن کارساز نباشد'),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 100, left: 100),
            child: Divider(
              color: Colors.black,
            ),
          ),
        ],
      ),
    ),
  ),
  Expanded(
    child: SingleChildScrollView(
      child: Column(
        children: [
          cardTheChart('منتلربذامغقبعثلثخخخخخخخثالبذتثایسطم'),
          const Padding(
            padding: EdgeInsets.only(right: 100, left: 100),
            child: Divider(color: Colors.black),
          ),
          Padding(
            padding: const EdgeInsets.only(
                right: 100, left: 100, top: 25, bottom: 25),
            child: textLines(
                'تا حد امکان از سوالهای تازه و موقعیت های جدید استفاده کنید. 5555555555555555555555555یعنی حفظ کتاب برای جواب دادن کارساز نباشد'),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 100, left: 100),
            child: Divider(
              color: Colors.black,
            ),
          ),
        ],
      ),
    ),
  ),
  Expanded(
    child: SingleChildScrollView(
      child: Column(
        children: [
          cardTheChart(
              'منتلربذامتا حد امکان از سوالهای تازه و موقعیت های جدید استفاده کنید. یعنی حفظ کتاب برای جتا حد امکان از سوالهای تازه و موقعیت های جدید استفاده کنید. یعنی حفظ کتاب برای جواب دادن کارساز نباشدواب دادن کارساز نباشدسطم'),
          const Padding(
            padding: EdgeInsets.only(right: 100, left: 100),
            child: Divider(color: Colors.black),
          ),
          Padding(
            padding: const EdgeInsets.only(
                right: 100, left: 100, top: 25, bottom: 25),
            child: textLines(
                'تا حد امکان از سوالهای تازه و موقعیت های جدید استفاده کنید.6666666666666666666666666666666 یعنی حفظ کتاب برای جواب دادن کارساز نباشد'),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 100, left: 100),
            child: Divider(
              color: Colors.black,
            ),
          ),
        ],
      ),
    ),
  ),
  Expanded(
    child: SingleChildScrollView(
      child: Column(
        children: [
          cardTheChart(
              'منتلربذمکظنبیالسینبلادتا حد امکان از سوالهای تازه و موقعیت های جدید استفاده کنید. یعنی حفظ کتاب برای جواب دادن کارساز نباشدامسطم'),
          const Padding(
            padding: EdgeInsets.only(right: 100, left: 100),
            child: Divider(color: Colors.black),
          ),
          Padding(
            padding: const EdgeInsets.only(
                right: 100, left: 100, top: 25, bottom: 25),
            child: textLines(
                'تا حد امکان از سوالهای تازه و موقعیت های جدید استفاده کنی7777777777777777777777777د. یعنی حفظ کتاب برای جواب دادن کارساز نباشد'),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 100, left: 100),
            child: Divider(
              color: Colors.black,
            ),
          ),
        ],
      ),
    ),
  ),
  Expanded(
    child: SingleChildScrollView(
      child: Column(
        children: [
          cardTheChart(
              'منتلربذتا حد امکان از سوالهای تازه و موقعیت های جدید استفاده کنید. یعنی حفظ کتاب برای جواب دادن کارتا حد امکان از سوالهای تازه و موقعیت های جدید استفاده کنید. یعنی حفظ کتاب برای جواب دادن کارتا حد امکان از سوالهای تازه و موقعیت های جدید استفاده کنید. یعنی حفظ کتاب برای جواب دادن کارساز نباشدساز نباشدساز نباشدامسطم'),
          const Padding(
            padding: EdgeInsets.only(right: 100, left: 100),
            child: Divider(color: Colors.black),
          ),
          Padding(
            padding: const EdgeInsets.only(
                right: 100, left: 100, top: 25, bottom: 25),
            child: textLines(
                'تا حد امکان از سوالهای تازه و موقعیت های جدید استفا88888888888888888888888ده کنید. یعنی حفظ کتاب برای جواب دادن کارساز نباشد'),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 100, left: 100),
            child: Divider(
              color: Colors.black,
            ),
          ),
        ],
      ),
    ),
  ),
  Expanded(
    child: SingleChildScrollView(
      child: Column(
        children: [
          cardTheChart(
            'منتلربذتا حد امکان از سوالهای تازه و موقعیت های جدید استفاده کنید. یعنی حفظ کتاب برای جواب دادن کارتا حد امکان از سوالهای تازه و موقعیت های جدید استفاده کنید. یعنی حفظ کتاب برای جواب دادن کارتا حد امکان از سوالهای تازه و موقعیت های جدید استفاده کنید. یعنی حفظ کتاب برای جواب دادن کارساز 655555554738201--32222294444تانیبذلزرل54784غذیباتا حد امکان از سوالهای تازه و موقعیت های جدید استفاده کنید. یعنی حفظ کتاب برای جواب دادن کارساز نباشدتا حد امکان از سوالهای تازه و موقعیت های جدید استفاده کنید. یعنی حفظ کتاب برای جواب دادن کارساز نباشدتا حد امکان از سوالهای تازه و موقعیت های جدید استفاده کنید. یعنی حفظ کتاب برای جواب دادن کارساز نباشدتا حد امکان از سوالهای تازه و موقعیت های جدید استفاده کنید. یعنی حفظ کتاب برای جواب دادن کارساز نباشدتا حد امکان از سوالهای تازه و موقعیت های جدید استفاده کنید. یعنی حفظ کتاب برای جواب دادhgdfsshgdfhsgggggggggggggggggddddddddddddddddddddن کارساز نباشدتملذرنباشدساز نباشدساز نباشدامسطم',
          ),
          const Padding(
            padding: EdgeInsets.only(right: 100, left: 100),
            child: Divider(color: Colors.black),
          ),
          Padding(
            padding: const EdgeInsets.only(
                right: 100, left: 100, top: 25, bottom: 25),
            child: textLines(
                'تا حد امکان از سوالهای تازه و موقعیت های جدید استفا99999999999999999999999999999999ده کنید. یعنی حفظ کتاب برای جواب دادن کارساز نباشد'),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 100, left: 100),
            child: Divider(
              color: Colors.black,
            ),
          ),
        ],
      ),
    ),
  ),
  Expanded(
    child: SingleChildScrollView(
      child: Column(
        children: [
          cardTheChart(
              'منتلربذتا حد امکان از سوالهای تازه و موقعیت های جدید استفاده کنید. یعنی حفظ کتاب برای جواب دادن کارتا حد امکان از سوالهای تازه و موقعیت های جدید استفاده کنید. یعنی حفظ کتاب برای جواب دادن کارتا حد امکان از سوالهای تازه و موقعیت های جدید استفاده کنید. یعنی حفظ کتاب برای جواب دادن کارتا حد امکان از سوالهای تازه و موقعیت های جدید استفاده کنید. یعنی حفظ کتاب برای جواب دادن کارسیباثصقخه4637597328523ساز نباشدساز نباشدساز نباشدساز نباشدامسطم'),
          const Padding(
            padding: EdgeInsets.only(right: 100, left: 100),
            child: Divider(color: Colors.black),
          ),
          Padding(
            padding: const EdgeInsets.only(
                right: 100, left: 100, top: 25, bottom: 25),
            child: textLines(
                'تا حد امکان از سوالهای تازه و موقعیت های جدید ا1010101010101010101010101010ستفاده کنید. یعنی حفظ کتاب برای جواب دادن کارساز نباشد'),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 100, left: 100),
            child: Divider(
              color: Colors.black,
            ),
          ),
        ],
      ),
    ),
  ),
];
