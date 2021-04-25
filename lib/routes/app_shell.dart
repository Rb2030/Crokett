import 'package:crokett/core/global/asset_names.dart/images_and_sounds.dart';
import 'package:crokett/core/global/constants/constants.dart';
import 'package:crokett/core/global/helpers/responsive_screen_helper.dart';
import 'package:crokett/core/global/helpers/ui_helper.dart';
import 'package:crokett/features/boxes/page_structures/boxes_page.dart';
import 'package:crokett/features/cookshop/page_structures/cookshop_page.dart';
import 'package:crokett/features/help/page_structures/help_page.dart';
import 'package:crokett/features/home/page_structures/home_page.dart';
import 'package:crokett/features/profile/page_structures/profile_page.dart';
import 'package:crokett/features/recipes/page_structures/recipes_page.dart';
import 'package:crokett/features/settings/page_structures/settings_page.dart';
import 'package:crokett/features/tips_and_tricks/page_structures/tips_and_tricks_page.dart';
import 'package:crokett/routes/crokett_router_delegate.dart';
import 'package:crokett/routes/router_bloc/router_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import 'crokett_configuration.dart';

class AppShell extends StatefulWidget {
  final Navigator navigator;

  AppShell(this.navigator);

  @override
  _AppShellState createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  late ChildBackButtonDispatcher _backButtonDispatcher;
  Navigator? navigator;

  void initState() {
    super.initState();
    navigator = widget.navigator;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final ResponsiveScreenConfig rsc = ResponsiveScreenConfig(context);

    GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    CrokettRouterDelegate _routerDelegate = CrokettRouterDelegate();

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
      body: Router(
        routerDelegate: _routerDelegate,
      ),
      drawer: InkWell(
        onTap: () {
          toggleDrawer();
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
                        BlocProvider.of<RouterBloc>(context).add((RouterEventNewPage(pages: [ProfilePage()])));
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
                    BlocProvider.of<RouterBloc>(context).add((RouterEventNewPage(pages: [HomePage(HOME)])));
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
                    BlocProvider.of<RouterBloc>(context).add((RouterEventNewPage(pages: [BoxesPage()])));
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
                    BlocProvider.of<RouterBloc>(context).add((RouterEventNewPage(pages: [RecipesPage()])));
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
                    BlocProvider.of<RouterBloc>(context).add((RouterEventNewPage(pages: [CookshopPage()])));
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
                    BlocProvider.of<RouterBloc>(context).add((RouterEventNewPage(pages: [TipsAndTricksPage()])));
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
                    BlocProvider.of<RouterBloc>(context).add((RouterEventNewPage(pages: [HelpPage()])));
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
                    BlocProvider.of<RouterBloc>(context).add((RouterEventNewPage(pages: [SettingsPage()])));
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
