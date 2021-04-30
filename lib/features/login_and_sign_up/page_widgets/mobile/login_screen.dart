import 'package:crokett/core/global/asset_names.dart/images_and_sounds.dart';
import 'package:crokett/core/global/colors/custom_colours.dart';
import 'package:crokett/core/global/constants/constants.dart';
import 'package:crokett/core/global/helpers/device_type_helper.dart';
import 'package:crokett/core/global/helpers/responsive_screen_helper.dart';
import 'package:crokett/core/global/helpers/ui_helper.dart';
import 'package:crokett/features/login_and_sign_up/blocs/login_bloc/login_bloc.dart';
import 'package:crokett/features/login_and_sign_up/page_widgets/mobile/bottom_sheet_widget.dart';
import 'package:crokett/injection.dart';
import 'package:crokett/routes/crokett_configuration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:crokett/core/global/globals/globals.dart' as globals;

bool modalViewOpened = false;

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
      if (state is! GoogleSignInSelected || state is! SignUpSelected) {
        return GestureDetector(
          onTap: () {
            modalViewOpened
                ? Navigator.pop(context)
                : debugPrint('Modal not open');
            modalViewOpened = false;
          },
          child: Scaffold(
            backgroundColor: CustomColours.crokettYellow,
            body: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getDeviceType() == DeviceType.Phone
                      ? rsc.rW(10)
                      : rsc.rW(24)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: rsc.rH(16)),
                  Row(
                    children: [
                      const Spacer(),
                      Container(
                          height: rsc.rH(30),
                          width: rsc.rH(30),
                          color: Colors.white),
                      const Spacer(),
                    ],
                  ),
                  SizedBox(height: rsc.rH(7)),
                  Row(
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
                          SizedBox(height: 16),
                          Container(
                            height: 32,
                            width: 32,
                            child: RotationTransition(
                              turns: AlwaysStoppedAnimation(52 / 360),
                              child: SvgPicture.asset(Images.imageHobPower2),
                            ),
                          ),
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
                      const Spacer(),
                    ],
                  ),
                  SizedBox(height: rsc.rH(7)),
                  BlocProvider(
                    lazy: false,
                    create: (context) => getIt<LoginBloc>(),
                    child: LoginButton(context),
                  ),
                  SizedBox(height: UIHelper.paddingBetweenElements),
                  state is LoginStateInitial
                      ? ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            onPrimary: Colors.black,
                            primary: Colors.white,
                          ),
                          onPressed: () {
                            debugPrint('SignUp pressed');
                          },
                          child: Text(Constants.signUp),
                        )
                      : Container(),
                  SizedBox(height: UIHelper.paddingBetweenElements),
                  state is LoginStateInitial
                      ? Row(children: [
                          const Spacer(),
                          Container(
                            height: 3,
                            width: rsc.rW(12),
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(2)),
                            ),
                          ),
                          const Spacer()
                        ])
                      : Container(),
                  SizedBox(height: UIHelper.paddingBetweenElements),
                  state is LoginStateInitial
                      ? ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            onPrimary: Colors.black,
                            primary: Colors.white,
                          ),
                          onPressed: () {
                            debugPrint('Sign In with Google pressed');
                          },
                          child: Row(
                            children: [
                              const Spacer(),
                              Container(
                                  height: UIHelper.iconSize,
                                  width: UIHelper.iconSize,
                                  child: SvgPicture.asset(Images.googleG)),
                              SizedBox(width: UIHelper.buttonPadding),
                              Text(Constants.signInWithGoogle),
                              const Spacer(),
                            ],
                          ),
                        )
                      : Container(),
                ],
              ),
            ),
          ),
        );
      } else {
        return Container();
      }
    });
  }
}

class LoginButton extends StatelessWidget {
  final BuildContext mainUIContext;

  LoginButton(this.mainUIContext);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      if (state is LoginStateInitial) {
        return ElevatedButton(
          onPressed: () {
            context.read<LoginBloc>().add(LoginSelected());
            mainUIContext.read<LoginBloc>().add(LoginSelected());
            var sheetController = showBottomSheet(
                context: context, builder: (context) => LoginBottomSheetWidget());
            modalViewOpened = true;
            sheetController.closed.then((value) {
              context.read<LoginBloc>().add(RemoveBottomSheet());
              mainUIContext.read<LoginBloc>().add(RemoveBottomSheet());
            });
          },
          child: Text(Constants.logIn),
        );
      } else {
        return Container();
      }
    });
  }
}
