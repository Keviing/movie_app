import 'package:movie_app/domain/entities/movie.dart';
import 'package:movie_app/infrastructure/models/moviedb/movie_detail.dart';
import 'package:movie_app/infrastructure/models/moviedb/movie_moviedb.dart';

class MovieMappers {
  //CReamos una funciona static para hacer uso sin instanciar la clase

  static Movie movieDBToEntity(MovieMovieDB moviedb) => Movie(
    adult: moviedb.adult,
    backdropPath: (moviedb.backdropPath != '') ?
      'https://image.tmdb.org/t/p/w500${moviedb.backdropPath}'
     : 'https://cdn-icons-png.flaticon.com/512/6134/6134065.png',
    genreIds: moviedb.genreIds.map((e) => e.toString()).toList(),
    id: moviedb.id,
    originalLanguage: moviedb.originalLanguage,
    originalTitle: moviedb.originalTitle,
    overview: moviedb.overview,
    popularity: moviedb.popularity,
    posterPath: (moviedb.posterPath != '') ? 
    'https://image.tmdb.org/t/p/w500${moviedb.posterPath}'
    : 'no-poster',
    releaseDate: moviedb.releaseDate,
    title: moviedb.title,
    video: moviedb.video,
    voteAverage: moviedb.voteAverage,
    voteCount: moviedb.voteCount,
  );

  static Movie movieDetailToEntity(MovieDetail moviedb) => Movie(
    adult: moviedb.adult,
    backdropPath: (moviedb.backdropPath != '') ?
      'https://image.tmdb.org/t/p/w500${moviedb.backdropPath}'
     : 'https://cdn-icons-png.flaticon.com/512/6134/6134065.png',
    genreIds: moviedb.genres.map((e) => e.name).toList(),
    id: moviedb.id,
    originalLanguage: moviedb.originalLanguage,
    originalTitle: moviedb.originalTitle,
    overview: moviedb.overview,
    popularity: moviedb.popularity,
    posterPath: (moviedb.posterPath != '') ? 
    'https://image.tmdb.org/t/p/w500${moviedb.posterPath}'
    : 'no-poster',
    releaseDate: moviedb.releaseDate,
    title: moviedb.title,
    video: moviedb.video,
    voteAverage: moviedb.voteAverage,
    voteCount: moviedb.voteCount,

  );
}
