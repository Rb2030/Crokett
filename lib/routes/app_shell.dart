import 'package:crokett/core/global/asset_names.dart/images_and_sounds.dart';
import 'package:crokett/core/global/constants/constants.dart';
import 'package:crokett/core/global/helpers/responsive_screen_helper.dart';
import 'package:crokett/core/global/helpers/ui_helper.dart';
import 'package:crokett/features/boxes/page_widgets/mobile/boxes_screen.dart';
import 'package:crokett/features/cookshop/page_widgets/mobile/cookshop_screen.dart';
import 'package:crokett/features/home/page_widgets/mobile/home_screen.dart';
import 'package:crokett/features/recipes/page_widgets/mobile/recipes_screen.dart';
import 'package:crokett/features/tips_and_tricks/page_widgets/mobile/tips_and_tricks_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'crokett_configuration.dart';

class AppShell extends Page {
//  final StatefulWidget? currentPage;
  final Function(String) nextScreen;

  AppShell({/*this.currentPage,*/ required this.nextScreen})
      : super(key: ValueKey(APPSHELL));

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (BuildContext context) {
        return AppShellWidget(
            /*currentPage: currentPage,*/
            nextScreen: nextScreen); //AppShell(nextScreen);
      },
    );
  }
}

class AppShellWidget extends StatefulWidget {
  //final StatefulWidget? currentPage;
  final Function(String) nextScreen;

  AppShellWidget({/*this.currentPage,*/ required this.nextScreen});

  @override
  _AppShellState createState() => _AppShellState();
}

class _AppShellState extends State<AppShellWidget> {
  StatefulWidget? currentPage;
  late Function(String) nextScreen;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void initState() {
    super.initState();
    nextScreen = widget.nextScreen;
    currentPage = HomeScreen(nextScreen: nextScreen);
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
      setState(() {
        if (_scaffoldKey.currentState!.isDrawerOpen) {
          _scaffoldKey.currentState!.openEndDrawer();
        } else {
          _scaffoldKey.currentState!.openDrawer();
        }
      });
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
                        nextScreen(PROFILE);
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
                    currentPage = HomeScreen(nextScreen: nextScreen);
                    toggleDrawer();
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
                    currentPage = BoxesScreen(nextScreen: nextScreen);
                    toggleDrawer();
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
                    currentPage = RecipesScreen(nextScreen: nextScreen);
                    toggleDrawer();
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
                    currentPage = CookShopScreen(nextScreen: nextScreen);
                    toggleDrawer();
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
                    currentPage = TipsAndTricksScreen(nextScreen: nextScreen);
                    toggleDrawer();
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
                    nextScreen(HELP);
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
                    nextScreen(SETTINGS);
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
