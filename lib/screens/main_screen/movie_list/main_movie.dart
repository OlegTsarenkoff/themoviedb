import 'package:flutter/material.dart';
import 'package:themoviedb/screens/main_screen/movie_list/movie_list_wrapper.dart';
import 'package:themoviedb/theme/colors.dart';
import 'package:themoviedb/widgets/info_box/info_block.dart';

class MainMovieList extends StatelessWidget {
  const MainMovieList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        color: AppColors.backgroundColorApp,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Popular Movies',
              style: TextStyle(fontSize: 25.6, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: AppColors.borderColor,
                      blurRadius: 8,
                      offset: Offset(0, 2))
                ],
              ),
              // child: const TextField(
              //   decoration: InputDecoration(
              //     filled: true,
              //     fillColor: AppColors.backgroundColorApp,
              //     labelText: "Search",
              //     border: OutlineInputBorder(),
              //   ),
              // ),
            ),
            MovieListWidget(),
          ],
        ),
      ),
    );
  }
}
