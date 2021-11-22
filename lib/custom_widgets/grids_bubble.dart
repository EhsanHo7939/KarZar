import 'package:kar_zar/networking/api.dart';
import 'package:flutter/material.dart';

class GridsBubble extends StatelessWidget {
  const GridsBubble({
    Key? key,
    this.color,
  }) : super(key: key);
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(Radius.circular(8)).copyWith(
            bottomRight: const Radius.circular(25),
            bottomLeft: Radius.zero,
          ),
        ),
        child: Stack(
          alignment: Alignment.bottomRight,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  flex: 5,
                  child: Container(
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(8)).copyWith(
                        bottomRight: Radius.zero,
                        bottomLeft: Radius.zero,
                      ),
                    ),
                    child: const Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: 20, right: 5, left: 20),
                        child: Text(
                          ' ؟؟ \n '
                          ' نفر شرکت کرده اند',
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 8,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          bottomRight: Radius.circular(25),
                        ),
                        color: Colors.white54,
                      ),
                      child: const Padding(
                        padding: EdgeInsets.only(top: 70, right: 20, left: 40),
                        child: Text(
                          ' روی سوال اینجا قرار خواهد گرفت',
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              right: 20,
              bottom: 100,
              child: SizedBox(
                height: 100,
                width: 100,
                child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        'https://static01.nyt.com/images/2020/07/17/business/00virus-cities1/00virus-cities1-mediumSquareAt3X.jpg',
                      ),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                  ),
                ),
              ),
            ),
            Positioned(
              right: 335,
              bottom: 25,
              child: FloatingActionButton(
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
                            onPressed: () {
                              Networking().deleteQ(context);
                              Navigator.pop(context);
                            },
                            child: const Text('بله'),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
