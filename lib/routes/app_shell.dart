import 'package:crokett/core/global/widgets/crokett_app_bar.dart';
import 'package:crokett/routes/app_state.dart';
import 'package:crokett/routes/inner_router_delegate.dart';
import 'package:flutter/material.dart';

class AppShell extends StatefulWidget {
  AppState appState;
  bool mainMenuSelected;
  bool showBackButton;
  String title;

  AppShell(
      {required this.appState,
      required this.mainMenuSelected,
      required this.showBackButton,
      required this.title
  });

  @override
  _AppShellState createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  late InnerRouterDelegate _routerDelegate;
  late ChildBackButtonDispatcher _backButtonDispatcher;

  void initState() {
    super.initState();
    _routerDelegate = InnerRouterDelegate(widget.appState);
  }

  @override
  void didUpdateWidget(covariant AppShell oldWidget) {
    super.didUpdateWidget(oldWidget);
    _routerDelegate.appState = widget.appState;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Defer back button dispatching to the child router
    _backButtonDispatcher = Router.of(context)
        .backButtonDispatcher!
        .createChildBackButtonDispatcher();
  }

  @override
  Widget build(BuildContext context) {
    var appState = widget.appState;
    var mainMenuSelected = widget.mainMenuSelected;
    var showBackButton = widget.showBackButton;
    var title = widget.title;

    // Claim priority, If there are parallel sub router, you will need
    // to pick which one should take priority;
    _backButtonDispatcher.takePriority();

    return Scaffold(
      appBar: CrokettAppBar(
          appState: appState,
          mainMenuSelected: mainMenuSelected,
          showBackButton: showBackButton,
          title: title),
      body: Router(
        routerDelegate: _routerDelegate,
        backButtonDispatcher: _backButtonDispatcher,
      ),
    );
  }
}
