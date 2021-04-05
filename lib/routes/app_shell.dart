import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:crokett/core/global/colors/custom_colours.dart';
import 'package:crokett/core/global/constants/constants.dart';
import 'package:crokett/core/global/helpers/button_delay_helper.dart';
import 'package:crokett/core/global/helpers/responsive_screen_helper.dart';
import 'package:crokett/core/global/helpers/ui_helper.dart';
import 'package:crokett/features/cookshop/page_structures/cookshop_page.dart';
import 'package:crokett/routes/app_state.dart';
import 'package:crokett/routes/inner_router_delegate.dart';
import 'package:crokett/routes/route_path.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppShell extends StatefulWidget {
  AppState appState;

  AppShell({required this.appState});

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
    final ResponsiveScreenConfig rsc = ResponsiveScreenConfig(context);
    var appState = widget.appState;

    // Claim priority, If there are parallel sub router, you will need
    // to pick which one should take priority;
    _backButtonDispatcher.takePriority();

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: Router(
        routerDelegate: _routerDelegate,
        backButtonDispatcher: _backButtonDispatcher,
      ),
      drawer: InkWell(
        onTap: () {
          appState.ifMenuSelected = true;
        },
        child: Container(
          width: rsc.rW(60),
          child: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                Container(
                  height: rsc.rHP(16),
                  child: DrawerHeader(
                    padding: EdgeInsets.zero,
                    child: ListTile(
                      leading: Container(
                          decoration: BoxDecoration(
                              color: Colors.grey[200], shape: BoxShape.circle),
                          child: Padding(
                            padding: EdgeInsets.all(
                                UIHelper.paddingBetweenElements / 1.5),
                            child: Text('JS', textAlign: TextAlign.center),
                          )),
                      title: Text('Joe'),
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text(Constants.boxes),
                  onTap: () {
                    appState.selectedMenuItem = MenuItem(Boxes);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text(Constants.recipes),
                  onTap: () {
                    appState.selectedMenuItem = MenuItem(Recipes);
                  },                ),
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text(Constants.cookshop),
                  onTap: () {
                    appState.selectedMenuItem = MenuItem(Cookshop);
                  },                ),
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text(Constants.tipsAndTricks),
                  onTap: () {
                    appState.selectedMenuItem = MenuItem(TipsAndTricks);
                  },                ),
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text(Constants.help),
                  onTap: () {
                    appState.selectedMenuItem = MenuItem(Help);
                  },                ),
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text(Constants.settings),
                  onTap: () {
                    appState.selectedMenuItem = MenuItem(Settings);
                  },                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
