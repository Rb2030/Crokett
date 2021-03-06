import 'package:crokett/core/global/asset_names.dart/images_and_sounds.dart';
import 'package:crokett/core/global/colors/custom_colours.dart';
import 'package:crokett/core/global/constants/constants.dart';
import 'package:crokett/core/global/helpers/device_type_helper.dart';
import 'package:crokett/core/global/helpers/responsive_screen_helper.dart';
import 'package:crokett/core/global/helpers/ui_helper.dart';
import 'package:crokett/core/global/widgets/crokett_snackbar.dart';
import 'package:crokett/features/login_and_sign_up/blocs/login_bloc/login_bloc.dart';
import 'package:crokett/features/login_and_sign_up/page_widgets/mobile/login_bottom_sheet_widget.dart';
import 'package:crokett/injection.dart';
import 'package:crokett/routes/crokett_configuration.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:crokett/core/global/globals/globals.dart' as globals;

bool modalViewOpened = false;

class LoginScreen extends StatefulWidget {
  final Function(String) nextScreen;

  LoginScreen({required this.nextScreen}) : super();

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with TickerProviderStateMixin {
  late Function(String) nextScreen;
  late AnimationController imageSizeAnimController;

  @override
  void initState() {
    super.initState();
    nextScreen = widget.nextScreen;
    imageSizeAnimController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ResponsiveScreenConfig rsc = ResponsiveScreenConfig(context);
    double responsiveSpacerSize = rsc.rH(6);
    double responsiveBoxSize = rsc.rH(36);
    return BlocConsumer<LoginBloc, LoginState>(listener: (context, state) {
      if (state is LoginQueryReturn) {
        state.authFailureOrSuccessOption.fold(
          () {},
          (either) {
            either.fold(
              (failure) {
                return ScaffoldMessenger.of(context)
                    .showSnackBar(CrokettSnackbar(
                        text: failure.errorMessage,
                        buttonLabel: Constants.forgotPassword,
                        onPressed: () {
                          nextScreen(FORGOT_PASSWORD);
                        })); //AlertDialog(title: Text(failure.errorMessage));
              },
              (success) {
                nextScreen(APPSHELL);
              },
            );
          },
        );
      }
    }, builder: (context, state) {
      if (state is! SignUpSelected) {
        if (state is! LoginStateInitial &&
            state is! SelectedGoogleSignInState) {
          responsiveSpacerSize = 0;
          responsiveBoxSize = 0;
          imageSizeAnimController.forward().then((value) {
            setState(() {});
          });
        }
        return GestureDetector(
          onTap: () {
            if (modalViewOpened) {
              context.read<LoginBloc>().add(RemoveBottomSheet());
              Navigator.pop(context);
              responsiveSpacerSize = rsc.rH(6);
              responsiveBoxSize = rsc.rH(36);
              imageSizeAnimController.forward().then((value) {
                setState(() {});
              });
            }
            modalViewOpened = false;
          },
          child: Scaffold(
            backgroundColor: CustomColours.crokettYellow,
            body: SingleChildScrollView(
              child: Container(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                      getDeviceType() == DeviceType.Phone
                          ? rsc.rW(10)
                          : rsc.rW(24), // Left
                      rsc.rH(4), // Top
                      getDeviceType() == DeviceType.Phone
                          ? rsc.rW(10)
                          : rsc.rW(24), // Right
                      rsc.rH(10)), // Bottom
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      AnimatedContainer(
                        height: responsiveSpacerSize,
                        duration: const Duration(milliseconds: 1),
                      ),
                      Row(
                        children: [
                          const Spacer(),
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 1),
                            height: responsiveBoxSize,
                            width: rsc.rH(30),
                            child: Container(color: Colors.white),
                          ),
                          const Spacer(),
                        ],
                      ),
                      AnimatedContainer(
                        height: responsiveSpacerSize,
                        duration: const Duration(milliseconds: 1),
                      ),
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
                                  child:
                                      SvgPicture.asset(Images.imageHobPower2),
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
                        child: LoginButton(context, nextScreen),
                      ),
                      SizedBox(height: UIHelper.paddingBetweenElements),
                      state is LoginStateInitial ||
                              state is SelectedGoogleSignInState
                          ? ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                onPrimary: Colors.black,
                                primary: Colors.white,
                              ),
                              onPressed: () {
                                nextScreen(SIGN_UP);
                              },
                              child: Text(Constants.signUp),
                            )
                          : Container(),
                      SizedBox(height: UIHelper.paddingBetweenElements),
                      state is LoginStateInitial ||
                              state is SelectedGoogleSignInState
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
                      state is LoginStateInitial ||
                              state is SelectedGoogleSignInState
                          ? ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                onPrimary: Colors.black,
                                primary: Colors.white,
                              ),
                              onPressed: () {
                                context
                                    .read<LoginBloc>()
                                    .add(GoogleSignInSelected());
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
                      state is CheckingCredentials
                          ? Container(
                              height: rsc.rHP(100),
                              width: rsc.rW(100),
                              color: Colors.white.withOpacity(0.1))
                          : Container(),
                    ],
                  ),
                ),
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
  final Function(String) nextScreen;

  LoginButton(this.mainUIContext, this.nextScreen);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      if (state is LoginStateInitial) {
        return ElevatedButton(
          onPressed: () {
            context.read<LoginBloc>().add(LoginSelected());
            mainUIContext.read<LoginBloc>().add(LoginSelected());
            var sheetController = showBottomSheet(
                context: context,
                builder: (context) => Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight:
                            Radius.circular(UIHelper.paddingBetweenElements),
                        topLeft:
                            Radius.circular(UIHelper.paddingBetweenElements),
                      ),
                    ),
                    child: LoginBottomSheetWidget(nextScreen: nextScreen)));
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
