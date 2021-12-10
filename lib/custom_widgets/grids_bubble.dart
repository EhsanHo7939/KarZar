import 'package:flutter/material.dart';

class GridsBubble extends StatelessWidget {
  const GridsBubble({
    Key? key,
    this.color,
    this.qBody,
  }) : super(key: key);
  final Color? color;
  final String? qBody;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: color,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    'تعداد ۵۲۳۱ نفر'
                    '\n'
                    'شرکت کرده اند',
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      image: DecorationImage(
                        image: NetworkImage(
                          'https://static01.nyt.com/images/2020/07/17/business/00virus-cities1/00virus-cities1-mediumSquareAt3X.jpg',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            color: Colors.white,
            child: Text(
              qBody!,
              textAlign: TextAlign.end,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(color: Colors.white, child: const Divider()),
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(8),
              ),
            ),
            child: const Directionality(
              textDirection: TextDirection.rtl,
              child: ListTile(
                leading: Icon(Icons.person),
                title: Text(
                  'از طرف : من',
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class AdminGridsBubble extends StatelessWidget {
  const AdminGridsBubble({
    Key? key,
    this.color,
    this.qBody,
    this.onPressed,
  }) : super(key: key);
  final Color? color;
  final String? qBody;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: color,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                FloatingActionButton(
                  backgroundColor: Colors.red,
                  child: const Icon(Icons.delete),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          content: const Text('ایا از حذف سوال مطمعن هستید؟'),
                          title: const Text('حدف؟'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('خیر'),
                            ),
                            TextButton(
                              onPressed: onPressed,
                              child: const Text('بله'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
                const Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    'تعداد ۵۲۳۱ نفر'
                    '\n'
                    'شرکت کرده اند',
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      image: DecorationImage(
                        image: NetworkImage(
                          'https://static01.nyt.com/images/2020/07/17/business/00virus-cities1/00virus-cities1-mediumSquareAt3X.jpg',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            color: Colors.white,
            child: Text(
              qBody!,
              textAlign: TextAlign.end,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(color: Colors.white, child: const Divider()),
          Container(
            color: Colors.white,
            child: const Directionality(
              textDirection: TextDirection.rtl,
              child: ListTile(
                leading: Icon(Icons.person),
                title: Text(
                  'از طرف : من',
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class MobileGridsBubble extends StatelessWidget {
  const MobileGridsBubble({
    Key? key,
    this.qBody,
    this.color,
  }) : super(key: key);
  final String? qBody;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    double? karzarHeightSize = 160;
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
          side: BorderSide(width: .5, color: color!),
          borderRadius: BorderRadius.circular(10)),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      color: Colors.white,
      child: SizedBox(
        height: karzarHeightSize,
        child: Stack(
          children: [
            Container(
              height: karzarHeightSize * .43,
              width: double.infinity,
              padding: const EdgeInsets.only(right: 150),
              color: color,
              child: const Padding(
                padding: EdgeInsets.only(top: 6),
                child: Text(
                  "2,471 نفر\nرای داده اند.",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            Container(
              height: karzarHeightSize * 1,
              width: double.infinity,
              padding: EdgeInsets.only(right: 150, top: karzarHeightSize * .42),
              child: Padding(
                padding: const EdgeInsets.only(top: 12),
                child: Text(
                  qBody!,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                margin: const EdgeInsets.only(right: 12),
                child: const SizedBox(
                  height: 120,
                  width: 120,
                  child: Image(
                    image: NetworkImage(
                      'https://static01.nyt.com/images/2020/07/17/business/00virus-cities1/00virus-cities1-mediumSquareAt3X.jpg',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(left: 20, top: karzarHeightSize * .24),
              child: Align(
                alignment: Alignment.topLeft,
                child: FloatingActionButton(
                  backgroundColor: color,
                  onPressed: null,
                  child: const Icon(Icons.border_color_outlined),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
