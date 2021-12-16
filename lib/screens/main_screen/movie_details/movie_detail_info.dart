import 'package:flutter/material.dart';
import 'package:themoviedb/resources/resources.dart';
import 'package:themoviedb/theme/colors.dart';
import 'package:themoviedb/widgets/progress_bar/progress_bar_widget.dart';

class MovieDetailInfoWidget extends StatelessWidget {
  const MovieDetailInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        _TopPosterWidget(),
        _RatingMovieWidget(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: _MovieNameWidget(),
        ),
        _SummerWidget(),
      ],
    );
  }
}

class _TopPosterWidget extends StatelessWidget {
  const _TopPosterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: const [
        Image(image: AssetImage(Images.placeholder)),
        Positioned(
            top: 16,
            left: 16,
            bottom: 16,
            child: Image(
              image: AssetImage(Images.venom),
            )),
      ],
    );
  }
}

class _RatingMovieWidget extends StatelessWidget {
  const _RatingMovieWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton(onPressed: () {}, child: const Text('User Score')),
        Container(
          height: 15,
          width: 2,
          color: AppColors.greyColor,
        ),
        TextButton(
          onPressed: () {},
          child: const Text('Play Trayler'),
        ),
      ],
    );
  }
}

class _MovieNameWidget extends StatelessWidget {
  const _MovieNameWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
        maxLines: 3,
        text: const TextSpan(
          children: [
            TextSpan(
                text: 'Venom: Let There Be Carnage',
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w600,
                )),
            TextSpan(
                text: ' (2021)',
                style: TextStyle(
                  color: AppColors.greyColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                )),
          ],
        ));
  }
}

class _SummerWidget extends StatelessWidget {
  const _SummerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ColoredBox(
      color: AppColors.infoMovieRating,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 70, vertical: 10),
        child: Text(
          '01/10/2021 (US) * 1h 37m Science Fiction, Action, Adventure',
          maxLines: 2,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppColors.backgroundColorApp,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
