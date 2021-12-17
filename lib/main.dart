import 'package:flutter/material.dart';
import 'package:themoviedb/Theme/colors.dart';
import 'package:themoviedb/screens/auth_screen/auth_screen.dart';
import 'package:themoviedb/screens/main_screen/main_screen.dart';
import 'package:themoviedb/screens/main_screen/movie_details/movie_details.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.mainDarkBlue,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.mainDarkBlue,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: AppColors.mainDarkBlue,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
        ),
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/auth': (context) => const AuthWidget(),
        '/main_screen': (context) => const MainScreenWidget(),
        '/main_screen/movie_details': (context) {
          final id = ModalRoute.of(context)?.settings.arguments as int;
          return MovieDetails(
            movieId: id,
          );
        },
      },
      initialRoute: '/auth',
    );
  }
}
