import 'package:flutter/material.dart';
import 'package:themoviedb/resources/resources.dart';
import 'package:themoviedb/theme/colors.dart';

class Movie {
  final int id;
  final String imageName;
  final String title;
  final String time;
  final String description;

  Movie({
    required this.id,
    required this.imageName,
    required this.title,
    required this.time,
    required this.description,
  });
}

class MovieListWidget extends StatefulWidget {
  const MovieListWidget({Key? key}) : super(key: key);

  @override
  State<MovieListWidget> createState() => _MovieListWidgetState();
}

class _MovieListWidgetState extends State<MovieListWidget> {
  final _movies = [
    Movie(
      id: 1,
      imageName: Images.venom,
      title: 'Venom: Let There Be Carnage',
      time: '30 September 2021',
      description:
          'After finding a host body in investigative reporter Eddie Brock, the alien symbiote must face a new enemy, Carnage, the alter ego of serial killer Cletus Kasady.',
    ),
    Movie(
      id: 2,
      imageName: Images.rednovice,
      title: 'Red Notice',
      time: '4 November 2021',
      description:
          "An Interpol-issued Red Notice is a global alert to hunt and capture the world's most wanted. But when a daring heist brings together the FBI's top profiler and two rival criminals, there's no telling what will happen.",
    ),
    Movie(
      id: 3,
      imageName: Images.spiderman,
      title: 'Spider-Man: No Way Home',
      time: '15 December 2021',
      description:
          'Peter Parker is unmasked and no longer able to separate his normal life from the high-stakes of being a super-hero. When he asks for help from Doctor Strange the stakes become even more dangerous, forcing him to discover what it truly means to be Spider-Man.',
    ),
    Movie(
      id: 4,
      imageName: Images.encanto,
      title: 'Encanto',
      time: '24 November 2021',
      description:
          'King Charles VI declares that Knight Jean de Carrouges settle his dispute with his squire, Jacques Le Gris, by challenging him to a duel.',
    ),
  ];

  var _filteredMovies = <Movie>[];

  final _searchController = TextEditingController();

  void _searchMovies() {
    final query = _searchController.text;
    if (query.isNotEmpty) {
      _filteredMovies = _movies.where((Movie movie) {
        return movie.title.toLowerCase().contains(query.toLowerCase());
      }).toList();
    } else {
      _filteredMovies = _movies;
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _filteredMovies = _movies;
    _searchController.addListener(_searchMovies);
  }

  void _onMovieTap(int index) {
    final id = _movies[index].id;
    Navigator.of(context).pushNamed(
      '/main_screen/movie_details',
      arguments: id,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      ListView.builder(
        padding: const EdgeInsets.only(top: 80),
        //physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: _filteredMovies.length,
        itemExtent: 163,
        itemBuilder: (BuildContext context, int index) {
          final movie = _filteredMovies[index];
          return Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.backgroundColorApp,
                      border: Border.all(color: AppColors.borderColor),
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      boxShadow: const [
                        BoxShadow(
                            color: AppColors.borderColor,
                            blurRadius: 8,
                            offset: Offset(0, 2))
                      ],
                    ),
                    clipBehavior: Clip.hardEdge,
                    child: Row(
                      children: [
                        Image(
                          image: AssetImage(movie.imageName),
                        ),
                        const SizedBox(width: 15),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 16),
                              Text(
                                movie.title,
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 5),
                              Text(
                                movie.time,
                                style:
                                    const TextStyle(color: AppColors.greyColor),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 16),
                              Text(
                                movie.description,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 5),
                      ],
                    ),
                  ),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      onTap: () => _onMovieTap(index),
                    ),
                  ),
                ],
              ));
        },
      ),
      TextField(
        controller: _searchController,
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.backgroundColorApp.withAlpha(235),
          labelText: "Search",
          border: const OutlineInputBorder(),
        ),
      ),
    ]);
  }
}
