import 'package:crokett/core/global/asset_names.dart/images_and_sounds.dart';
import 'package:crokett/core/global/helpers/responsive_screen_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppBarTitle extends StatelessWidget {
  const AppBarTitle() : super();
  @override
  Widget build(BuildContext context) {
    final ResponsiveScreenConfig rsc = ResponsiveScreenConfig(context);

    return Row(
      children: [
      SizedBox(width: rsc.rW(11.5)),
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
    );
  }
}
