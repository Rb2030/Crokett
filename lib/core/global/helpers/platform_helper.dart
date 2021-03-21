import 'package:flutter/material.dart';

class PlatformHelper {

  static TargetPlatform platformType(BuildContext context) {
    return Theme.of(context).platform;
  }
}
