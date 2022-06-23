import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooddelivery/modules/login/login_sc.dart';
import 'package:fooddelivery/shared/components/components.dart';
import 'package:fooddelivery/shared/components/default_button.dart';
import 'package:fooddelivery/shared/style/styles.dart';
import 'package:google_fonts/google_fonts.dart';

class BoardModel {
  final String image;
  final String title;
  final String body;

  BoardModel({required this.image, required this.title, required this.body});
}

class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({Key? key}) : super(key: key);

  @override
  _OnBoardScreenState createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  late List<BoardModel> list;

  void submit() {
    navigateAndFinish(
      widget: LoginScreen(),
      context: context,
    );
  }

  @override
  void initState() {
    super.initState();

    list = [
      BoardModel(
        image: 'assets/images/illustartion1.png',
        title: 'Find your  Comfort Food here',
        body:
            'Here You Can find a chef or dish for every taste and color. Enjoy!',
      ),
      BoardModel(
        image: 'assets/images/illustration2.png',
        title: 'Food Ninja is Where Your Comfort Food Lives',
        body: 'Enjoy a fast and smooth food delivery at your doorstep',
      ),
    ];
  }

  var isLast = false;
  final controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              physics: const BouncingScrollPhysics(),
              onPageChanged: (i) {
                if (i == (list.length - 1) && !isLast) {
                  setState(() => isLast = true);
                } else if (isLast) {
                  setState(() => isLast = false);
                }
              },
              controller: controller,
              itemCount: list.length,
              itemBuilder: (ctx, i) => Padding(
                padding: EdgeInsets.zero,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(height: 30),
                    Expanded(
                      flex: 2,
                      child: Image(
                        image: AssetImage(
                          list[i].image,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    // const SizedBox(height: 15.0),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.only(
                                start: 20.0, end: 20.0),
                            child: Center(
                              child: Container(
                                width: 250,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      list[i].title,
                                      style: GoogleFonts.ptSans(
                                          textStyle: darkTextStyleRegular22()
                                              .copyWith(
                                                  fontWeight: FontWeight.bold)),
                                    ),
                                    const SizedBox(height: 10.0),
                                    Text(
                                      list[i].body,
                                      style: GoogleFonts.ptSans(
                                          textStyle: darkTextStyleRegular12()),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 50.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              DefaultButton(
                                text: 'next',
                                width: 157.0,
                                function: () {
                                  if (isLast) {
                                    submit();
                                  } else {
                                    controller.nextPage(
                                      duration:
                                          const Duration(milliseconds: 750),
                                      curve: Curves.fastLinearToSlowEaseIn,
                                    );
                                  }
                                },
                                isUpper: true,
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
