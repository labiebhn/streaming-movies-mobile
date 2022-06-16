import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:movies_app/components/carousels/config.dart';
import 'package:movies_app/screens/movies/movie_detail.dart';
import 'package:movies_app/utils/fonts.dart';
import 'package:collection/collection.dart';

class CaoruselHome extends StatefulWidget {
  final Function onPageChanged;
  const CaoruselHome({Key? key, required this.onPageChanged}) : super(key: key);

  @override
  State<CaoruselHome> createState() => _CaoruselHomeState();
}

class _CaoruselHomeState extends State<CaoruselHome> {
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.width / 2;
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 8.0),
          child: CarouselSlider(
            options: CarouselOptions(
              initialPage: 0,
              enlargeCenterPage: true,
              height: height,
              enlargeStrategy: CenterPageEnlargeStrategy.height,
              aspectRatio: 10.0,
              autoPlay: true,
              onPageChanged: (index, reason) {
                widget.onPageChanged(index);
                setState(() {
                  currentPage = index;
                });
              },
            ),
            items: carouselHomeData.mapIndexed((index, item) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: GestureDetector(
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
                        child: Stack(
                          children: [
                            CachedNetworkImage(
                              imageUrl: item['image'],
                              width: width,
                              height: height,
                              fit: BoxFit.cover,
                            ),
                            Container(
                              width: width,
                              height: height,
                              alignment: Alignment.bottomLeft,
                              padding: const EdgeInsets.all(12.0),
                              decoration: BoxDecoration(
                                color: Colors.black,
                                gradient: LinearGradient(
                                  begin: FractionalOffset.topCenter,
                                  end: FractionalOffset.bottomCenter,
                                  colors: [
                                    Colors.black.withOpacity(0.0),
                                    Colors.black.withOpacity(0.9),
                                  ],
                                  stops: const [0.0, 1.0],
                                ),
                              ),
                              child: Text(
                                item['title'],
                                style: Fonts.h4,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }).toList(),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 38.0),
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return FadeTransition(opacity: animation, child: child);
            },
            child: Text(
              carouselHomeData[currentPage]['description'],
              key: ValueKey<String>(
                carouselHomeData[currentPage]['description'],
              ),
              style: Fonts.p,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
