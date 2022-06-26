import 'package:flutter/material.dart';
import 'package:movies_app/components/cards/card-highlight.dart';
import 'package:movies_app/components/carousels/config.dart';
import 'package:movies_app/screens/movies/movie_detail.dart';
import 'package:movies_app/utils/fonts.dart';
import 'package:collection/collection.dart';

class ListMovieHome extends StatefulWidget {
  final String title;
  const ListMovieHome({Key? key, required this.title}) : super(key: key);

  @override
  State<ListMovieHome> createState() => _ListMovieHomeState();
}

class _ListMovieHomeState extends State<ListMovieHome> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          margin: const EdgeInsets.only(bottom: 10.0),
          child: Text(
            widget.title,
            style: Fonts.h5,
          ),
        ),
        Container(
          height: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              ...carouselHomeData.mapIndexed((index, item) {
                return Container(
                  margin:
                      EdgeInsets.only(right: 12.0, left: index == 0 ? 14.0 : 0),
                  child: CardHighlight(
                    imageUrl: item['image'],
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MovieDetail(
                            id: index,
                          ),
                        ),
                      );
                    },
                  ),
                );
              }).toList(),
            ],
          ),
        ),
      ],
    );
  }
}
