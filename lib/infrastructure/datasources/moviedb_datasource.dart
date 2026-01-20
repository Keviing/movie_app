
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:movie_app/config/constant/enviroment.dart';
import 'package:movie_app/domain/datasource/movie_datasource.dart';
import 'package:movie_app/domain/entities/movie.dart';
import 'package:movie_app/infrastructure/mappers/movie_mappers.dart';
import 'package:movie_app/infrastructure/models/moviedb/moviedb_response.dart';

class MoviedbDatasource extends  MovieDatasource{
  
  //Intanciamos dio a nivel de clase para poder usarlo en varios metodos 
  final Dio dio = Dio(BaseOptions(
    baseUrl: 'https://api.themoviedb.org/3',
    queryParameters: {
      'api_key' : Enviroment.theMovieDbKey,
      'language' : 'es-MX'
    }
  ));
  //MEtodo para setterar la respuesta a mi tipo correspondiente 
  List<Movie> _jsonToMovie(Map<String, dynamic> json ){
    final moviedbResponse = MovieDbResponse.fromJson(json);
    final List<Movie> movies =  moviedbResponse
    .results
    .where((e) => e.posterPath != 'no-poster')
    .map((e) => MovieMappers.movieDBToEntity(e)).toList();
    return movies;
  }


  @override
  Future<List<Movie>> getMoviePopular({int page = 1}) async {
    final response = await dio.get('/movie/popular', queryParameters: {'page':page});
        return _jsonToMovie(response.data);
  }
  
  @override
  Future<List<Movie>> getTopRade({int page = 1}) async {
    final response = await dio.get(
      '/movie/top_rated',
      queryParameters: {
        'page':page
      }
    );

    return _jsonToMovie(response.data);
  }
  
  @override
  Future<List<Movie>> getNowMovie({int page = 1}) async{
    final response = await dio.get('/movie/now_playing', queryParameters: {'page':page});
    return _jsonToMovie(response.data);
  }
  
  @override
  Future<List<Movie>> getUpcoming({int page = 1}) async{
    final response = await dio.get('/movie/upcoming',
    queryParameters: {
      "page": page
    }
    );

    return _jsonToMovie(response.data);
  }
  
}