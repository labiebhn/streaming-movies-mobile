import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:movies_app/components/carousels/config.dart';
import 'package:movies_app/utils/fonts.dart';

class CardMovie extends StatelessWidget {
  final String imageUrl;
  final String title;
  final void Function()? onTap;
  final double customWidth;
  final double customHeight;
  const CardMovie(
      {Key? key,
      required this.imageUrl,
      required this.onTap,
      this.customWidth = 0,
      this.customHeight = 0,
      this.title = ''})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double cardWidth = customWidth != 0 ? customWidth : (width / 3) - 15;
    double cardHeight = customHeight != 0 ? customHeight : 155;
    return ClipRRect(
      borderRadius: BorderRadius.circular(4.0),
      child: GestureDetector(
        onTap: onTap,
        child: Stack(
          children: [
            SizedBox(
              width: cardWidth,
              height: cardHeight,
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                width: cardWidth,
                height: cardHeight,
                fit: BoxFit.cover,
              ),
            ),
            title != ''
                ? Container(
                    width: cardWidth,
                    height: cardHeight,
                    alignment: Alignment.bottomLeft,
                    padding: const EdgeInsets.all(6.0),
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
                      style: Fonts.p,
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
