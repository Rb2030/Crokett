import 'dart:async';
import 'package:audioplayers/audio_cache.dart';
import 'package:crokett/core/global/asset_names.dart/images_and_sounds.dart';
import 'package:crokett/core/global/colors/custom_colours.dart';
import 'package:crokett/core/global/helpers/responsive_screen_helper.dart';
import 'package:crokett/features/login_and_sign_up/blocs/auth_bloc/auth_bloc.dart';
import 'package:crokett/routes/crokett_configuration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashAnimation extends StatefulWidget {
  final Function(String) nextScreen;

  SplashAnimation({required this.nextScreen}) : super();

  @override
  _SplashAnimationState createState() => _SplashAnimationState();
}

class _SplashAnimationState extends State<SplashAnimation>
    with TickerProviderStateMixin {
  late Function(String) nextScreen;
  final player = AudioCache();
  late AnimationController bouncingAnimationController;
  late AnimationController spinAnimationController1;
  late AnimationController spinAnimationController2;
  late AnimationController fadeAnimationController;
  late Animation<double> fadeAnimation;

  double spacerToCentralizeHob = 0;
  double responsiveBoxSize = 66;
  Color bgColor = Colors.white;

  bool _firstButtonVisible = true;
  bool _secondButtonVisible = false;

  @override
  void initState() {
    super.initState();
    nextScreen = widget.nextScreen;
    bouncingAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    spinAnimationController1 = AnimationController(
      vsync: this,
      value: 0,
      duration: const Duration(milliseconds: 500),
    );
    spinAnimationController2 = AnimationController(
      vsync: this,
      value: 0,
      duration: const Duration(milliseconds: 500),
    );
    fadeAnimationController = AnimationController(
      vsync: this,
      value: 0,
      duration: const Duration(milliseconds: 700),
    );
    fadeAnimation = CurvedAnimation(
      parent: fadeAnimationController,
      curve: Curves.easeIn,
    );
    player.play(Sounds.soundHobClick);
    // Starting the animations
    bouncingAnimationController.forward().then((value) {
      responsiveBoxSize = 56;
      setState(() {});
      Future<void>.delayed(const Duration(milliseconds: 200), () {
        spinAnimationController1.forward(from: 0).then((value) {
          spacerToCentralizeHob = 0;
          setState(() {
            _secondButtonVisible = true;
          });
          Future<void>.delayed(const Duration(milliseconds: 800), () {
            _firstButtonVisible = false;
            setState(() {});
            spinAnimationController2.forward(from: 0).then((value) {
              setState(() {});
              Future<void>.delayed(const Duration(milliseconds: 300), () {
                responsiveBoxSize = 32;
                bgColor = CustomColours.crokettYellow;
                setState(() {});
                fadeAnimationController.forward().then((_) {
                  Future<void>.delayed(const Duration(milliseconds: 300), () {
                    BlocProvider.of<AuthBloc>(context)
                        .add(SplashAnimationFinished());
                  });
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
    spacerToCentralizeHob = rsc.rW(1);
    return BlocConsumer<AuthBloc, AuthState>(listener: (context, state) {
      if (state is AuthStateSplashAnimationFinished) {
        if (state.loggedIn == true) {
          nextScreen(APPSHELL);
        } else {
          nextScreen(LOGIN);
        }
      }
    }, builder: (context, state) {
      return AnimatedContainer(
        duration: const Duration(seconds: 1),
        color: bgColor,
        child: Scaffold(
          body: AnimatedContainer(
            duration: const Duration(milliseconds: 400),
            color: bgColor,
            width: rsc.rW(100),
            height: rsc.rH(100),
            child: Column(
              children: [
                SizedBox(height: rsc.rH(52)),
                Row(
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
                    Row(
                      children: [
                        // AnimatedContainer(
                        //   duration: const Duration(milliseconds: 2700),
                        //   width: rsc.rH(spacerToCentralizeHob),
                        // ),
                        Column(
                          children: [
                            SizedBox(height: 16),
                            Stack(
                              children: [
                                AnimatedContainer(
                                  duration: const Duration(milliseconds: 700),
                                  height: responsiveBoxSize,
                                  width: responsiveBoxSize,
                                  child: Visibility(
                                    visible: _firstButtonVisible,
                                    child: RotationTransition(
                                      turns: Tween(begin: 0.0, end: 0.4)
                                          .animate(spinAnimationController1),
                                      child: SvgPicture.asset(
                                          Images.imageHobPower1),
                                    ),
                                  ),
                                ),
                                AnimatedContainer(
                                  duration: const Duration(milliseconds: 700),
                                  height: responsiveBoxSize,
                                  width: responsiveBoxSize,
                                  child: Visibility(
                                    visible: _secondButtonVisible,
                                    child: RotationTransition(
                                      turns: Tween(begin: 0.4, end: 0.15)
                                          .animate(spinAnimationController2),
                                      child: SvgPicture.asset(
                                          Images.imageHobPower2),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
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
              ],
            ),
          ),
        ),
      );
    });
  }
}
