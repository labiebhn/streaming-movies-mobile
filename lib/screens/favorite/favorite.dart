import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:movies_app/components/cards/card-favorite.dart';
import 'package:movies_app/components/cards/card-highlight.dart';
import 'package:movies_app/components/cards/card-movie.dart';
import 'package:movies_app/components/carousels/config.dart';
import 'package:movies_app/components/lists/list-account.dart';
import 'package:movies_app/components/wrappers/wrapper_safearea.dart';
import 'package:collection/collection.dart';
import 'package:movies_app/screens/movies/movie_detail.dart';

class Favorite extends StatefulWidget {
  const Favorite({Key? key}) : super(key: key);

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: WrapperSafeArea(
        child: Container(
          height: height,
          child: LazyLoadScrollView(
            onEndOfPage: () {},
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.only(
                  bottom: 70.0,
                  left: 14.0,
                  right: 14.0,
                ),
                child: Wrap(
                  alignment: WrapAlignment.start,
                  runSpacing: 8.0,
                  spacing: 8.0,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8.0,
                      ),
                      child: ListAccount(),
                    ),
                    ...carouselHomeData.mapIndexed(
                      (index, item) {
                        return Container(
                          child: CardFavorite(
                            imageUrl: item['image'],
                            title: item['title'],
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MovieDetail(
                                    index: index,
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                    ...carouselHomeData.mapIndexed(
                      (index, item) {
                        return Container(
                          child: CardFavorite(
                            imageUrl: item['image'],
                            title: item['title'],
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MovieDetail(
                                    index: index,
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
