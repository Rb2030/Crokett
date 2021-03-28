import 'package:crokett/core/global/helpers/button_delay_helper.dart';
import 'package:crokett/core/global/helpers/ui_helper.dart';
import 'package:crokett/routes/app_state.dart';
import 'package:flutter/material.dart';
import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:io' show Platform;

class CrokettAppBar extends StatelessWidget with PreferredSizeWidget {
  final bool showBackButton;
  final String title;
  final AppState appState;
  bool mainMenuSelected;

  @override
  final Size preferredSize;

  CrokettAppBar(
      {Key? key,
      required this.showBackButton,
      required this.title,
      required this.appState,
      required this.mainMenuSelected})
      : preferredSize = Size.fromHeight(UIHelper.appBarHeight),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    mainMenuSelected = appState.ifMenuSelected;

    return Container(
      height: 400,
      color: Colors.transparent,
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, UIHelper.paddingBetweenElements, 0,
            UIHelper.paddingBetweenElements),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Visibility(
              maintainSize: false,
              visible: showBackButton,
              child: Padding(
                padding:
                    const EdgeInsets.fromLTRB(UIHelper.buttonPadding, 0, 0, 0),
                child: BouncingWidget(
                    duration: animationLength,
                    scaleFactor: bouncingSize,
                    child: Icon(Icons.chevron_left_rounded,
                        color: Colors.black, size: UIHelper.iconSize * 1.5),
                    onPressed: () {
                      buttonDelay().then((value) {
                        Navigator.pop(context);
                      });
                    }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(
                  UIHelper.paddingBetweenElements,
                  UIHelper.paddingBetweenElements * 4,
                  0,
                  UIHelper.paddingBetweenElements),
              child: BouncingWidget(
                  duration: animationLength,
                  scaleFactor: bouncingSize,
                  child: FaIcon(FontAwesomeIcons.hamburger,
                      size: UIHelper.iconSize * 1.5),
                  onPressed: () {
                    appState.ifMenuSelected = true;
                  }),
            ),
            const Spacer(),
            Container(
                child: Text(title, style: TextStyle(color: Colors.white))),
            const Spacer(),
            SizedBox(width: UIHelper.paddingBetweenElements),
          ],
        ),
      ),
    );
  }
}
