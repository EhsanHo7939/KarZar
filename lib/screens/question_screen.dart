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
  Random random = Random();
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
        appBar: AppBar(
          elevation: 1,
          backgroundColor: Colors.grey[100],
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Card(
              margin: const EdgeInsets.only(right: 10),
              shape: const CircleBorder(),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Image.asset(
                'assets/khoy.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'دارالصفا',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
              Text(
                'بنیاد توسعه خوی',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 12),
              ),
              // Divider(color: Colors.black,height: 2,)
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(25)),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 0),
                      blurRadius: 25,
                      color: Colors.black26)
                ],
              ),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Column(
                  children: <Widget>[
                    FutureBuilder<Map<String, dynamic>>(
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
                          Map question = snapshot.data!['data'] as Map;
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
                    // Center(
                    //   child: Card(
                    //     margin: const EdgeInsets.only(right: 10),
                    //     shape: RoundedRectangleBorder(
                    //         borderRadius: BorderRadius.circular(50)),
                    //     clipBehavior: Clip.antiAliasWithSaveLayer,
                    //     child: Image.asset(
                    //       'assets/Khoy_city.png',
                    //       width: 200,
                    //       height: 200,
                    //       fit: BoxFit.cover,
                    //     ),
                    //   ),
                    // ),
                    // const SizedBox(
                    //   height: 10,
                    // ),
                    // Row(
                    //   children: const [
                    //     Expanded(
                    //       child: Padding(
                    //         padding: EdgeInsets.only(right: 24, left: 24),
                    //         child: Directionality(
                    //           textDirection: TextDirection.rtl,
                    //           child: Text(
                    //             'سوال مربوط به نظر سنجی اینجا قرار خواهد گرفت.',
                    //             softWrap: true,
                    //             maxLines: 5,
                    //             overflow: TextOverflow.visible,
                    //             style: TextStyle(
                    //                 fontSize: 16, fontWeight: FontWeight.bold),
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    // QuestionMaker(
                    //   isActive: isActive1,
                    //   textMsg: 'نظر یک اینگونه میباشد',
                    //   side: isActive1!
                    //       ? const BorderSide(
                    //       color: Colors.lightBlueAccent, width: 1)
                    //       : const BorderSide(color: Colors.grey, width: 1),
                    //   onTap: () {
                    //     setState(() {
                    //       controller.clear();
                    //       isActive1 = true;
                    //       isActive2 = false;
                    //       isActive3 = false;
                    //       isActive4 = false;
                    //     });
                    //   },
                    // ),
                    // QuestionMaker(
                    //   isActive: isActive2,
                    //   side: isActive2!
                    //       ? const BorderSide(
                    //       color: Colors.lightBlueAccent, width: 1)
                    //       : const BorderSide(color: Colors.grey, width: 1),
                    //   textMsg: 'نظر دو اینگونه میباشد',
                    //   onTap: () {
                    //     setState(() {
                    //       controller.clear();
                    //       isActive1 = false;
                    //       isActive2 = true;
                    //       isActive3 = false;
                    //       isActive4 = false;
                    //     });
                    //   },
                    // ),
                    // QuestionMaker(
                    //   isActive: isActive3,
                    //   side: isActive3!
                    //       ? const BorderSide(
                    //       color: Colors.lightBlueAccent, width: 1)
                    //       : const BorderSide(color: Colors.grey, width: 1),
                    //   textMsg: 'نظر سه اینگونه میباشد',
                    //   onTap: () {
                    //     setState(() {
                    //       controller.clear();
                    //       isActive1 = false;
                    //       isActive2 = false;
                    //       isActive3 = true;
                    //       isActive4 = false;
                    //     });
                    //   },
                    // ),
                    // QuestionMaker(
                    //   isActive: isActive4,
                    //   side: isActive4!
                    //       ? BorderSide(color: taskBlue1, width: 1)
                    //       : const BorderSide(color: Colors.grey, width: 1),
                    //   textMsg: 'نظر چهار اینگونه میباشد',
                    //   onTap: () {
                    //     setState(() {
                    //       controller.clear();
                    //       isActive1 = false;
                    //       isActive2 = false;
                    //       isActive3 = false;
                    //       isActive4 = true;
                    //     });
                    //   },
                    // ),
                    // const SizedBox(
                    //   height: 15,
                    // ),
                    // Padding(
                    //   padding: const EdgeInsets.only(right: 0, left: 0),
                    //   child: TextField(
                    //       keyboardType: TextInputType.multiline,
                    //       maxLines: null,
                    //       controller: controller,
                    //       decoration: InputDecoration(
                    //         contentPadding: const EdgeInsets.only(
                    //             top: 18, bottom: 18, right: 15, left: 15),
                    //         border: const OutlineInputBorder(
                    //           borderRadius:
                    //           BorderRadius.all(Radius.circular(20)),
                    //           borderSide:
                    //           BorderSide(color: Colors.grey, width: 2),
                    //         ),
                    //         focusedBorder: OutlineInputBorder(
                    //           borderRadius:
                    //           const BorderRadius.all(Radius.circular(20)),
                    //           borderSide:
                    //           BorderSide(color: taskBlue1, width: 2),
                    //         ),
                    //         hintText: 'نظر شخصی خودتان را وارد کنید...',
                    //         hintStyle: const TextStyle(
                    //           fontSize: 18,
                    //           fontWeight: FontWeight.bold,
                    //         ),
                    //       ),
                    //       onChanged: (value) {
                    //         if (value.isNotEmpty) {
                    //           setState(() {
                    //             isActive1 = false;
                    //             isActive2 = false;
                    //             isActive3 = false;
                    //             isActive4 = false;
                    //           });
                    //         }
                    //       }),
                    // ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Divider(color: Colors.grey),
                    const SizedBox(
                      height: 10,
                    ),
                    Column(
                      children: <Widget>[
                        const Directionality(
                          textDirection: TextDirection.rtl,
                          child: CustomTextField(
                            hintText: 'نام و نام خانوادگی خود را وارد کنید...',
                            label: 'نام و نام خانوادگی (اختیاری)',
                            keyboardType: TextInputType.name,
                          ),
                        ),
                        const SizedBox(height: 20),
                        const CustomTextField(
                          hintText: 'شماره ی تلفن همراه خود وارد کنید...',
                          label: 'شماره ی همراه (اجباری)',
                          keyboardType: TextInputType.number,
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
                              setState(() => itemCount!.add('user'));
                            },
                          ),
                        ),
                      ],
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
                                  Map question = snapshot.data!['data'] as Map;
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
                          const Directionality(
                            textDirection: TextDirection.rtl,
                            child: CustomTextField(
                              hintText: 'نام و نام خانوادگی خود را وارد کنید ',
                              label: 'نام و نام خانوادگی (اختیاری)',
                              keyboardType: TextInputType.name,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 20, bottom: 10),
                            child: CustomTextField(
                              hintText: 'شماره ی تلفن همراه خود وارد کنید',
                              label: ' (اجباری) شماره ی همراه',
                              keyboardType: TextInputType.phone,
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
