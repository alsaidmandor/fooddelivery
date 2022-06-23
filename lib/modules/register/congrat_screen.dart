import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooddelivery/shared/components/default_button.dart';
import 'package:fooddelivery/shared/constants.dart';
import 'package:fooddelivery/shared/style/colors.dart';
import 'package:fooddelivery/shared/style/styles.dart';
import 'package:google_fonts/google_fonts.dart';

class CongratulationsScreen extends StatelessWidget {
  const CongratulationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Expanded(
            child: Container(
              child: Column(
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    height: height * 0.4,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            white,
                            white.withOpacity(0.2),
                          ],
                        )),
                    child: const Image(
                      image: AssetImage('assets/images/pattern.png'),
                      fit: BoxFit.cover,
                    ),
                  ),

                ],
              ),
            ),
          ) ,
          Positioned(
              top: height * 0.3 ,
              left: width / 8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
    children: [
    Image.asset('assets/images/congrats.png'),
    const SizedBox(
    height: 10.0,
    ),
    Text(
    'Congrats!',
    style: GoogleFonts.viga(textStyle:textSize(context).headline3!.copyWith(color:green )),
    ),
      const SizedBox(
        height: 10.0,
      ),
    Text(
    'Your Profile Is Ready  To Use',
    style: GoogleFonts.inter(
    textStyle: textSize(context).headline5!.copyWith(fontSize: 23.0)
    ,
    ),
    ) ,
    ],
    ),),
          Container(
            margin: EdgeInsets.only(bottom: 30.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child:  DefaultButton(
                text: 'Try Order',
                width: 175.0,
                height: 45,
                function: (){},
                isUpper: false,
              ),
            ),
          )

        ],
      ),
    );
  }
}

/*
*  Scaffold(
      body: Column(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: <Widget>[
              Positioned( top: 250,  left: 0, child: Column(
                children: [
                  Image.asset('assets/images/congrats.png'),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Column(
                    children: [
                      Text(
                        'Congrats!',
                        style: GoogleFonts.viga(textStyle:textSize(context).headline3!.copyWith(color:green )),
                      ),
                      Text(
                        'Your Profile Is Ready  To Use',
                        style: GoogleFonts.inter(
                          textStyle: textSize(context).headline5!.copyWith(fontSize: 23.0)
                          ,
                        ),
                      ),
                    ],
                  ) ,
                ],
              )),

            ],
          ),
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 2.4,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    white,
                    white.withOpacity(0.2),
                  ],
                )),
            child: const Image(
              image: AssetImage('assets/images/pattern.png'),
              fit: BoxFit.cover,
            ),
          ),


          // Flexible(
          //   flex: 1,
          //   child: DefaultButton(
          //     text: 'Try Order',
          //     width: 175.0,
          //     height: 45,
          //     function: (){},
          //     isUpper: false,
          //   ),
          // ),
        ],
      ),
    );
* */
