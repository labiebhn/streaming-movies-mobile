import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:movies_app/components/carousels/config.dart';
import 'package:movies_app/components/wrappers/wrapper_button.dart';
import 'package:movies_app/screens/movies/movie_detail.dart';

class CardHighlight extends StatelessWidget {
  final String imageUrl;
  final void Function()? onTap;
  final double customWidth;
  final double customHeight;

  const CardHighlight(
      {Key? key,
      required this.imageUrl,
      required this.onTap,
      this.customWidth = 0,
      this.customHeight = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double cardWidth = customWidth != 0 ? customWidth : 135;
    double cardHeight = customHeight != 0 ? customHeight : 200;
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
            ],
          ),
        ),
      ),
    );
  }
}
