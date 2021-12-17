import 'package:flutter/material.dart';
import 'package:themoviedb/resources/resources.dart';
import 'package:themoviedb/theme/colors.dart';

class MovieDetailActorsWidget extends StatelessWidget {
  const MovieDetailActorsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppColors.backgroundColorApp,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text('Serial Cast',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                )),
          ),
          SizedBox(
            height: 255,
            child: ListView.builder(
                itemCount: 20,
                itemExtent: 120,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DecoratedBox(
                        decoration: const BoxDecoration(
                          color: AppColors.backgroundColorApp,
                          boxShadow: [
                            BoxShadow(
                                color: AppColors.borderColor,
                                blurRadius: 8,
                                offset: Offset(0, 2))
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8)),
                          clipBehavior: Clip.hardEdge,
                          child: Column(
                            children: [
                              const Image(image: AssetImage(Images.actor)),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text('Woody Harrelson',
                                        maxLines: 2,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    SizedBox(height: 5),
                                    Text('Cletus Kasady / Carnage', maxLines: 4)
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ));
                }),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextButton(
              onPressed: () {},
              child: const Text('Full Cast & Crew'),
            ),
          )
        ],
      ),
    );
  }
}
