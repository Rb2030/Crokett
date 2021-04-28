import 'package:crokett/core/global/asset_names.dart/images_and_sounds.dart';
import 'package:crokett/core/global/colors/custom_colours.dart';
import 'package:crokett/core/global/helpers/responsive_screen_helper.dart';
import 'package:crokett/features/login_and_sign_up/blocs/login_bloc/login_bloc.dart';
import 'package:crokett/routes/crokett_configuration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ResponsiveScreenConfig rsc = ResponsiveScreenConfig(context);
    return BlocConsumer<LoginBloc, LoginState>(listener: (context, state) {
      // if (state is GoogleSignInSelected) {
      //     nextScreen(GOOGLE_SIGN_IN);
      //   }
      // if (state is SignUpSelected) {
      //     nextScreen(SIGN_UP);
      // }
    }, builder: (context, state) {
      return Scaffold(
        body: SingleChildScrollView(
          child: Align(
            child: Container(
              width: rsc.rW(100),
              height: rsc.rH(100),
              color: CustomColours.crokettYellow,
              child: Center(
                child: Row(
                  children: [
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 1, 0, 0),
                      child: Text(
                        'cr',
                        style: Theme.of(context).textTheme.headline1,
                      ),
                    ),
                    const SizedBox(width: 1),
                    Column(
                      children: [
                        const Spacer(),
                        SizedBox(height: 15),
                        Container(
                          height: rsc.rH(3.4),
                          width: rsc.rH(3.4),
                          child: RotationTransition(
                            turns: AlwaysStoppedAnimation(37 / 360),
                            child: SvgPicture.asset(Images.imageHobPower2),
                          ),
                        ),
                        const Spacer()
                      ],
                    ),
                    const SizedBox(width: 1),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 1, 0, 0),
                      child: Text(
                        'kett',
                        style: Theme.of(context).textTheme.headline1,
                      ),
                    ),
                    const Spacer()
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
