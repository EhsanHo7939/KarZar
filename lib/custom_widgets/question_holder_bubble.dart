import 'package:flutter/material.dart';

class QuestionHolderBubble extends StatefulWidget {
  const QuestionHolderBubble({Key? key}) : super(key: key);

  @override
  State<QuestionHolderBubble> createState() => _QuestionHolderBubbleState();
}

class _QuestionHolderBubbleState extends State<QuestionHolderBubble> {
  bool? isActive1 = false;
  bool? isActive2 = false;
  bool? isActive3 = false;
  bool? isActive4 = false;
  TextEditingController controller = TextEditingController();

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
                  const Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(right: 24),
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: Text(
                          'سوال مربوط به نظر سنجی اینجا قرار خواهد گرفت.',
                          softWrap: true,
                          maxLines: 5,
                          overflow: TextOverflow.visible,
                          style: TextStyle(
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
              textMsg: 'نظر یک اینگونه میباشد',
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
                  ? const BorderSide(color: Colors.cyan, width: 1)
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
            TextField(
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
              ),
              onChanged: (value) {
                isActive1 = false;
                isActive2 = false;
                isActive3 = false;
                isActive4 = false;
                setState(() {});
              },
            ),
          ],
        ),
      ),
    );
  }
}

class AdminQuestionHolderBubble extends StatefulWidget {
  const AdminQuestionHolderBubble({Key? key}) : super(key: key);

  @override
  _AdminQuestionHolderBubbleState createState() =>
      _AdminQuestionHolderBubbleState();
}

class _AdminQuestionHolderBubbleState extends State<AdminQuestionHolderBubble> {
  List<Widget> addOptions = [
    const Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'لطفا گزینه اول را وارد کنید',
          labelText: 'گزینه ی اول',
          prefixText: 'رای اول : ',
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 1),
              borderRadius: BorderRadius.all(Radius.circular(25))),
        ),
      ),
    ),
    const Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'لطفا گزینه دوم را وارد کنید',
          labelText: 'گزینه ی دوم',
          prefixText: 'رای دوم : ',
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 1),
              borderRadius: BorderRadius.all(Radius.circular(25))),
        ),
      ),
    ),
  ];
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
                  const Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(right: 24),
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: TextField(
                          maxLines: 3,
                          style: TextStyle(
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
            const SizedBox(height: 10),
            Column(children: addOptions),
            Visibility(
              visible: visible,
              child: MaterialButton(
                color: Colors.lightBlueAccent,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                child: const Icon(
                  Icons.add,
                  size: 50,
                  color: Colors.white,
                ),
                onPressed: () {
                  if (addOptions.length < 4) {
                    setState(() {
                      addOptions.add(
                        const Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'لطفا گزینه اضافی را وارد کنید',
                              labelText: 'گزینه ی اضافی',
                              prefixText: 'رای اضافی : ',
                              border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey, width: 1),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(25))),
                            ),
                          ),
                        ),
                      );
                    });
                  } else if (addOptions.length == 4) {
                    setState(() => visible = false);
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
