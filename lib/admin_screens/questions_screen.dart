import 'package:flutter/material.dart';
import 'package:kar_zar/custom_widgets/appbar.dart';
import 'package:kar_zar/custom_widgets/grids_bubble.dart';

class AdminQuestionsScreen extends StatefulWidget {
  const AdminQuestionsScreen({Key? key}) : super(key: key);
  static const String id = 'admin_questions_screen';

  @override
  _AdminQuestionsScreenState createState() => _AdminQuestionsScreenState();
}

class _AdminQuestionsScreenState extends State<AdminQuestionsScreen> {
  @override
  Widget build(BuildContext context) {
    double? isWeb = MediaQuery.of(context).size.width;
    return isWeb <= 420
        ? const Scaffold()
        : Scaffold(
            body: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 50, horizontal: 100)
                        .copyWith(bottom: 0),
                child: Column(
                  children: <Widget>[
                    const CustomAdminAppBar(),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: SizedBox(
                        height: 570,
                        child: GridView.builder(
                          itemCount: 10,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            childAspectRatio: 1.5,
                          ),
                          itemBuilder: (context, index) {
                            return const GridsBubble();
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
