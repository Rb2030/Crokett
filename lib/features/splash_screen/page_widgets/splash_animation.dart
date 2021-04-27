import 'dart:async';
// import 'package:audioplayers/audio_cache.dart';
import 'package:crokett/core/global/asset_names.dart/images_and_sounds.dart';
import 'package:crokett/core/global/colors/custom_colours.dart';
import 'package:crokett/core/global/helpers/responsive_screen_helper.dart';
import 'package:crokett/features/login_and_sign_up/blocs/auth_bloc/auth_bloc.dart';
import 'package:crokett/routes/crokett_configuration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashAnimation extends StatefulWidget {
  final Function(String) nextScreen;

  SplashAnimation({required this.nextScreen}) : super();

  @override
  _SplashAnimationState createState() => _SplashAnimationState();
}

class _SplashAnimationState extends State<SplashAnimation>
    with TickerProviderStateMixin {
  late Function(String) nextScreen;
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

  @override
  void initState() {
    super.initState();
    nextScreen = widget.nextScreen;
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
      //   player.play(Sounds.soundHobClick);
      Future<void>.delayed(const Duration(milliseconds: 600), () {
        spinAnimationController1.forward(from: 0).then((value) {
          setState(() {
            _secondButtonVisible = true;
            _firstButtonVisible = false;
          });
          Future<void>.delayed(const Duration(milliseconds: 1600), () {
            spinAnimationController2.forward(from: 0).then((value) {
              setState(() {});
              Future<void>.delayed(const Duration(milliseconds: 200), () {
                responsiveBoxSize = 2.6;
                bgColor = CustomColours.crokettYellow;
                setState(() {});
                fadeAnimationController.forward().then((_) async {
                  BlocProvider.of<AuthBloc>(context)
                      .add(SplashAnimationFinished());
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
    return BlocConsumer<AuthBloc, AuthState>(listener: (context, state) {
      if (state is AuthStateSplashAnimationFinished) {
        if (state.loggedIn == true) {
          nextScreen(HOME);
        } else {
          nextScreen(LOGIN);
        }
      }
    }, builder: (context, state) {
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
                              'cr',
                              style: Theme.of(context).textTheme.headline1,
                            ),
                          ),
                        ),
                        const SizedBox(width: 1),
                        Column(
                          children: [
                            const Spacer(),
                            SizedBox(height: 8),
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
                                      child: Image.asset(Images.imageHobPower1),
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
                                      child: Image.asset(Images.imageHobPower2),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const Spacer()
                          ],
                        ),
                        const SizedBox(width: 1),
                        FadeTransition(
                          opacity: fadeAnimationController,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 1, 0, 0),
                            child: Text(
                              'kett',
                              style: Theme.of(context).textTheme.headline1,
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
    });
  }
}
