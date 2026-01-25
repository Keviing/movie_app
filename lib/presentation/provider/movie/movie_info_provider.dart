


import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/domain/entities/movie.dart';
import 'package:movie_app/presentation/provider/providers.dart';

//Creamos el provider 

final movieInfoProvider = NotifierProvider<MovieMapNotifier, Map<String, Movie>>(() {

 return MovieMapNotifier(
  getMovie: (ref, movieId) => ref.watch(movieRepositoryProvider).getMovieById(movieId));
});

typedef  GetMovieCallBack = Future<Movie> Function(Ref ref, String movieId);

class MovieMapNotifier extends Notifier<Map<String, Movie>> {
  
  //Parametro a recibir 
  final GetMovieCallBack getMovie;
  //CReamos el constructor 
  MovieMapNotifier({required this.getMovie});

  @override
  Map<String, Movie> build() {
    return {};
  }

  Future<void> loadMovie(String movieId)async {

    if(state[movieId] != null)return;

    final movie = await getMovie(ref, movieId);

    state = {...state, movieId:movie};
  }
  

}