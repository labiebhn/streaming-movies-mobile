import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:movies_app/components/cards/card-movie.dart';
import 'package:movies_app/components/carousels/config.dart';
import 'package:movies_app/screens/movies/movie_detail.dart';
import 'package:movies_app/utils/fonts.dart';
import 'package:collection/collection.dart';
import '../../models/movie_model.dart';

class ListOrherMovie extends StatefulWidget {
  final List<Data?> movies;
  const ListOrherMovie({Key? key, required this.movies}) : super(key: key);

  @override
  State<ListOrherMovie> createState() => _ListOrherMovieState();
}

class _ListOrherMovieState extends State<ListOrherMovie> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10.0),
            child: const Text(
              'Others',
              style: Fonts.h5,
            ),
          ),
          Wrap(
            alignment: WrapAlignment.start,
            runSpacing: 8.0,
            spacing: 8.0,
            children: [
              ...widget.movies.mapIndexed(
                (index, item) {
                  return Container(
                    child: CardMovie(
                      imageUrl: item?.image ?? '',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MovieDetail(
                              id: item?.id ?? 0,
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
