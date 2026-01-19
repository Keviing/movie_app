import 'package:movie_app/domain/entities/movie.dart';

abstract class MovieRepository {
Future<List<Movie>>  getNowMovie({int page = 1});
 Future<List<Movie>>  getMoviePopular({int page = 1}); 

}