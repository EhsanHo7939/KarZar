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
