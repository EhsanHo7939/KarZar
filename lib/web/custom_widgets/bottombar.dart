import 'package:flutter/material.dart';

class WebBottomBar extends StatefulWidget {
  const WebBottomBar({Key? key}) : super(key: key);

  @override
  _WebBottomBarState createState() => _WebBottomBarState();
}

class _WebBottomBarState extends State<WebBottomBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.only(top: 17, bottom: 17),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              child: const Text(
                'دارک روم',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.lightBlue,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {},
            ),
            Text(
              'طراحی و توسعه توسط',
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey[200],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(7),
              child: Container(
                height: 20,
                width: 1.2,
                color: Colors.white,
              ),
            ),
            Text(
              '.تمامی حقوق برای شرکت توسعه فناوری برخط بنیاد توسعه خوی محفوط است',
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey[200],
              ),
            ),
          ],
        ),
      ),
      color: Colors.black87,
    );
  }
}
