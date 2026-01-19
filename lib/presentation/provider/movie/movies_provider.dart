import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/domain/entities/movie.dart';
import 'package:movie_app/presentation/provider/movie/movie_repository_provider.dart';

final nowPlayingMoviesProvider = NotifierProvider<MoviesNotifier, List<Movie>>(
  () {
    return MoviesNotifier(
      fetchMoreMovies: (ref, page) =>
          ref.read(movieRepositoryProvider).getNowMovie(page: page),
    );
  },
);

//COnsultar las peliculas mas populares 
final popularMoviesProvider = NotifierProvider<MoviesNotifier, List<Movie>>(
  () => MoviesNotifier(
    fetchMoreMovies: (ref, page) => ref.read(movieRepositoryProvider).getMoviePopular(page: page),
    )
  
  );
// typedef MovieCallback = Future<List<Movie>> Function(Ref ref, int page);

class MoviesNotifier extends Notifier<List<Movie>> {
  int currentPage = 0;
  bool isLoading = false;
  final Future<List<Movie>> Function(Ref ref, int page) fetchMoreMovies;
  // final MovieCallback fetchMoreMovies;

  //Constructor de la clase
  MoviesNotifier({required this.fetchMoreMovies});

  @override
  List<Movie> build() {
    return [];
  }

  Future<void> loadNextPage() async {
    if (isLoading) return;

    isLoading = true;
    currentPage++;
    //hacemos la peticion
    final List<Movie> movies = await fetchMoreMovies(ref, currentPage);

    state = [...state, ...movies];
    isLoading = false;
  }
}
