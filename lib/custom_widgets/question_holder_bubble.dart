import 'package:flutter/material.dart';

bool? isActive1 = false;
bool? isActive2 = false;
bool? isActive3 = false;
bool? isActive4 = false;
String? extraOption;
TextEditingController controller = TextEditingController();

class QuestionHolderBubble extends StatefulWidget {
  const QuestionHolderBubble({
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
  State<QuestionHolderBubble> createState() => _QuestionHolderBubbleState();
}

class _QuestionHolderBubbleState extends State<QuestionHolderBubble> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(25)),
        boxShadow: [
          BoxShadow(offset: Offset(0, 0), blurRadius: 25, color: Colors.black26)
        ],
      ),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Container(
                    height: 150,
                    width: 150,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          "https://cdn.smarttiz.com/Image/News/khoy-cityy_980814152840087.jpg",
                        ),
                      ),
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
                  ? const BorderSide(color: Colors.cyan, width: 1)
                  : const BorderSide(color: Colors.grey, width: 1),
              onTap: () {
                setState(() {
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
                  ? const BorderSide(color: Colors.cyan, width: 1)
                  : const BorderSide(color: Colors.grey, width: 1),
              textMsg: widget.option2,
              onTap: () {
                setState(() {
                  controller.clear();
                  isActive1 = false;
                  isActive2 = true;
                  isActive3 = false;
                  isActive4 = false;
                });
              },
            ),
            QuestionMaker(
              isActive: isActive3,
              side: isActive3!
                  ? const BorderSide(color: Colors.cyan, width: 1)
                  : const BorderSide(color: Colors.grey, width: 1),
              textMsg: widget.option3,
              onTap: () {
                setState(() {
                  controller.clear();
                  isActive1 = false;
                  isActive2 = false;
                  isActive3 = true;
                  isActive4 = false;
                });
              },
            ),
            QuestionMaker(
              isActive: isActive4,
              side: isActive4!
                  ? const BorderSide(color: Colors.cyan, width: 1)
                  : const BorderSide(color: Colors.grey, width: 1),
              textMsg: widget.option4,
              onTap: () {
                setState(() {
                  controller.clear();
                  isActive1 = false;
                  isActive2 = false;
                  isActive3 = false;
                  isActive4 = true;
                });
              },
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: TextField(
                controller: controller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    borderSide: BorderSide(color: Colors.grey, width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    borderSide: BorderSide(color: Colors.cyan, width: 1),
                  ),
                  hintText: 'نظر شخصی خودتان را وارد کنید',
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 50, horizontal: 20),
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

class AdminQuestionHolderBubble extends StatefulWidget {
  const AdminQuestionHolderBubble({
    Key? key,
    required this.option1,
    required this.option2,
    required this.option3,
    required this.option4,
    required this.qBody,
  }) : super(key: key);
  final void Function(String) option1;
  final void Function(String) option2;
  final void Function(String) option3;
  final void Function(String) option4;
  final void Function(String) qBody;

  @override
  _AdminQuestionHolderBubbleState createState() =>
      _AdminQuestionHolderBubbleState();
}

class _AdminQuestionHolderBubbleState extends State<AdminQuestionHolderBubble> {
  bool visible = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(25)),
        boxShadow: [
          BoxShadow(offset: Offset(0, 0), blurRadius: 25, color: Colors.black26)
        ],
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
                      Container(
                        height: 150,
                        width: 150,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              "https://cdn.smarttiz.com/Image/News/khoy-cityy_980814152840087.jpg",
                            ),
                          ),
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
            Column(children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: TextField(
                  decoration: const InputDecoration(
                    hintText: 'لطفا رای اول را وارد کنید',
                    labelText: 'رای اول',
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(25))),
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
                        borderRadius: BorderRadius.all(Radius.circular(25))),
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
                        borderRadius: BorderRadius.all(Radius.circular(25))),
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
                        borderRadius: BorderRadius.all(Radius.circular(25))),
                  ),
                  onChanged: widget.option4,
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}

class MobileQuestionHolder extends StatefulWidget {
  const MobileQuestionHolder({Key? key, required this.widgets})
      : super(key: key);
  final Widget widgets;

  @override
  _MobileQuestionHolderState createState() => _MobileQuestionHolderState();
}

class _MobileQuestionHolderState extends State<MobileQuestionHolder> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(25)),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 0),
            blurRadius: 25,
            color: Colors.black26,
          )
        ],
      ),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          children: <Widget>[
            Center(
              child: Card(
                margin: const EdgeInsets.only(right: 10),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Image.asset(
                  'assets/Khoy_city.png',
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: const [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(right: 24, left: 24),
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: Text(
                        'سوال مربوط به نظر سنجی اینجا قرار خواهد گرفت.',
                        softWrap: true,
                        maxLines: 5,
                        overflow: TextOverflow.visible,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            QuestionMaker(
              isActive: isActive1,
              textMsg: 'نظر یک اینگونه میباشد',
              side: isActive1!
                  ? const BorderSide(color: Colors.lightBlueAccent, width: 1)
                  : const BorderSide(color: Colors.grey, width: 1),
              onTap: () {
                setState(() {
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
                  ? const BorderSide(color: Colors.lightBlueAccent, width: 1)
                  : const BorderSide(color: Colors.grey, width: 1),
              textMsg: 'نظر دو اینگونه میباشد',
              onTap: () {
                setState(() {
                  controller.clear();
                  isActive1 = false;
                  isActive2 = true;
                  isActive3 = false;
                  isActive4 = false;
                });
              },
            ),
            QuestionMaker(
              isActive: isActive3,
              side: isActive3!
                  ? const BorderSide(color: Colors.lightBlueAccent, width: 1)
                  : const BorderSide(color: Colors.grey, width: 1),
              textMsg: 'نظر سه اینگونه میباشد',
              onTap: () {
                setState(() {
                  controller.clear();
                  isActive1 = false;
                  isActive2 = false;
                  isActive3 = true;
                  isActive4 = false;
                });
              },
            ),
            QuestionMaker(
              isActive: isActive4,
              side: isActive4!
                  ? const BorderSide(color: Colors.cyan, width: 1)
                  : const BorderSide(color: Colors.grey, width: 1),
              textMsg: 'نظر چهار اینگونه میباشد',
              onTap: () {
                setState(() {
                  controller.clear();
                  isActive1 = false;
                  isActive2 = false;
                  isActive3 = false;
                  isActive4 = true;
                });
              },
            ),
            Padding(
              padding:
                  const EdgeInsets.only(right: 0, left: 0, top: 15, bottom: 10),
              child: TextField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
                controller: controller,
                decoration: const InputDecoration(
                  contentPadding:
                      EdgeInsets.only(top: 18, bottom: 18, right: 15, left: 15),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(color: Colors.grey, width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(color: Colors.cyan, width: 2),
                  ),
                  hintText: 'نظر شخصی خودتان را وارد کنید...',
                  hintStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
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
            const Divider(color: Colors.grey, height: 5),
            widget.widgets
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
      shape: RoundedRectangleBorder(
        side: side!,
        borderRadius: const BorderRadius.all(Radius.circular(25)),
      ),
      child: ListTile(
        title: Text(
          textMsg!,
          textDirection: TextDirection.rtl,
          style: TextStyle(
            color: isActive! ? Colors.black : Colors.black87,
          ),
        ),
        onTap: onTap,
      ),
      color: isActive! ? Colors.cyan : Colors.white,
    );
  }
}

class Getter {
  int getOptionNumber() {
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

  String? getExtraOption() {
    return extraOption;
  }
}
