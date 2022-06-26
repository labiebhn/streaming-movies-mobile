import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movies_app/models/movie_model.dart';
import 'package:movies_app/repositories/movie_repository.dart';

part 'movie_state.dart';

class MoviesCubit extends Cubit<MovieState> {
  MoviesCubit() : super(MoviesInitial());

  int page = 1;
  MovieRepository repository = MovieRepository();

  void getMovies() async {
    try {
      if (state is MoviesLoading) return;
      List<Data>? movies = [];
      final currentState = state;
      if (currentState is MoviesSuccess) {
        movies = currentState.movies;
      }
      emit(MoviesLoading(movies, isFirstFetch: page == 1));
      final params = {
        "page": page,
      };
      MovieModel result = await repository.getMovies(params);
      if (result.meta?.success == true) {
        movies?.addAll(result.data ?? []);
        emit(MoviesSuccess(movies));
        page++;
      } else {
        String message = result.meta?.message ?? 'Oops! Something went wrong.';
        emit(MoviesError(message));
      }
    } catch (error) {
      String message = 'Oops! Something went wrong.';
      emit(MoviesError(message));
    }
  }
}
