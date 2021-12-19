import 'package:flutter/material.dart';

bool? isActive4 = false;
bool? isActive3 = false;
bool? isActive2 = false;
bool? isActive1 = false;
String extraOption = '';
TextEditingController controller = TextEditingController();

class WebQuestionHolder extends StatefulWidget {
  const WebQuestionHolder({
    Key? key,
    required this.qBody,
    required this.option1,
    required this.option2,
    required this.option3,
    required this.option4,
  }) : super(key: key);
  final String qBody;
  final String option1;
  final String option2;
  final String option3;
  final String option4;

  @override
  State<WebQuestionHolder> createState() => _WebQuestionHolderState();
}

class _WebQuestionHolderState extends State<WebQuestionHolder> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(25)),
        boxShadow: [BoxShadow(offset: Offset(0, 0), blurRadius: 25, color: Colors.black26)],
      ),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    shape: const RoundedRectangleBorder(
                      side: BorderSide(color: Colors.transparent, width: 0),
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                    ),
                    child: Image.network(
                      "https://cdn.smarttiz.com/Image/News/khoy-cityy_980814152840087.jpg",
                      fit: BoxFit.fill,
                      height: 150,
                      width: 150,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 24),
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: Text(
                          widget.qBody,
                          softWrap: true,
                          maxLines: 5,
                          overflow: TextOverflow.visible,
                          style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            QuestionMaker(
              isActive: isActive1,
              textMsg: widget.option1,
              side: isActive1!
                  ? const BorderSide(color: const Color(0xFF05193f), width: 1)
                  : const BorderSide(color: Colors.grey, width: 1),
              onTap: () {
                setState(() {
                  extraOption = '';
                  controller.clear();
                  isActive1 = true;
                  isActive2 = false;
                  isActive3 = false;
                  isActive4 = false;
                });
              },
            ),
            QuestionMaker(
              isActive: isActive2,
              side: isActive2!
                  ? const BorderSide(color: const Color(0xFF05193f), width: 1)
                  : const BorderSide(color: Colors.grey, width: 1),
              textMsg: widget.option2,
              onTap: () {
                setState(() {
                  extraOption = '';
                  controller.clear();
                  isActive1 = false;
                  isActive2 = true;
                  isActive3 = false;
                  isActive4 = false;
                });
              },
            ),
            Visibility(
              visible: widget.option3 == '' ? false : true,
              child: QuestionMaker(
                isActive: isActive3,
                side: isActive3!
                    ? const BorderSide(color: const Color(0xFF05193f), width: 1)
                    : const BorderSide(color: Colors.grey, width: 1),
                textMsg: widget.option3,
                onTap: () {
                  setState(() {
                    extraOption = '';
                    controller.clear();
                    isActive1 = false;
                    isActive2 = false;
                    isActive3 = true;
                    isActive4 = false;
                  });
                },
              ),
            ),
            Visibility(
              visible: widget.option4 == '' ? false : true,
              child: QuestionMaker(
                isActive: isActive4,
                side: isActive4!
                    ? const BorderSide(color: const Color(0xFF05193f), width: 1)
                    : const BorderSide(color: Colors.grey, width: 1),
                textMsg: widget.option4,
                onTap: () {
                  setState(() {
                    extraOption = '';
                    controller.clear();
                    isActive1 = false;
                    isActive2 = false;
                    isActive3 = false;
                    isActive4 = true;
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: TextField(
                maxLines: 6,
                minLines: 3,
                maxLength: 350,
                controller: controller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(25),
                    ),
                    borderSide: BorderSide(color: Colors.grey, width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(25),
                    ),
                    borderSide: BorderSide(color: Colors.cyan, width: 1),
                  ),
                  hintText: 'نظر شخصی خودتان را وارد کنید',
                  hintStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 50, horizontal: 20),
                ),
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    setState(() {
                      isActive1 = false;
                      isActive2 = false;
                      isActive3 = false;
                      isActive4 = false;
                      extraOption = value;
                    });
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AdminWebQuestionHolder extends StatefulWidget {
  const AdminWebQuestionHolder({
    Key? key,
    required this.qBody,
    required this.option1,
    required this.option2,
    required this.option3,
    required this.option4,
  }) : super(key: key);
  final void Function(String) option1;
  final void Function(String) option2;
  final void Function(String) option3;
  final void Function(String) option4;
  final void Function(String) qBody;

  @override
  _AdminWebQuestionHolderState createState() => _AdminWebQuestionHolderState();
}

class _AdminWebQuestionHolderState extends State<AdminWebQuestionHolder> {
  bool visible = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(25)),
        boxShadow: [BoxShadow(offset: Offset(0, 0), blurRadius: 25, color: Colors.black26)],
      ),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Stack(
                    alignment: Alignment.bottomLeft,
                    children: <Widget>[
                      Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        shape: const RoundedRectangleBorder(
                          side: BorderSide(color: Colors.transparent, width: 0),
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                        child: Image.network(
                          "https://cdn.smarttiz.com/Image/News/khoy-cityy_980814152840087.jpg",
                          fit: BoxFit.fill,
                          height: 150,
                          width: 150,
                        ),
                      ),
                      SizedBox(
                        height: 50,
                        child: FloatingActionButton(
                          child: const Icon(
                            Icons.add,
                            size: 30,
                          ),
                          backgroundColor: Colors.lightBlueAccent,
                          elevation: 5,
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 24),
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: TextField(
                          maxLines: 3,
                          style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                          onChanged: widget.qBody,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: TextField(
                    decoration: const InputDecoration(
                      hintText: 'لطفا رای اول را وارد کنید',
                      labelText: 'رای اول',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.all(
                          Radius.circular(25),
                        ),
                      ),
                    ),
                    onChanged: widget.option1,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: TextField(
                    decoration: const InputDecoration(
                      hintText: 'لطفا رای دوم را وارد کنید',
                      labelText: 'رای دوم',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.all(
                          Radius.circular(25),
                        ),
                      ),
                    ),
                    onChanged: widget.option2,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: TextField(
                    decoration: const InputDecoration(
                      hintText: 'لطفا رای اضافی را وارد کنید',
                      labelText: 'رای اضافی',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.all(
                          Radius.circular(25),
                        ),
                      ),
                    ),
                    onChanged: widget.option3,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: TextField(
                    decoration: const InputDecoration(
                      hintText: 'لطفا رای اضافی را وارد کنید',
                      labelText: 'رای اضافی',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.all(
                          Radius.circular(25),
                        ),
                      ),
                    ),
                    onChanged: widget.option4,
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

class QuestionMaker extends StatelessWidget {
  const QuestionMaker({
    Key? key,
    this.isActive,
    this.onTap,
    this.textMsg,
    this.side,
  }) : super(key: key);
  final bool? isActive;
  final String? textMsg;
  final BorderSide? side;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        side: side!,
        borderRadius: const BorderRadius.all(
          Radius.circular(25),
        ),
      ),
      child: ListTile(
        title: Text(
          textMsg!,
          textDirection: TextDirection.rtl,
          style: TextStyle(
            color: isActive! ? Colors.white : Colors.black87,
          ),
        ),
        onTap: onTap,
      ),
      color: isActive! ? const Color(0xFF05193f) : Colors.white,
    );
  }
}

class Getter {
  int getChoice() {
    if (isActive1 == true) {
      return 1;
    } else if (isActive2 == true) {
      return 2;
    } else if (isActive3 == true) {
      return 3;
    } else if (isActive4 == true) {
      return 4;
    } else {
      return 0;
    }
  }

  String getExtraOpinion() {
    return extraOption;
  }
}
