//Clase abstracta porque no quiero instanciarla sino tenerla como molde 
import 'package:movie_app/domain/entities/movie.dart';

abstract class MovieDatasource {

 Future<List<Movie>>  getNowMovie({int page = 1}); 

 Future<List<Movie>>  getMoviePopular({int page = 1}); 

 Future<List<Movie>> getTopRade({int page = 1});

 Future<List<Movie>> getUpcoming({int page = 1}); 

 Future<Movie> getMovieById(String id);
}