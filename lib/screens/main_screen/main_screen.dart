import 'package:flutter/material.dart';
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
      key: _key,
      drawer: DrawerWidget(),
      body: CustomScrollView(
        slivers: [
          AppBarWidget(_key),
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 500,
                    color: Colors.white,
                    child: const Center(
                      child: Text('Home view'),
                    ),
                  ),
                  const InfoBlockBottom(),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'News',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.movie),
            label: 'Movie',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.tv),
            label: 'TV Shows',
          ),
        ],
      ),
    );
  }
}
