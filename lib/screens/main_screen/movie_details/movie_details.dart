import 'package:flutter/material.dart';

class MovieDetails extends StatefulWidget {
  final int movieId;
  const MovieDetails({
    Key? key,
    required this.movieId,
  }) : super(key: key);

  @override
  _MovieDetailsState createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
