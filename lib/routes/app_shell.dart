import 'package:crokett/core/global/asset_names.dart/images_and_sounds.dart';
import 'package:crokett/core/global/constants/constants.dart';
import 'package:crokett/core/global/helpers/responsive_screen_helper.dart';
import 'package:crokett/core/global/helpers/ui_helper.dart';
import 'package:crokett/routes/app_state.dart';
import 'package:crokett/routes/inner_router_delegate.dart';
import 'package:crokett/routes/route_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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

    GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    toggleDrawer() async {
      if (_scaffoldKey.currentState!.isDrawerOpen) {
        _scaffoldKey.currentState!.openEndDrawer();
      } else {
        _scaffoldKey.currentState!.openDrawer();
      }
    }

    // Claim priority, If there are parallel sub router, you will need
    // to pick which one should take priority;
    _backButtonDispatcher.takePriority();

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        elevation: 0,
      ),
      body: Router(
        routerDelegate: _routerDelegate,
        backButtonDispatcher: _backButtonDispatcher,
      ),
      drawer: InkWell(
        onTap: () {
          toggleDrawer();
          appState.ifMenuSelected = true;
        },
        child: Container(
          width: rsc.rW(70),
          child: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                Container(
                  height: rsc.rHP(16),
                  child: DrawerHeader(
                    padding: EdgeInsets.zero,
                    child: ListTile(
                      leading: Padding(
                        padding: const EdgeInsets.fromLTRB(UIHelper.paddingBetweenElements / 4, 0, 0, 0),
                        child: Container(
                            decoration: BoxDecoration(
                                color: Colors.grey[200], shape: BoxShape.circle),
                            child: Padding(
                              padding: EdgeInsets.all(
                                  UIHelper.paddingBetweenElements / 1.5),
                              child: Text('JS', textAlign: TextAlign.center),
                            )),
                      ),
                      title: Text('Joe'),
                      onTap: () {
                        appState.ifMenuSelected = true;
                        appState.selectedMenuItem = MenuItem(Profile);
                      },
                    ),
                  ),
                ),
                const SizedBox(height: UIHelper.paddingBetweenElements / 2),
                ListTile(
                  leading: Padding(
                    padding: const EdgeInsets.all(
                        UIHelper.paddingBetweenElements / 3),
                    child: SvgPicture.asset(Images.imageHome),
                  ),
                  title: Text(Constants.home),
                  onTap: () {
                    appState.ifMenuSelected = true;
                    appState.selectedMenuItem = MenuItem(Home);
                  },
                ),
                const SizedBox(height: UIHelper.paddingBetweenElements / 2),
                ListTile(
                  leading: Padding(
                    padding: const EdgeInsets.all(
                        UIHelper.paddingBetweenElements / 3),
                    child: SvgPicture.asset(Images.imageBoxes),
                  ),
                  title: Text(Constants.boxes),
                  onTap: () {
                    appState.ifMenuSelected = true;
                    appState.selectedMenuItem = MenuItem(Boxes);
                  },
                ),
                const SizedBox(height: UIHelper.paddingBetweenElements / 2),
                ListTile(
                  leading: Padding(
                    padding: const EdgeInsets.all(
                        UIHelper.paddingBetweenElements / 3),
                    child: SvgPicture.asset(Images.imageRecipes),
                  ),
                  title: Text(Constants.recipes),
                  onTap: () {
                    appState.ifMenuSelected = true;
                    appState.selectedMenuItem = MenuItem(Recipes);
                  },
                ),
                const SizedBox(height: UIHelper.paddingBetweenElements / 2),
                ListTile(
                  leading: Padding(
                    padding: const EdgeInsets.all(
                        UIHelper.paddingBetweenElements / 3),
                    child: SvgPicture.asset(Images.imageCookshop),
                  ),
                  title: Text(Constants.cookshop),
                  onTap: () {
                    appState.ifMenuSelected = true;
                    appState.selectedMenuItem = MenuItem(Cookshop);
                  },
                ),
                const SizedBox(height: UIHelper.paddingBetweenElements / 2),
                ListTile(
                  leading: Padding(
                    padding: const EdgeInsets.all(
                        UIHelper.paddingBetweenElements / 3),
                    child: SvgPicture.asset(Images.imageTipsAndTricks),
                  ),
                  title: Text(Constants.tipsAndTricks),
                  onTap: () {
                    appState.ifMenuSelected = true;
                    appState.selectedMenuItem = MenuItem(TipsAndTricks);
                  },
                ),
                const SizedBox(height: UIHelper.paddingBetweenElements / 2),
                ListTile(
                  leading: Padding(
                    padding: const EdgeInsets.all(
                        UIHelper.paddingBetweenElements / 3),
                    child: SvgPicture.asset(Images.imageHelp),
                  ),
                  title: Text(Constants.help),
                  onTap: () {
                    appState.ifMenuSelected = true;
                    appState.selectedMenuItem = MenuItem(Help);
                  },
                ),
                const SizedBox(height: UIHelper.paddingBetweenElements / 2),
                ListTile(
                  leading: Padding(
                    padding: const EdgeInsets.all(
                        UIHelper.paddingBetweenElements / 3),
                    child: SvgPicture.asset(Images.imageSettings),
                  ),
                  title: Text(Constants.settings),
                  onTap: () {
                    appState.ifMenuSelected = true;
                    appState.selectedMenuItem = MenuItem(Settings);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
