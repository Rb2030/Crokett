import 'dart:async';
// import 'package:audioplayers/audio_cache.dart';
import 'package:crokett/core/global/colors/custom_colours.dart';
import 'package:crokett/core/global/constants/constants.dart';
import 'package:crokett/core/global/helpers/responsive_screen_helper.dart';
import 'package:crokett/core/global/hive/hive_helper.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  
  bool showOnBoarding = true;
  String loggedInToken = '';

 // final player = AudioCache();
  late AnimationController bouncingAnimationController;
  late AnimationController spinAnimationController1;
  late AnimationController spinAnimationController2;
  late AnimationController fadeAnimationController;
  late Animation<double> fadeAnimation;

  double responsiveBoxSize = 6;
  Color bgColor = Colors.white;

  bool _firstButtonVisible = true;
  bool _secondButtonVisible = false;
  bool animationFinished = false;

  @override
  void initState() {
    super.initState();
    // First launch of app?
    HiveHelper.showOnBoarding().then((value) {
      if (value == true) showOnBoarding = value;
    });
    // Logged In?
    HiveHelper.getToken().then((value) {
      if (value != '') loggedInToken = value;
    });

    bouncingAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );
    spinAnimationController1 = AnimationController(
      vsync: this,
      value: 0,
      duration: const Duration(milliseconds: 800),
    );
    spinAnimationController2 = AnimationController(
      vsync: this,
      value: 0,
      duration: const Duration(milliseconds: 800),
    );
    fadeAnimationController = AnimationController(
      vsync: this,
      value: 0,
      duration: const Duration(milliseconds: 1000),
    );
    fadeAnimation = CurvedAnimation(
      parent: fadeAnimationController,
      curve: Curves.easeIn,
    );

    // Starting the animations
    bouncingAnimationController.forward().then((value) {
      responsiveBoxSize = 5.5;
      setState(() {});
   //   player.play(Constants.soundHobClick);
      Future<void>.delayed(const Duration(milliseconds: 600), () {
        spinAnimationController1.forward(from: 0).then((value) {
          setState(() {
            _secondButtonVisible = true;
            _firstButtonVisible = false;
          });
          Future<void>.delayed(const Duration(milliseconds: 1600), () {
            spinAnimationController2.forward(from: 0).then((value) {
              setState(() {
                animationFinished = true;
              });
              Future<void>.delayed(const Duration(milliseconds: 200), () {
                responsiveBoxSize = 2.6;
                bgColor = CustomColours.crokettYellow;
                setState(() {});
                fadeAnimationController.forward().then((_) {
                  bool loggedIn = loggedInToken != '' ? true : false;
                  /// MARK: ----------------------------------------------------------------- In here should be the move to either the login page, the onboarding video, or the main menu
                });
              });
            });
          });
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final ResponsiveScreenConfig rsc = ResponsiveScreenConfig(context);
    return AnimatedContainer(
      duration: const Duration(seconds: 1),
      color: bgColor,
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Align(
              child: AnimatedContainer(
                duration: const Duration(seconds: 1),
                width: rsc.rWP(100),
                height: rsc.rHP(100),
                color: bgColor,
                child: Center(
                  child: Row(
                    children: [
                      const Spacer(),
                      FadeTransition(
                        opacity: fadeAnimationController,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 1, 0, 0),
                          child: Text(
                            'CR',
                            style: Theme.of(context).textTheme.headline5,
                          ),
                        ),
                      ),
                      const SizedBox(width: 1),
                      Stack(
                        children: [
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 700),
                            height: rsc.rH(responsiveBoxSize),
                            width: rsc.rH(responsiveBoxSize),
                            child: Visibility(
                              visible: _firstButtonVisible,
                              child: RotationTransition(
                                turns: Tween(begin: 0.0, end: 0.4)
                                    .animate(spinAnimationController1),
                                child: Image.asset(Constants.imageHobPower1),
                              ),
                            ),
                          ),
                          AnimatedContainer(
                            duration: const Duration(seconds: 1),
                            height: rsc.rH(responsiveBoxSize),
                            width: rsc.rH(responsiveBoxSize),
                            child: Visibility(
                              visible: _secondButtonVisible,
                              child: RotationTransition(
                                turns: Tween(begin: 0.4, end: 0.1)
                                    .animate(spinAnimationController2),
                                child: Image.asset(Constants.imageHobPower2),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 1),
                      FadeTransition(
                        opacity: fadeAnimationController,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 1, 0, 0),
                          child: Text(
                            'KETT',
                            style: Theme.of(context).textTheme.headline5,
                          ),
                        ),
                      ),
                      const Spacer()
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
