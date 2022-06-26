import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movies_app/models/movie_detail_model.dart';
import 'package:movies_app/repositories/movie_repository.dart';
import 'package:movies_app/screens/movies/movie_detail.dart';

part 'movie_detail_state.dart';

class MovieDetailCubit extends Cubit<MovieDetailState> {
  MovieDetailCubit() : super(MovieDetailInitial());

  MovieRepository repository = MovieRepository();

  void getMovieDetail(int id) async {
    try {
      if (state is MovieDetailLoading) return;
      emit(MovieDetailLoading());
      MovieDetailModel result = await repository.getMovieDetail(id);
      if (result.meta?.success == true) {
        emit(MovieDetailSuccess(result.data));
      } else {
        String message = result.meta?.message ?? 'Oops! Something went wrong.';
        emit(MovieDetailError(message));
      }
    } catch (error) {
      String message = 'Oops! Something went wrong.';
      emit(MovieDetailError(message));
    }
  }
}
