import 'package:flutter/material.dart';
import 'package:kar_zar/networking/api.dart';

class WebGrids extends StatelessWidget {
  const WebGrids({
    Key? key,
    this.color,
    this.qBody,
    this.vote,
    this.author,
  }) : super(key: key);
  final Color? color;
  final String? qBody;
  final String? author;
  final int? vote;

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
                FutureBuilder<List<dynamic>>(
                  future: Networking().getVote(vote!),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      int voteCount = snapshot.data!.length;
                      return Padding(
                        padding: const EdgeInsets.all(16),
                        child: Text(
                          ' تعداد $voteCount نفر '
                          '\n'
                          'شرکت کرده اند',
                          textAlign: TextAlign.end,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      );
                    }
                    return Container();
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    shape: const RoundedRectangleBorder(
                      side: BorderSide(color: Colors.transparent, width: 0),
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    child: Image.network(
                      'https://static01.nyt.com/images/2020/07/17/business/00virus-cities1/00virus-cities1-mediumSquareAt3X.jpg',
                      fit: BoxFit.fill,
                      height: 90,
                      width: 90,
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
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: ListTile(
                leading: const Icon(Icons.person),
                title: Text(
                  ' از طرف : $author',
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
    this.vote,
    this.author,
  }) : super(key: key);
  final Color? color;
  final String? qBody;
  final String? author;
  final int? vote;
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
                FutureBuilder<List<dynamic>>(
                  future: Networking().getVote(vote!),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      int voteCount = snapshot.data!.length;
                      return Padding(
                        padding: const EdgeInsets.all(16),
                        child: Text(
                          ' تعداد $voteCount نفر '
                          '\n'
                          'شرکت کرده اند',
                          textAlign: TextAlign.end,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      );
                    }
                    return Container();
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    shape: const RoundedRectangleBorder(
                      side: BorderSide(color: Colors.transparent, width: 0),
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    child: Image.network(
                      'https://static01.nyt.com/images/2020/07/17/business/00virus-cities1/00virus-cities1-mediumSquareAt3X.jpg',
                      fit: BoxFit.fill,
                      height: 90,
                      width: 90,
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
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: ListTile(
                leading: const Icon(Icons.person),
                title: Text(
                  ' از طرف : $author',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
