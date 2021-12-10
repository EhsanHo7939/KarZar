import 'package:kar_zar/custom_widgets/question_holder_bubble.dart';
import 'package:kar_zar/custom_widgets/appbar.dart';
import 'package:kar_zar/networking/api.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({Key? key}) : super(key: key);
  static const String id = 'question_screen';

  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  final formKey = GlobalKey<FormState>();
  Random random = Random();
  String? phoneNumber;
  String? credentials;
  List? itemCount = [];
  List? colors = [
    Colors.red,
    Colors.orange,
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
    int arguments = ModalRoute.of(context)!.settings.arguments as int;
    return isWeb <= 566
        ? Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              backgroundColor: Colors.grey[100],
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: MobileQuestionHolder(
                    widgets: Form(
                      key: formKey,
                      child: Column(
                        children: <Widget>[
                          Directionality(
                            textDirection: TextDirection.rtl,
                            child: CustomTextField(
                              hintText:
                                  'نام و نام خانوادگی خود را وارد کنید...',
                              label: 'نام و نام خانوادگی (اختیاری)',
                              keyboardType: TextInputType.name,
                              onSaved: (value) =>
                                  setState(() => credentials = value),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Directionality(
                            textDirection: TextDirection.ltr,
                            child: CustomTextField(
                              hintText: 'شماره ی تلفن همراه خود وارد کنید...',
                              label: 'شماره ی همراه (اجباری)',
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                if (value!.length == 11 &&
                                    RegExp(r'^[0-9]+$').hasMatch(value)) {
                                  return null;
                                } else {
                                  return 'لطفا شماره همراه را صحیح وارد کنید';
                                }
                              },
                              onSaved: (value) =>
                                  setState(() => phoneNumber = value),
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'رای دهید :',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                              color: Colors.lightBlueAccent,
                            ),
                          ),
                          const SizedBox(height: 10),
                          SizedBox(
                            width: 250,
                            child: MaterialButton(
                              color: Colors.lightBlueAccent,
                              height: 50,
                              child: const Center(
                                child: Text('ثبت'),
                              ),
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  setState(() => itemCount!.add('user'));
                                  formKey.currentState!.save();
                                  //Getter().getExtraOption();
                                  // credentials
                                  // phoneNumber
                                }
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 15,
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
                            height: 200,
                            child: GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 5,
                                crossAxisSpacing: 8,
                                mainAxisSpacing: 8,
                              ),
                              itemCount: itemCount!.length,
                              itemBuilder: (context, index) {
                                return CircleAvatar(
                                  backgroundColor: getRandomColor(),
                                  radius: 30,
                                  child: Text(
                                    getRandomAlphabets(),
                                    style: const TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
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
                      child: Form(
                        key: formKey,
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(bottom: 100),
                              child: FutureBuilder<Map<String, dynamic>>(
                                future: Networking().getQ(arguments),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return const CircularProgressIndicator();
                                  }

                                  if (snapshot.hasError) {
                                    return Center(
                                      child: Text('something went wrong! : ' +
                                          snapshot.error.toString()),
                                    );
                                  }

                                  if (snapshot.hasData) {
                                    Map question =
                                        snapshot.data!['data'] as Map;
                                    return QuestionHolderBubble(
                                      qBody: question['qBody'],
                                      option1: question['option1'],
                                      option2: question['option2'],
                                      option3: question['option3'],
                                      option4: question['option4'],
                                    );
                                  }
                                  return const Center(
                                      child: Text('something went wrong!'));
                                },
                              ),
                            ),
                            Directionality(
                              textDirection: TextDirection.rtl,
                              child: CustomTextField(
                                hintText:
                                    'نام و نام خانوادگی خود را وارد کنید ',
                                label: 'نام و نام خانوادگی (اختیاری)',
                                keyboardType: TextInputType.name,
                                onSaved: (value) =>
                                    setState(() => credentials = value),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 20, bottom: 10),
                              child: CustomTextField(
                                hintText: 'شماره ی تلفن همراه خود وارد کنید',
                                label: ' (اجباری) شماره ی همراه',
                                keyboardType: TextInputType.phone,
                                validator: (value) {
                                  if (value!.length == 11 &&
                                      RegExp(r'^[0-9]+$').hasMatch(value)) {
                                    return null;
                                  } else {
                                    return 'لطفا شماره همراه را صحیح وارد کنید';
                                  }
                                },
                                onSaved: (value) =>
                                    setState(() => phoneNumber = value),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(bottom: 10),
                              child: Text(
                                ': رای دهید',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 34,
                                  color: Colors.cyan,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 250,
                              child: MaterialButton(
                                color: Colors.cyan,
                                height: 50,
                                child: const Center(
                                  child: Text('ثبت'),
                                ),
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    setState(() => itemCount!.add('user'));
                                    formKey.currentState!.save();
                                    //Getter().getExtraOption();
                                    // credentials
                                    // phoneNumber
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
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
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: isWeb < 1200
                              ? isWeb < 900
                                  ? 5
                                  : 8
                              : 10,
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
    this.validator,
    this.onSaved,
  }) : super(key: key);
  final String? hintText;
  final String? label;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
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
      onSaved: onSaved,
    );
  }
}
