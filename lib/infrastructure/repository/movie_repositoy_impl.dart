
import 'package:movie_app/domain/datasource/movie_datasource.dart';
import 'package:movie_app/domain/entities/movie.dart';
import 'package:movie_app/domain/repository/movie_repository.dart';

class MovieRepositoyImpl extends MovieRepository {
  
  //Instanciar la abstraccion del data source 
  final MovieDatasource datasoruce;
  MovieRepositoyImpl(this.datasoruce);
  
  @override
  Future<List<Movie>> getNowMovie({int page = 1}) {
    
    return datasoruce.getNowMovie(page: page);
  }
  
  @override
  Future<List<Movie>> getMoviePopular({int page = 1}) {
    return datasoruce.getMoviePopular(page: page);
  }
  
  @override
  Future<List<Movie>> getTopRade({int page = 1}) {
    return datasoruce.getTopRade(page: page);
  }
  
  @override
  Future<List<Movie>> getUpcoming({int page = 1}) {
    return datasoruce.getUpcoming(page: page);
  }
  
  @override
  Future<Movie> getMovieById(String id) {
    return datasoruce.getMovieById(id);
  }
  
}