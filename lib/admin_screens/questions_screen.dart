import 'package:flutter/material.dart';
import 'package:kar_zar/custom_widgets/appbar.dart';

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
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(25),
                                    ),
                                    color: Colors.teal,
                                  ),
                                  width: 400,
                                  height: 250,
                                  child: Stack(
                                    children: <Widget>[
                                      Container(
                                        width: 400,
                                        height: 120,
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(25),
                                          ).copyWith(
                                            bottomLeft:
                                                const Radius.circular(0.0),
                                          ),
                                          color: Colors.cyan,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 280.0),
                                          child: Container(
                                            margin: const EdgeInsets.all(10.0),
                                            decoration: BoxDecoration(
                                              image: const DecorationImage(
                                                image: NetworkImage(
                                                  "https://images.unsplash.com/photo-1608494603993-d16a0841a78b?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1914&q=80",
                                                ),
                                                fit: BoxFit.fill,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: const <Widget>[
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: 43.0, left: 280.0),
                                          ),
                                          Text(
                                            "نفر #",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15.0,
                                            ),
                                          ),
                                          Text(
                                            "...امضا کرده اند",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.fromLTRB(
                                            100, 150.0, 15.0, 5.0),
                                        child: Text(
                                          " کارزار برای این ساخته شده است که گوییم برای این و ان است ",
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                          ),
                                          maxLines: 2,
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.fromLTRB(
                                            20.0, 90.0, 100.0, 8.0),
                                        child: CircleAvatar(
                                          backgroundColor: Colors.white,
                                          radius: 30.0,
                                          child: Icon(
                                            Icons.border_color_outlined,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 220,
                                        left: 25,
                                        child: MaterialButton(
                                          height: 40,
                                          elevation: 10,
                                          color: Colors.red,
                                          child: const Text(
                                            'delete',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          onPressed: () {
                                            showDialog(
                                              context: context,
                                              builder: (context) {
                                                return AlertDialog(
                                                  title: const Text(
                                                    'حدف',
                                                    textDirection:
                                                        TextDirection.rtl,
                                                  ),
                                                  content: const Text(
                                                      'ایا از حدف کردن نظرسنجی مطمعن هستید؟'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                      child: const Text(
                                                        'خیر',
                                                        style: TextStyle(
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.w300,
                                                        ),
                                                      ),
                                                    ),
                                                    TextButton(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                      child: const Text(
                                                        'بله',
                                                        style: TextStyle(
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.w300,
                                                        ),
                                                      ),
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
                              ],
                            );
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
  }
}
