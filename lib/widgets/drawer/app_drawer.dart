import 'package:flutter/material.dart';
import 'package:themoviedb/Theme/colors.dart';

class DrawerWidget extends StatefulWidget {
  DrawerWidget({Key? key}) : super(key: key);

  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: const <Widget>[
          DrawerHeader(
              decoration: BoxDecoration(
                color: AppColors.mainDarkBlue,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: AppColors.backgroundColorApp,
                  fontSize: 25,
                ),
              )),
        ],
      ),
    );
  }
}
