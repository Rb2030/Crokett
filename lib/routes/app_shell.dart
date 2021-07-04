import 'package:crokett/core/global/asset_names.dart/images_and_sounds.dart';
import 'package:crokett/core/global/constants/constants.dart';
import 'package:crokett/core/global/helpers/responsive_screen_helper.dart';
import 'package:crokett/core/global/helpers/ui_helper.dart';
import 'package:crokett/features/splash_screen/page_structures/splash_page.dart';
import 'package:crokett/routes/crokett_router_delegate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'crokett_configuration.dart';

class AppShell extends StatefulWidget {
  final StatefulWidget? currentPage;
  final Function(String) nextScreen;

  AppShell(this.currentPage, this.nextScreen);

  @override
  _AppShellState createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  StatefulWidget? currentPage;
  Function(String)? nextScreen;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void initState() {
    super.initState();
    currentPage = widget.currentPage;
    nextScreen = widget.nextScreen;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final ResponsiveScreenConfig rsc = ResponsiveScreenConfig(context);
    // CrokettRouterDelegate _routerDelegate = CrokettRouterDelegate();

    toggleDrawer() async {
      if (_scaffoldKey.currentState!.isDrawerOpen) {
        _scaffoldKey.currentState!.openEndDrawer();
      } else {
        _scaffoldKey.currentState!.openDrawer();
      }
    }

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        elevation: 0,
      ),
     body: Center(child: currentPage),
      drawer: InkWell(
        onTap: () {
          toggleDrawer();
        },
        child: Container(
          width: rsc.rW(70),
          color: Colors.white,
          child: Drawer(
            elevation: 0,
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                Container(
                  height: rsc.rHP(16),
                  child: DrawerHeader(
                    padding: EdgeInsets.zero,
                    child: ListTile(
                      leading: Padding(
                        padding: const EdgeInsets.fromLTRB(
                            UIHelper.paddingBetweenElements / 4, 0, 0, 0),
                        child: Container(
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                shape: BoxShape.circle),
                            child: Padding(
                              padding: EdgeInsets.all(
                                  UIHelper.paddingBetweenElements / 1.5),
                              child: Text('JS', textAlign: TextAlign.center),
                            )),
                      ),
                      title: Text('Joe'),
                      onTap: () {
                        nextScreen!(PROFILE);
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
                    nextScreen!(HOME);
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
                    nextScreen!(BOXES);
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
                    nextScreen!(RECIPES);
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
                    nextScreen!(COOKSHOP);
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
                    nextScreen!(TIPS_AND_TRICKS);
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
                    nextScreen!(HELP);
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
                    nextScreen!(SETTINGS);
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
