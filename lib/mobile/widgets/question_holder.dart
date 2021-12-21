import 'package:flutter/material.dart';

bool? isActive4 = false;
bool? isActive3 = false;
bool? isActive2 = false;
bool? isActive1 = false;
String extraOption = '';
TextEditingController controller = TextEditingController();

class MobileQuestionHolder extends StatefulWidget {
  const MobileQuestionHolder({
    Key? key,
    required this.widgets,
    required this.qBody,
    required this.option1,
    required this.option2,
    required this.option3,
    required this.option4,
  }) : super(key: key);
  final Widget widgets;
  final String qBody;
  final String option1;
  final String option2;
  final String option3;
  final String option4;

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
        borderRadius: BorderRadius.all(
          Radius.circular(25),
        ),
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
                  borderRadius: BorderRadius.circular(50),
                ),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Image.asset(
                  'images/Khoy_city.jpg',
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
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 24, left: 24),
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: Text(
                        widget.qBody,
                        softWrap: true,
                        maxLines: 5,
                        overflow: TextOverflow.visible,
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            QuestionMaker(
              isActive: isActive1,
              textMsg: widget.option1,
              side: isActive1!
                  ? const BorderSide(color: Colors.lightBlueAccent, width: 1)
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
                  ? const BorderSide(color: Colors.lightBlueAccent, width: 1)
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
              visible: widget.option3 == 'null' ? false : true,
              child: QuestionMaker(
                isActive: isActive3,
                side: isActive3!
                    ? const BorderSide(color: Colors.lightBlueAccent, width: 1)
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
              visible: widget.option4 == 'null' ? false : true,
              child: QuestionMaker(
                isActive: isActive4,
                side: isActive4!
                    ? const BorderSide(color: Colors.cyan, width: 1)
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
              padding: const EdgeInsets.only(right: 0, left: 0, top: 15, bottom: 10),
              child: TextField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
                controller: controller,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.only(top: 18, bottom: 18, right: 15, left: 15),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    borderSide: BorderSide(color: Colors.grey, width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
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
      clipBehavior: Clip.antiAliasWithSaveLayer,
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
