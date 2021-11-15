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

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
      decoration: const BoxDecoration(
        color: Colors.white70,
        borderRadius: BorderRadius.all(Radius.circular(25)),
        boxShadow: [
          BoxShadow(offset: Offset(0, 0), blurRadius: 25, color: Colors.black26)
        ],
      ),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          children: <Widget>[
            Row(
              children: const <Widget>[
                Icon(Icons.image),
                Text('question?'),
              ],
            ),
            Card(
              shape: const RoundedRectangleBorder(
                side: BorderSide(color: Colors.grey, width: 1),
                borderRadius: BorderRadius.all(Radius.circular(25)),
              ),
              child: ListTile(
                title: Text(
                  'نظر یک اینگونه میباشد',
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                    color: isActive1! ? Colors.black : Colors.black87,
                  ),
                ),
                onTap: () {
                  setState(() => isActive1 = !isActive1!);
                  isActive2 = false;
                  isActive3 = false;
                  isActive4 = false;
                },
              ),
              color: isActive1! ? Colors.blueAccent : Colors.white,
            ),
            Card(
              shape: const RoundedRectangleBorder(
                side: BorderSide(color: Colors.grey, width: 1),
                borderRadius: BorderRadius.all(Radius.circular(25)),
              ),
              child: ListTile(
                title: Text(
                  'نظر دو اینگونه میباشد',
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                    color: isActive2! ? Colors.black : Colors.black87,
                  ),
                ),
                onTap: () {
                  setState(() => isActive2 = !isActive2!);
                  isActive1 = false;
                  isActive3 = false;
                  isActive4 = false;
                },
              ),
              color: isActive2! ? Colors.blueAccent : Colors.white,
            ),
            Card(
              shape: const RoundedRectangleBorder(
                side: BorderSide(color: Colors.grey, width: 1),
                borderRadius: BorderRadius.all(Radius.circular(25)),
              ),
              child: ListTile(
                title: Text(
                  'نظر سه اینگونه میباشد',
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                    color: isActive3! ? Colors.black : Colors.black87,
                  ),
                ),
                onTap: () {
                  setState(() => isActive3 = !isActive3!);
                  isActive1 = false;
                  isActive2 = false;
                  isActive4 = false;
                },
              ),
              color: isActive3! ? Colors.blueAccent : Colors.white,
            ),
            Card(
              shape: const RoundedRectangleBorder(
                side: BorderSide(color: Colors.grey, width: 1),
                borderRadius: BorderRadius.all(Radius.circular(25)),
              ),
              child: ListTile(
                title: Text(
                  'نظر چهار اینگونه میباشد',
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                    color: isActive4! ? Colors.black : Colors.black87,
                  ),
                ),
                onTap: () {
                  setState(() => isActive4 = !isActive4!);
                  isActive1 = false;
                  isActive2 = false;
                  isActive3 = false;
                },
              ),
              color: isActive4! ? Colors.blueAccent : Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
