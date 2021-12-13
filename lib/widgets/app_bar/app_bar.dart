import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppBarWidget extends StatefulWidget {
  const AppBarWidget({Key? key}) : super(key: key);

  @override
  _AppBarWidgetState createState() => _AppBarWidgetState();
}

const String movieDBImage = 'assets/images/themoviedb.svg';

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
          movieDBImage,
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
}

// Functions
_buildMenuActionButton(Function() onPressed, IconData icon, {Color? color}) =>
    IconButton(
      onPressed: onPressed,
      icon: Icon(icon),
      color: color ?? Colors.white,
      splashRadius: 20,
    );

////////////////////////////////////////////////////////////////////////////////
_onTapProfile() {
  print('profile');
}

_onTapSearch() {
  print('search');
}

_onTapMenu() {
  print('menu');
}
////////////////////////////////////////////////////////////////////////////////
