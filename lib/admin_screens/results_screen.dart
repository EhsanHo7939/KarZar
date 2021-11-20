import 'package:flutter/material.dart';
import 'package:kar_zar/custom_widgets/appbar.dart';

class AdminResultsScreen extends StatefulWidget {
  const AdminResultsScreen({Key? key}) : super(key: key);
  static const String id = 'admin_results_screen';

  @override
  _AdminResultsScreenState createState() => _AdminResultsScreenState();
}

class _AdminResultsScreenState extends State<AdminResultsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 100)
            .copyWith(bottom: 0),
        child: Column(
          children: const <Widget>[
            CustomAdminAppBar(),
          ],
        ),
      ),
    );
  }
}
