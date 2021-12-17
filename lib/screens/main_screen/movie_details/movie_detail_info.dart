import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:themoviedb/resources/resources.dart';
import 'package:themoviedb/theme/colors.dart';
import 'package:themoviedb/widgets/progress_bar/progress_bar_widget.dart';

class MovieDetailInfoWidget extends StatelessWidget {
  const MovieDetailInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _TopPosterWidget(),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: _MovieNameWidget(),
        ),
        const _RatingMovieWidget(),
        const _SummerWidget(),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: _OverviewWidget(),
        ),
        const Padding(
          padding: const EdgeInsets.all(10.0),
          child: _DescriptionWidget(),
        ),
        const SizedBox(height: 30),
        const _PeopleWidgets(),
        const SizedBox(height: 30),
      ],
    );
  }

  Text _OverviewWidget() {
    return const Text(
      'Overview',
      style: TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
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
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          children: [
            const SizedBox(
              width: 60,
              height: 60,
              child: ProgressBarWidget(),
            ),
            TextButton(onPressed: () {}, child: const Text('User Score')),
          ],
        ),
        Container(height: 15, width: 2, color: AppColors.greyColor),
        TextButton(
          onPressed: () {},
          child: Row(
            children: const [
              Icon(Icons.play_arrow),
              Text('Play Trayler'),
            ],
          ),
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

class _DescriptionWidget extends StatelessWidget {
  const _DescriptionWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'After finding a host body in investigative reporter Eddie Brock, the alien symbiote must face a new enemy, Carnage, the alter ego of serial killer Cletus Kasady.',
      style: TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}

class _PeopleWidgets extends StatelessWidget {
  const _PeopleWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const nameStyle = TextStyle(
      color: Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.w400,
    );
    const jobTilteStyle = TextStyle(
      color: Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.w400,
    );
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
          Text('Kelly Marcel', style: nameStyle),
          Text('Screenplay, Story', style: jobTilteStyle),
          SizedBox(height: 20),
          Text('Tom DeFalco', style: nameStyle),
          Text('Characters', style: jobTilteStyle),
          SizedBox(height: 20),
          Text('David Michelinie', style: nameStyle),
          Text('Characters', style: jobTilteStyle),
          SizedBox(height: 20),
          Text('Tom Hardy', style: nameStyle),
          Text('Story', style: jobTilteStyle),
        ]),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
          Text('Todd Mcfarlane', style: nameStyle),
          Text('Characters', style: jobTilteStyle),
          SizedBox(height: 20),
          Text('Mark Bagley', style: nameStyle),
          Text('Characters', style: jobTilteStyle),
          SizedBox(height: 20),
          Text('Andy Serkis', style: nameStyle),
          Text('Director', style: jobTilteStyle),
          SizedBox(height: 20),
          Text(' ', style: nameStyle),
          Text(' ', style: jobTilteStyle),
        ]),
      ],
    );
  }
}
