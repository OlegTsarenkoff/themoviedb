import 'package:flutter/material.dart';
import 'package:themoviedb/screens/main_screen/movie_details/movie_actors.dart';
import 'package:themoviedb/screens/main_screen/movie_details/movie_detail_info.dart';
import 'package:themoviedb/theme/colors.dart';
import 'package:themoviedb/widgets/app_bar/app_bar.dart';
import 'package:themoviedb/widgets/drawer/app_drawer.dart';

class MovieDetails extends StatefulWidget {
  final int movieId;
  const MovieDetails({
    Key? key,
    required this.movieId,
  }) : super(key: key);

  @override
  _MovieDetailsState createState() => _MovieDetailsState();
}

final GlobalKey<ScaffoldState> _key = GlobalKey();

class _MovieDetailsState extends State<MovieDetails> {
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
              child: Container(
                width: double.infinity,
                height: 800,
                child: ColoredBox(
                  color: AppColors.infoMovieBoxBackgrnd,
                  child: ListView(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    children: const [
                      MovieDetailInfoWidget(),
                      MovieDetailActorsWidget(),
                      SizedBox(
                        height: 50,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
