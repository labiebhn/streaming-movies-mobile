import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:movies_app/components/wrappers/wrapper_safearea.dart';
import 'package:movies_app/containers/home/header_home.dart';
import 'package:movies_app/containers/home/list_movie_home.dart';
import 'package:movies_app/containers/movies/list_other_movie.dart';
import 'package:movies_app/cubit/movie/movie_cubit.dart';
import 'package:collection/collection.dart';
import 'package:movies_app/models/movie_model.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int indexCaousel = 0;
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<MoviesCubit>(context).getMovies();
    return Scaffold(
      body: WrapperSafeArea(
        child: BlocBuilder<MoviesCubit, MovieState>(builder: (context, state) {
          List<Data> movies = [];
          if (state is MoviesLoading && state.isFirstFetch) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is MoviesLoading && !state.isFirstFetch) {
            movies = state.movies ?? [];
          } else if (state is MoviesError) {
            return const Center(
              child: Icon(Icons.close),
            );
          } else if (state is MoviesSuccess) {
            movies = state.movies ?? [];
          }
          return LazyLoadScrollView(
            scrollOffset: 300,
            onEndOfPage: () {
              print('END');
              BlocProvider.of<MoviesCubit>(context).getMovies();
            },
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.only(bottom: 70.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 6.0),
                      child: const HeaderHome(),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 24.0),
                      child: const ListMovieHome(
                        title: 'Recent Watched',
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 24.0),
                      child: const ListMovieHome(
                        title: 'My Favorites',
                      ),
                    ),
                    Container(
                      child: ListOrherMovie(
                        movies: movies,
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
