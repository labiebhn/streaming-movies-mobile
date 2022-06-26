import 'package:dio/dio.dart';
import 'package:movies_app/configs/configs.dart';
import 'package:movies_app/configs/endpoints.dart';
import 'package:movies_app/models/movie_detail_model.dart';
import 'package:movies_app/models/movie_model.dart';

class MovieRepository {
  final Dio _dio = Dio();

  MovieRepository() {
    _dio.options.baseUrl = CONFIGS.API_BASE_URL;
    _dio.options.connectTimeout = CONFIGS.API_CONNECT_TIMEOUT;
    _dio.options.receiveTimeout = CONFIGS.API_CONNECT_TIMEOUT;
    _dio.options.headers['Accept'] = 'application/json';
    _dio.options.headers['Content-Type'] = 'application/json';
  }

  Future<MovieModel> getMovies(params) async {
    try {
      final response =
          await _dio.get(ENDPOINTS.GET_MOVIES, queryParameters: params);
      return MovieModel.fromJson(response.data);
    } on DioError catch (e) {
      return MovieModel.fromJson(e.response?.data);
    }
  }

  Future<MovieDetailModel> getMovieDetail(int id) async {
    try {
      final response = await _dio.get(ENDPOINTS.GET_MOVIE_DETAIL);
      return MovieDetailModel.fromJson(response.data);
    } on DioError catch (e) {
      return MovieDetailModel.fromJson(e.response?.data);
    }
  }
}
