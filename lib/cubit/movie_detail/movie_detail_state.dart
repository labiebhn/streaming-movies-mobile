part of 'movie_detail_cubit.dart';

@immutable
abstract class MovieDetailState {}

class MovieDetailInitial extends MovieDetailState {}

class MovieDetailLoading extends MovieDetailState {}

class MovieDetailSuccess extends MovieDetailState {
  final Data? movie;
  MovieDetailSuccess(this.movie);
}

class MovieDetailError extends MovieDetailState {
  final String message;
  MovieDetailError(this.message);
}
