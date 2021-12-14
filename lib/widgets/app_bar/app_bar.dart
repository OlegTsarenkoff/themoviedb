import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:themoviedb/resources/resources.dart';

class AppBarWidget extends StatefulWidget {
  AppBarWidget(
    this.scaffoldKey, {
    Key? key,
  }) : super(key: key);
  GlobalKey<ScaffoldState> scaffoldKey;

  @override
  _AppBarWidgetState createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      leading: _buildMenuActionButton(_onTapMenu, Icons.menu),
      centerTitle: true,
      title: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: SvgPicture.asset(
          Svgs.themoviedb,
          height: 40,
          width: 55,
        ),
      ),
      actions: [
        _buildMenuActionButton(_onTapProfile, Icons.person),
        _buildMenuActionButton(_onTapSearch, Icons.search, color: Colors.blue),
        const SizedBox(
          width: 5,
        )
      ],
    );
  }

  // Functions
  _buildMenuActionButton(Function() onPressed, IconData icon, {Color? color}) =>
      IconButton(
        onPressed: onPressed,
        icon: Icon(icon),
        color: color ?? Colors.white,
        splashRadius: 20,
      );

  _onTapProfile() {
    print('profile');
  }

  _onTapSearch() {
    print('search');
  }

  _onTapMenu() {
    widget.scaffoldKey.currentState?.openDrawer();
  }
}
