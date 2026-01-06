//Clase abstracta porque no quiero instanciarla sino tenerla como molde 
import 'package:movie_app/domain/entities/movie.dart';

abstract class MovieDatasource {

 Future<List<Movie>>  getNowMovie({int page = 1}); 

}