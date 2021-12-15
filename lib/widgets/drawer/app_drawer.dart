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
      child: Container(
        color: AppColors.mainDarkBlue,
        child: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: ListView(
            padding: EdgeInsets.zero,
            children: const <Widget>[
              ListTile(
                title: Text(
                  'Movies',
                  style: TextStyle(
                    color: AppColors.backgroundColorApp,
                    fontSize: 20.8,
                  ),
                ),
              ),
              ListTile(
                title: Text(
                  'TV Shows',
                  style: TextStyle(
                    color: AppColors.backgroundColorApp,
                    fontSize: 20.8,
                  ),
                ),
              ),
              ListTile(
                title: Text(
                  'People',
                  style: TextStyle(
                    color: AppColors.backgroundColorApp,
                    fontSize: 20.8,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
