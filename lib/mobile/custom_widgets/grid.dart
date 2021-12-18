import 'package:flutter/material.dart';
import 'package:kar_zar/networking/api.dart';

class MobileGrids extends StatelessWidget {
  const MobileGrids({
    Key? key,
    this.qBody,
    this.color,
    this.vote,
    this.authorFirstName,
    this.authorLastName,
  }) : super(key: key);
  final String? qBody;
  final String? authorFirstName;
  final String? authorLastName;
  final Color? color;
  final int? vote;

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
            FutureBuilder<List<dynamic>>(
              future: Networking().getVote(vote!),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  int voteCount = snapshot.data!.length;
                  return Container(
                    height: karzarHeightSize * .43,
                    width: double.infinity,
                    padding: const EdgeInsets.only(right: 150),
                    color: color,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 6),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              const Text(
                                'نفر',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(right: 5, left: 5),
                                child: Text(
                                  '$voteCount',
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      fontFamily: 'Vazir-Bold'),
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
                                'شرکت کرده اند.',
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
                return Container();
              },
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
                child: SizedBox(
                  height: 120,
                  width: 120,
                  child: Image.network(
                    'https://static01.nyt.com/images/2020/07/17/business/00virus-cities1/00virus-cities1-mediumSquareAt3X.jpg',
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
            Container(color: Colors.white, child: const Divider(),),
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
