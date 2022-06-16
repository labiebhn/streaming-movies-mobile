import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:movies_app/components/carousels/config.dart';
import 'package:movies_app/components/wrappers/wrapper_button.dart';
import 'package:movies_app/screens/movies/movie_detail.dart';
import 'package:movies_app/utils/fonts.dart';

class CardFavorite extends StatelessWidget {
  final String imageUrl;
  final String title;
  final void Function()? onTap;
  final double customWidth;
  final double customHeight;

  const CardFavorite(
      {Key? key,
      required this.imageUrl,
      required this.onTap,
      this.customWidth = 0,
      this.customHeight = 0, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double cardWidth = customWidth != 0 ? customWidth : (width / 2) - 18;
    double cardHeight = customHeight != 0 ? customHeight : width / 1.30;
    return ClipRRect(
      borderRadius: BorderRadius.circular(6.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: cardWidth,
          height: cardHeight,
          alignment: Alignment.center,
          child: Stack(
            children: [
              CachedNetworkImage(
                imageUrl: imageUrl,
                width: cardWidth,
                height: cardHeight,
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
                      Colors.black.withOpacity(0.8),
                    ],
                    stops: const [0.0, 1.0],
                  ),
                ),
                child: Text(
                  title,
                  style: Fonts.h5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
