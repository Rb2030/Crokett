import 'dart:async';
import 'package:crokett/routes/router_delegate.dart';
import 'package:injectable/injectable.dart';
import 'package:uni_links/uni_links.dart';

@injectableInit
// Platform messages are asynchronous, so we initialize in an async method.
Future<CrokettRouterDelegate> linkStreamState(CrokettRouterDelegate delegate) async {
  // Attach a listener to the Uri links stream
  getUriLinksStream().listen((Uri uri) {
    delegate.parseRoute(uri);
  }, onError: (Object err) {
    print('Got error $err');
  });
  return delegate;
}

