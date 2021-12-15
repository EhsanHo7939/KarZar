import 'package:kar_zar/mobile/custom_widgets/question_holder.dart';
import 'package:kar_zar/mobile/custom_widgets/appbar.dart';
import 'package:kar_zar/networking/api.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class MobileQuestionPage extends StatefulWidget {
  const MobileQuestionPage({Key? key, this.questionId}) : super(key: key);
  static const String id = 'mobile_question_screen';
  final int? questionId;

  @override
  _MobileQuestionPageState createState() => _MobileQuestionPageState();
}

class _MobileQuestionPageState extends State<MobileQuestionPage> {
  final formKey = GlobalKey<FormState>();
  Random random = Random();
  String? phoneNumber;
  String credentials = 'null';
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
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.grey[100],
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                const Directionality(
                  textDirection: TextDirection.ltr,
                  child: MobileBar(),
                ),
                FutureBuilder<Map<String, dynamic>>(
                  future: Networking().getQ(widget.questionId),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    }

                    if (snapshot.hasError) {
                      return Center(
                        child: Text('something went wrong! : ' + snapshot.error.toString()),
                      );
                    }

                    if (!snapshot.hasData) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (snapshot.connectionState == ConnectionState.none) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (snapshot.hasData) {
                      Map question = snapshot.data!;
                      return MobileQuestionHolder(
                        qBody: question['Q_Body'],
                        option1: question['Option_1'],
                        option2: question['Option_2'],
                        option3: question['Option_3'],
                        option4: question['Option_4'],
                        widgets: Form(
                          key: formKey,
                          child: Column(
                            children: <Widget>[
                              Directionality(
                                textDirection: TextDirection.rtl,
                                child: CustomTextField(
                                  hintText: 'نام و نام خانوادگی خود را وارد کنید...',
                                  label: 'نام و نام خانوادگی (اختیاری)',
                                  keyboardType: TextInputType.name,
                                  onSaved: (value) => credentials = value!,
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
                                        RegExp(r'^[0-9]+$').hasMatch(value) &&
                                        value.substring(0, 1) == '0') {
                                      phoneNumber = '+98' + value.substring(1);
                                    } else if (value.length == 13 &&
                                        RegExp(r'^[+]{1}[0-9]{12}$').hasMatch(value) &&
                                        value.substring(0, 4) == '+989') {
                                      phoneNumber = value;
                                    } else if (value.length == 10 &&
                                        RegExp(r'^[0-9]+$').hasMatch(value) &&
                                        value.substring(0, 1) == '9') {
                                      phoneNumber = '+98' + value;
                                    } else {
                                      return 'لطفا شماره همراه را صحیح وارد کنید';
                                    }
                                  },
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
                                      int choice = Getter().getChoice();
                                      String opinion = Getter().getExtraOpinion();
                                      if (choice == 0 && opinion == 'null') {
                                        showDialog(
                                          context: context,
                                          builder: (context) => const AlertDialog(
                                            content: Text('لطفا یک گزینه انتخاب کنید یا نظر شخصی خود را وارد کنید'),
                                          ),
                                        );
                                      } else {
                                        Networking()
                                            .setVote(phoneNumber!, credentials, choice, opinion, widget.questionId);
                                        setState(() => itemCount!.add('user'));
                                      }
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
                                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
                      );
                    }
                    return const Center(child: Text('something went wrong!'));
                  },
                ),
              ],
            ),
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
      onChanged: onSaved,
    );
  }
}
