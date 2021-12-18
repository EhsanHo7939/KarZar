import 'package:kar_zar/mobile/pages/home_page.dart';
import 'package:flutter/material.dart';

class MobileBar extends StatelessWidget {
  const MobileBar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        GestureDetector(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: const <Widget>[
                  Text(
                    'دارالصّفا',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                  Text(
                    'بنیاد توسعه خوی',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 10),
              Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                shape: const CircleBorder(side: BorderSide(width: 0, color: Colors.transparent)),
                child: Image.asset(
                  'images/Logo.jpg',
                  height: 70,
                ),
              ),
            ],
          ),
          onTap: () {
            Navigator.popAndPushNamed(
              context,
              MobileHomePage.id,
            );
          },
        ),
        const SizedBox(height: 5),
        Divider(color: Colors.grey[600]),
      ],
    );
  }
}
