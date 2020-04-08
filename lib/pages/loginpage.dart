import 'package:flutter/material.dart';
import 'package:flutter_ui_three/constants/constants.dart';
import 'package:flutter_ui_three/pages/mainpage.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> scaleAnim;
  Animation<double> textScaleAnim;
  Animation<Offset> buttonOffsetAnim;

  @override
  void initState() {
    super.initState();
    controller = new AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    scaleAnim = new Tween<double>(
      begin: 2,
      end: 1,
    ).animate(CurvedAnimation(
      parent: controller,
      curve: Curves.decelerate,
    ));

    textScaleAnim = new Tween<double>(
      begin: 2,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.2,
          1.0,
          curve: Curves.fastOutSlowIn,
        ),
      ),
    );

    buttonOffsetAnim = new Tween<Offset>(
      begin: Offset(0, 1.5),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.5,
          1.0,
          curve: Curves.fastOutSlowIn,
        ),
      ),
    );

    controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ScaleTransition(
          scale: scaleAnim,
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.pinkAccent[100],
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/background.jpg',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Positioned(
          top: 150,
          left: 0,
          right: 0,
          child: Align(
            alignment: Alignment.center,
            child: ScaleTransition(
              scale: textScaleAnim,
              child: Text(
                'Feel the View',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: yOne,
                  fontSize: 50.0,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 50,
          left: 0,
          right: 0,
          child: SlideTransition(
            position: buttonOffsetAnim,
            child: Align(
              alignment: Alignment.center,
              child: Column(
                children: <Widget>[
                  FlatButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MainPage(),
                      ),
                    ),
                    color: Colors.pinkAccent[100],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 100,
                      vertical: 20,
                    ),
                    child: Text(
                      'Sign in',
                      style: TextStyle(
                        fontFamily: mMed,
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Create an account',
                    style: TextStyle(
                      fontFamily: mMed,
                      color: Colors.white,
                      fontSize: 15.0,
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
