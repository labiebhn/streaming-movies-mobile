import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:movies_app/components/cards/card-movie.dart';
import 'package:movies_app/components/carousels/config.dart';
import 'package:movies_app/components/forms/input-text-search.dart';
import 'package:movies_app/components/wrappers/wrapper_safearea.dart';
import 'package:movies_app/screens/movies/movie_detail.dart';
import 'package:collection/collection.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController searchController = TextEditingController();
  String keyword = '';

  List<dynamic> getSearchList(List data) {
    List result = data;
    if (keyword != '') {
      result = data
          .where((item) =>
              item['title']?.toLowerCase()?.contains(keyword.toLowerCase()))
          .toList();
    }
    return result;
  }

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
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14.0,
                  vertical: 8.0,
                ),
                child: Wrap(
                  alignment: WrapAlignment.start,
                  runSpacing: 8.0,
                  spacing: 8.0,
                  children: [
                    InputTextSearch(
                      controller: searchController,
                      onChanged: (value) {
                        setState(() {
                          keyword = value;
                        });
                      },
                    ),
                    ...getSearchList(carouselHomeData).mapIndexed(
                      (index, item) {
                        return Container(
                          child: CardMovie(
                            imageUrl: item['image'],
                            title: item['title'],
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MovieDetail(
                                    id: item['id'],
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
