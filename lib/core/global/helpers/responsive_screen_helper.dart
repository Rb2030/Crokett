import 'package:flutter/material.dart';

class ResponsiveScreenConfig {
  final BuildContext _context;
  double _height;
  double _width;
  double _heightPadding;
  double _widthPadding;

  ResponsiveScreenConfig(this._context) {
    final MediaQueryData _queryData = MediaQuery.of(_context);
    _height = _queryData.size.height / 100.0;
    _width = _queryData.size.width / 100.0;
    _heightPadding =
    _height - ((_queryData.padding.top + _queryData.padding.bottom) / 100.0);
    _widthPadding =
      _width - (_queryData.padding.left + _queryData.padding.right) / 100.0;
  }

  double rH(double v) { // Height of screen
   return _height * v;
  }

  double rW(double v) { // Width of screen
    return _width * v;
  }

  double rHP(double v) { // Height of screen minus padding
    return _heightPadding * v;
  }

 double rWP(double v) { // Width of screen minus padding
   return _widthPadding * v;
 }
}