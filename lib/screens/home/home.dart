import 'package:flutter/material.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:movies_app/components/wrappers/wrapper_safearea.dart';
import 'package:movies_app/containers/home/header_home.dart';
import 'package:movies_app/containers/home/list_movie_home.dart';
import 'package:movies_app/containers/movies/list_other_movie.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int indexCaousel = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WrapperSafeArea(
        child: LazyLoadScrollView(
          onEndOfPage: () {
            print('End');
          },
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(bottom: 70.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 6.0),
                    child: HeaderHome(),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 24.0),
                    child: ListMovieHome(
                      title: 'Recent Watched',
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 24.0),
                    child: ListMovieHome(
                      title: 'My Favorites',
                    ),
                  ),
                  Container(
                    child: ListOrherMovie(),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
