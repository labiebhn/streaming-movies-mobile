part of 'movie_cubit.dart';

@immutable
abstract class MovieState {}

class MoviesInitial extends MovieState {
  List<Data>? get props => [];
}

class MoviesLoading extends MovieState {
  final List<Data>? movies;
  final bool isFirstFetch;
  MoviesLoading(this.movies, {this.isFirstFetch = false});
}

class MoviesSuccess extends MovieState {
  final List<Data>? movies;
  MoviesSuccess(this.movies);
}

class MoviesError extends MovieState {
  final String message;
  MoviesError(this.message);
}
