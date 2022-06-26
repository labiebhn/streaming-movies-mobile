import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:movies_app/components/wrappers/wrapper_safearea.dart';
import 'package:movies_app/containers/movies/header_movie.dart';
import 'package:movies_app/containers/movies/last_watched_movie.dart';
import 'package:movies_app/containers/movies/list_other_movie.dart';
import 'package:movies_app/containers/movies/trailer_movie.dart';
import 'package:movies_app/cubit/movie_detail/movie_detail_cubit.dart';
import 'package:movies_app/models/movie_detail_model.dart';
import 'package:movies_app/utils/fonts.dart';
import 'package:movies_app/utils/palettes.dart';

class MovieDetail extends StatefulWidget {
  final int id;
  const MovieDetail({Key? key, required this.id}) : super(key: key);

  @override
  State<MovieDetail> createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    BlocProvider.of<MovieDetailCubit>(context).getMovieDetail(widget.id);
    Data? movie;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Container(
        width: width,
        height: height,
        color: Palettes.background,
        child: BlocBuilder<MovieDetailCubit, MovieDetailState>(
          builder: ((context, state) {
            if (state is MovieDetailLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is MovieDetailError) {
              return const Center(
                child: Icon(Icons.close),
              );
            } else if (state is MovieDetailSuccess) {
              movie = state.movie;
            }
            return LazyLoadScrollView(
              onEndOfPage: () {},
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.only(bottom: 24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 10.0),
                        child: HeaderMovie(
                          data: movie,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 10.0),
                        child: LastWatchedMovie(),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 16.0),
                        child: TrailerMovie(),
                      ),
                      // Container(
                      //   child: ListOrherMovie(),
                      // ),
                    ],
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
