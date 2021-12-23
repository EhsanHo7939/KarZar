import 'package:kar_zar/utilities/api.dart';
import 'package:flutter/material.dart';

class WebGrids extends StatelessWidget {
  const WebGrids({
    Key? key,
    this.color,
    this.qBody,
    this.vote,
    this.authorFirstName,
    this.authorLastName,
  }) : super(key: key);
  final Color? color;
  final String? qBody;
  final String? authorFirstName;
  final String? authorLastName;
  final int? vote;

  @override
  Widget build(BuildContext context) {
    double? karzarHeightSize = 180;
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        side: BorderSide(width: 1, color: color!),
        borderRadius: BorderRadius.circular(10),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                Card(
                  // margin: EdgeInsets.all(0),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    // side: BorderSide(width: .5, color: color!),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  color: Colors.white,
                  child: SizedBox(
                    height: karzarHeightSize,
                    child: Stack(
                      children: [
                        FutureBuilder<List<dynamic>>(
                          future: Api.getVote(vote!),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              int voteCount = snapshot.data!.length;
                              return Container(
                                height: karzarHeightSize * .40,//رنگی
                                width: double.infinity,
                                padding: const EdgeInsets.only(right: 150),
                                color: color,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 6),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(right: 5, left: 5),
                                            child: Text(
                                              '$voteCount',
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20,
                                                  fontFamily: 'Vazir-Bold',),
                                            ),
                                          ),
                                          const Text(
                                            'نفر',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: const [
                                          Text(
                                            'رای داده اند.',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }
                            return const SizedBox();
                          },
                        ),
                        Container(
                          height: karzarHeightSize * 1,
                          width: double.infinity,
                          padding: EdgeInsets.only(right: 150, top: karzarHeightSize * .45),//روی سوال
                          child: Padding(
                            padding: const EdgeInsets.only(top: 15),
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
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(width: 2, color: color!),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            margin: const EdgeInsets.only(right: 12),
                            child: SizedBox(
                              height: 110,
                              width: 110,
                              child: Image.network(
                                'https://static01.nyt.com/images/2020/07/17/business/00virus-cities1/00virus-cities1-mediumSquareAt3X.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.only(left: 20, top: karzarHeightSize * .22),
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
                ),
              ],
            ),flex: 4,
          ),
          Expanded(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 5, left: 5),
                  child: Container(
                    color: color,
                    height: 1,
                    child: const Divider(),
                  ),
                ),
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
                      minLeadingWidth: 0,
                      leading: const Icon(Icons.person),
                      title: Text(' از طرف : $authorFirstName $authorLastName'),
                    ),
                  ),
                ),
              ],
            ),flex: 1,
          ),
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
    this.authorFirstName,
    this.authorLastName,
  }) : super(key: key);
  final Color? color;
  final String? qBody;
  final String? authorFirstName;
  final String? authorLastName;
  final int? vote;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Padding(
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
                    future: Api.getVote(vote!),
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
                    ' از طرف : $authorFirstName $authorLastName',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
