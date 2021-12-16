import 'package:flutter/material.dart';
import 'package:themoviedb/screens/main_screen/movie_list/main_movie.dart';
import 'package:themoviedb/widgets/app_bar/app_bar.dart';
import 'package:themoviedb/widgets/drawer/app_drawer.dart';
import 'package:themoviedb/widgets/info_box/info_block.dart';

class MainScreenWidget extends StatefulWidget {
  const MainScreenWidget({Key? key}) : super(key: key);

  @override
  _MainScreenWidgetState createState() => _MainScreenWidgetState();
}

final GlobalKey<ScaffoldState> _key = GlobalKey();

class _MainScreenWidgetState extends State<MainScreenWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerWidget(),
      key: _key,
      body: CustomScrollView(
        slivers: [
          AppBarWidget(_key),
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              child: Column(
                children: const [
                  MainMovieList(),
                  InfoBlockBottom(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
