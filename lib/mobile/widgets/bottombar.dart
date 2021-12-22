import 'package:flutter/material.dart';

class MobileBottomBar extends StatefulWidget {
  const MobileBottomBar({Key? key}) : super(key: key);

  @override
  _MobileBottomBarState createState() => _MobileBottomBarState();
}

class _MobileBottomBarState extends State<MobileBottomBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.only(top: 20, bottom: 20),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    'تمامی حقوق برای شرکت توسعه فناوری برخط بنیاد توسعه خوی محفوظ است.',
                    softWrap: true,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[200],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'طراحی و توسعه توسط',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[200],
                  ),
                ),
                TextButton(
                  child: const Text(
                    'تیم توسعه دارالصّفا',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.lightBlue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
      color: Colors.black87,
    );
  }
}
