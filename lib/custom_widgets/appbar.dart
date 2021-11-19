import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: const <Widget>[
            Text(
              'کارزار',
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
              ),
            ),
            Text(
              'پلتفرم مستقل جمع اوری ارای شهرستان خوی',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
          ],
        ),
        const SizedBox(width: 20),
        const CircleAvatar(
          radius: 30,
          backgroundImage: NetworkImage(
            'https://media.istockphoto.com/photos/low-angle-of-tall-building-in-manhattan-picture-id1291177121?b=1&k=20&m=1291177121&s=170667a&w=0&h=aI1PkWS_GkXJ4Qz0gz2cTOud95SS4hUa4iZc1kqWYL4=',
          ),
        ),
      ],
    );
  }
}
