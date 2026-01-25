import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/presentation/provider/movie/movies_provider.dart';
import 'package:movie_app/presentation/provider/movie/slider_movie_provider.dart';

final initialLoadingProvider = Provider<bool>((ref) {

  final moviesList2 = ref.watch(nowPlayingMoviesProvider).isEmpty;
  final moviesList = ref.watch(slideMovieProvider).isEmpty;
  final popularMovies = ref.watch(popularMoviesProvider).isEmpty;
  final topRadeMovies = ref.watch(topRadeMoviesProvider).isEmpty;
  final upComingMovies = ref.watch(upComingMovieProvider).isEmpty;
  if(moviesList2 || moviesList || popularMovies || topRadeMovies || upComingMovies) return true;
  return false;
});
