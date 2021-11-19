import 'package:kar_zar/custom_widgets/question_holder_bubble.dart';
import 'package:kar_zar/custom_widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({Key? key}) : super(key: key);
  static const String id = 'question_screen';

  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  Random random = Random();
  List? itemCount = [];
  List? colors = [
    Colors.orange,
    Colors.red,
    Colors.amber,
    Colors.green,
    Colors.teal,
    Colors.blue,
    Colors.purple,
  ];

  List? alphabets = [
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'J',
    'K',
    'L',
    'M',
    'N',
    'O',
    'P',
    'Q',
    'R',
    'S',
    'T',
    'U',
    'V',
    'W',
    'X',
    'Y',
    'Z',
  ];

  Color getRandomColor() {
    int color = random.nextInt(7);
    return colors![color];
  }

  String getRandomAlphabets() {
    int alphabet = random.nextInt(26);
    return alphabets![alphabet];
  }

  @override
  Widget build(BuildContext context) {
    double? isWeb = MediaQuery.of(context).size.width;
    return isWeb <= 420
        ? const Scaffold()
        : Scaffold(
            body: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 50, horizontal: 100)
                        .copyWith(bottom: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    const CustomAppBar(),
                    Padding(
                      padding: isWeb > 420 && isWeb < 1200
                          ? const EdgeInsets.symmetric(
                                  vertical: 50, horizontal: 0)
                              .copyWith(bottom: 0)
                          : const EdgeInsets.symmetric(
                                  vertical: 50, horizontal: 200)
                              .copyWith(bottom: 0),
                      child: Column(
                        children: <Widget>[
                          const SizedBox(height: 50),
                          const QuestionHolderBubble(),
                          const SizedBox(height: 50),
                          const Directionality(
                            textDirection: TextDirection.rtl,
                            child: CustomTextField(
                              hintText:
                                  'نام و نام خانوادگی خود را وارد کنید (اختیاری)',
                              label: 'نام و نام خانوادگی',
                              keyboardType: TextInputType.name,
                            ),
                          ),
                          const SizedBox(height: 20),
                          const CustomTextField(
                            hintText:
                                'شماره ی تلفن همراه خود وارد کنید (اجباری)',
                            label: 'شماره ی همراه',
                            keyboardType: TextInputType.phone,
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            ': رای دهید',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 34,
                              color: Colors.cyan,
                            ),
                          ),
                          const SizedBox(height: 10),
                          SizedBox(
                            width: 250,
                            child: MaterialButton(
                              color: Colors.cyan,
                              height: 50,
                              child: const Center(
                                child: Text('ثبت'),
                              ),
                              onPressed: () {
                                setState(() => itemCount!.add('user'));
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Text(
                      'رای دهندگان',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const Divider(color: Colors.grey),
                    SizedBox(
                      height: 500,
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 10,
                          crossAxisSpacing: 40,
                          mainAxisSpacing: 40,
                        ),
                        itemCount: itemCount!.length,
                        itemBuilder: (context, index) {
                          return CircleAvatar(
                            backgroundColor: getRandomColor(),
                            radius: 10,
                            child: Text(
                              getRandomAlphabets(),
                              style: const TextStyle(
                                fontSize: 35,
                                fontWeight: FontWeight.w300,
                                color: Colors.white,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 50),
                  ],
                ),
              ),
            ),
          );
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    this.hintText,
    this.label,
    this.keyboardType,
  }) : super(key: key);
  final String? hintText;
  final String? label;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: keyboardType!,
      decoration: InputDecoration(
        hintText: hintText!,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(width: 1, color: Colors.grey),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(width: 1, color: Colors.cyan),
        ),
        label: Text(label!),
      ),
    );
  }
}
