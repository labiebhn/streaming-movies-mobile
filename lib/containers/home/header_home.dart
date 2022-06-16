import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/components/carousels/carousel_home.dart';
import 'package:movies_app/components/carousels/config.dart';
import 'package:movies_app/components/lists/list-account.dart';
import 'package:movies_app/components/navbars/navbar-category.dart';

class HeaderHome extends StatefulWidget {
  const HeaderHome({Key? key}) : super(key: key);

  @override
  State<HeaderHome> createState() => _HeaderHomeState();
}

class _HeaderHomeState extends State<HeaderHome> {
  int indexCaousel = 0;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double heightHeader = 420;
    return SizedBox(
      height: heightHeader,
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 1.0),
            child: CachedNetworkImage(
              imageUrl: carouselHomeData[indexCaousel]['image'],
              width: width,
              height: heightHeader,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: width,
            height: heightHeader,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: FractionalOffset.topCenter,
                end: FractionalOffset.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.75),
                  Colors.black.withOpacity(1.0),
                ],
                stops: const [0.0, 1.0],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 8.0),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14.0),
                  margin: const EdgeInsets.only(bottom: 4.0),
                  child: ListAccount(),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14.0),
                  margin: const EdgeInsets.only(bottom: 8.0),
                  child: NavbarCategory(),
                ),
                SizedBox(
                  child: CaoruselHome(
                    onPageChanged: (index) {
                      setState(() {
                        indexCaousel = index;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
