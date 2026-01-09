
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/domain/entities/movie.dart';
import 'package:movie_app/presentation/provider/movie/movie_repository_provider.dart';

final nowPlayingMoviesProvider = NotifierProvider<MoviesNotifier, List<Movie>>(() => MoviesNotifier());

// typedef MovieCallback = Future<List<Movie>> Function({int page});

class MoviesNotifier extends Notifier<List<Movie>>{
  int currentPage = 0;
  @override
  List<Movie> build() {
    
   return [];
  }
 
 Future<void> loadNextPage() async{

  currentPage ++;


  //hacemos la peticion 
  final List<Movie> movies = await ref.watch(movieRepositoryProvider).getNowMovie(page: currentPage);

  state = [...state, ...movies];

 }

}