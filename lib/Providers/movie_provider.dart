import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../Movies/movie.dart';

final movieProvider =
    StateNotifierProvider<MovieProvider, List<Movie>>((ref) => MovieProvider());

class MovieProvider extends StateNotifier<List<Movie>> {
  MovieProvider() : super([]) {
    getData();
  }

  Future<void> getData() async {
    final dio = Dio();
    try {
      final response = await dio
          .get('https://api.themoviedb.org/3/movie/popular', queryParameters: {
        'api_key': '2f36820c914ae830985440990fb1620d',
        'language': 'en-US',
      });
      List<Movie> movieData = (response.data['results'] as List)
          .map((e) => Movie.fromJson(e))
          .toList();
      state = movieData;
    } on DioError catch (e) {
      print(e);
    }
  }
}
