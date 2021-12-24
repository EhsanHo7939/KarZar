import 'package:kar_zar/web/widgets/question_holder.dart';
import 'package:kar_zar/web/widgets/bottombar.dart';
import 'package:kar_zar/utilities/constants.dart';
import 'package:kar_zar/web/widgets/appbar.dart';
import 'package:kar_zar/utilities/api.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math';

class WebQuestionPage extends StatefulWidget {
  const WebQuestionPage({Key? key, this.questionId}) : super(key: key);
  static const String id = 'web_question_screen';
  final int? questionId;

  @override
  _WebQuestionPageState createState() => _WebQuestionPageState();
}

class _WebQuestionPageState extends State<WebQuestionPage> {
  final formKey = GlobalKey<FormState>();
  Random random = Random();
  bool isLoggedIn = false;
  String? phoneNumber;
  String credentials = '';
  String qBody = '';
  String option1 = '';
  String option2 = '';
  String option3 = '';
  String option4 = '';
  int? option1count;
  int? option2count;
  int? option3count;
  int? option4count;
  List phoneNumbers = [];

  String getRandomIcons() {
    int avatar = random.nextInt(kAvatars.length);
    return kAvatars[avatar];
  }

  getNumbers() async {
    List data = await Api.getVote(widget.questionId);
    for (int i = 0; i < data.length; i++) {
      String newNumber = data[i]["Voter_Phone_Number"];
      phoneNumbers.add(newNumber);
    }
  }

  getLoginStatus() async {
    bool accessIsValid = await Api.accessChecker();
    if (accessIsValid) {
      isLoggedIn = true;
    } else if (!accessIsValid) {
      var data = await Api.accessMaker();
      if (data == {}) isLoggedIn = true;
      if (data['msg'] == 'no refresh token') isLoggedIn = false;
    }
  }

  @override
  void initState() {
    super.initState();
    getLoginStatus();
    getNumbers();
  }

  @override
  Widget build(BuildContext context) {
    double? pageWidth = MediaQuery.of(context).size.width;
    return RawKeyboardListener(
      autofocus: true,
      focusNode: FocusNode(),
      onKey: (event) {
        if (event.isKeyPressed(LogicalKeyboardKey.enter)) {
          setState(() {
            getLoginStatus();
          });
        }
      },
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 50, horizontal: 100).copyWith(bottom: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    isLoggedIn ? const AdminWebBar() : const WebBar(),
                    Padding(
                      padding: pageWidth > 420 && pageWidth < 1200
                          ? const EdgeInsets.symmetric(vertical: 50, horizontal: 0)
                              .copyWith(bottom: 0)
                          : const EdgeInsets.symmetric(vertical: 50, horizontal: 200)
                              .copyWith(bottom: 0),
                      child: Form(
                        key: formKey,
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(bottom: 100),
                              child: FutureBuilder<Map<String, dynamic>>(
                                future: Api.getQ(widget.questionId),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState == ConnectionState.waiting) {
                                    return const CircularProgressIndicator();
                                  }
    
                                  if (snapshot.hasError) {
                                    return Center(
                                      child: Text(
                                          'something went wrong! : ' + snapshot.error.toString()),
                                    );
                                  }
    
                                  if (!snapshot.hasData) {
                                    return const Center(child: CircularProgressIndicator());
                                  }
    
                                  if (snapshot.connectionState == ConnectionState.none) {
                                    return const Center(child: CircularProgressIndicator());
                                  }
    
                                  if (snapshot.hasData) {
                                    Map data = snapshot.data!;
                                    qBody = data['Q_Body'];
                                    option1 = data['Option_1'];
                                    option2 = data['Option_2'];
                                    option3 = data['Option_3'];
                                    option4 = data['Option_4'];
                                    return WebQuestionHolder(
                                      qBody: qBody,
                                      option1: option1,
                                      option2: option2,
                                      option3: option3,
                                      option4: option4,
                                    );
                                  }
                                  return const Center(child: Text('something went wrong!'));
                                },
                              ),
                            ),
                            Directionality(
                              textDirection: TextDirection.rtl,
                              child: CustomTextField(
                                hintText: 'نام و نام خانوادگی خود را وارد کنید',
                                label: 'نام و نام خانوادگی (اختیاری)',
                                keyboardType: TextInputType.name,
                                onSaved: (value) => credentials = value!,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20, bottom: 10),
                              child: CustomTextField(
                                hintText: 'شماره ی تلفن همراه خود وارد کنید',
                                label: ' (اجباری) شماره ی همراه',
                                keyboardType: TextInputType.phone,
                                validator: (value) {
                                  if (value!.length == 11 &&
                                      RegExp(r'^[0-9]+$').hasMatch(value) &&
                                      value.substring(0, 2) == '09') {
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
                                onPressed: () async {
                                  int choice = Getter().getChoice();
                                  String opinion = Getter().getExtraOpinion();
                                  var data = await Api.getQ(widget.questionId);
                                  option1count = data['Option_1_count'];
                                  option2count = data['Option_2_count'];
                                  option3count = data['Option_3_count'];
                                  option4count = data['Option_4_count'];
                                  if (formKey.currentState!.validate()) {
                                    if (choice == 0 && opinion == '') {
                                      showDialog(
                                        context: context,
                                        builder: (context) => const AlertDialog(
                                          content: Text(
                                              'لطفا یک گزینه انتخاب کنید یا نظر شخصی خود را وارد کنید'),
                                        ),
                                      );
                                    } else {
                                      if (choice == 1) option1count = option1count! + 1;
                                      if (choice == 2) option2count = option2count! + 1;
                                      if (choice == 3) option3count = option3count! + 1;
                                      if (choice == 4) option4count = option4count! + 1;
                                      if (!phoneNumbers.contains(phoneNumber!)) {
                                        await Api.setVote(phoneNumber!, credentials, choice, opinion,
                                            widget.questionId);
                                        await Api.countVote(
                                            qBody,
                                            option1,
                                            option2,
                                            option3,
                                            option4,
                                            option1count!,
                                            option2count!,
                                            option3count!,
                                            option4count!,
                                            widget.questionId);
                                        Navigator.pop(context);
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          const SnackBar(
                                            backgroundColor: Colors.green,
                                            content: Text(
                                              'نظر شما ثبت شد',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18,
                                              ),
                                            ),
                                          ),
                                        );
                                      } else {
                                        showDialog(
                                          context: context,
                                          builder: (context) => const AlertDialog(
                                            content: Text('شما قبلا رای داده اید'),
                                          ),
                                        );
                                      }
                                    }
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
                      child: FutureBuilder<List<dynamic>>(
                        future: Api.getVote(widget.questionId),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            List<Widget> peoples = [];
                            for (int i = 0; i < snapshot.data!.length; i++) {
                              var people = Card(
                                color: Colors.grey,
                                shape: const CircleBorder(
                                    side: BorderSide(width: 0, color: Colors.transparent)),
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                child: Image.network(
                                  getRandomIcons(),
                                  fit: BoxFit.fill,
                                ),
                              );
                              peoples.add(people);
                            }
                            return GridView(
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: pageWidth < 1200
                                    ? pageWidth < 900
                                        ? 5
                                        : 8
                                    : 10,
                                crossAxisSpacing: 40,
                                mainAxisSpacing: 40,
                              ),
                              children: peoples,
                            );
                          }
                          return Container();
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const WebBottomBar()
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
      onChanged: onSaved,
    );
  }
}
