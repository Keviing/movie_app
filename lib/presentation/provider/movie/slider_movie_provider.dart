
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/domain/entities/movie.dart';
import 'package:movie_app/presentation/provider/providers.dart';

final slideMovieProvider = Provider<List<Movie>>((ref) {

  // para comparar puedo llamar allistado de movies con otro provider 
  // atravez del ref 

  final listMovies = ref.watch(nowPlayingMoviesProvider);

  if(listMovies.isEmpty){
    return [];
  }

  return listMovies.sublist(0,6);

});