import 'package:flutter/material.dart';
import 'router_delegate.dart';

class CrokettBackButtonDispatcher extends RootBackButtonDispatcher {
  final CrokettRouterDelegate _routerDelegate;

  CrokettBackButtonDispatcher(this._routerDelegate)
      : super();

  @override
  Future<bool> didPopRoute() {
    return _routerDelegate.popRoute();
  }
}
