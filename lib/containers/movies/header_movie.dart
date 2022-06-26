import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:movies_app/components/badges/badge-tag.dart';
import 'package:movies_app/components/carousels/config.dart';
import 'package:movies_app/models/movie_detail_model.dart';
import 'package:movies_app/utils/fonts.dart';

class HeaderMovie extends StatelessWidget {
  final Data? data;
  const HeaderMovie({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double heightContainer = height / 1.2;
    return Container(
      height: heightContainer,
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 2.0),
            child: CachedNetworkImage(
              imageUrl: data?.image ?? '',
              width: width,
              height: heightContainer,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: width,
            height: heightContainer,
            alignment: Alignment.bottomLeft,
            padding: const EdgeInsets.all(14.0),
            decoration: BoxDecoration(
              color: Colors.black,
              gradient: LinearGradient(
                begin: FractionalOffset.topCenter,
                end: FractionalOffset.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.0),
                  Colors.black.withOpacity(1.0),
                ],
                stops: const [0.0, 1.0],
              ),
            ),
          ),
          Container(
            width: width,
            height: heightContainer,
            padding: EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 6.0),
                  child: Text(
                    data?.type ?? '',
                    style: Fonts.p,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 12.0),
                  child: Text(
                    data?.title ?? '',
                    style: Fonts.h2,
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 14.0),
                  child: Wrap(
                    children: [
                      ...?data?.tags?.map(
                        (tag) {
                          return Container(
                            margin: const EdgeInsets.symmetric(horizontal: 4.0),
                            child: BadgeTag(
                              title: tag,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 300,
                  child: Text(
                    data?.description ?? '',
                    style: Fonts.p,
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
