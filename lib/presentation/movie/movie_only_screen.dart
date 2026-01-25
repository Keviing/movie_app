import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/domain/entities/movie.dart';
import 'package:movie_app/presentation/provider/movie/movie_info_provider.dart';


class MovieOnlyScreen extends ConsumerStatefulWidget {
//Va recibir un parametro con el id de la pelicula 
  static const name = 'movie-screen';
  final String movieId;  
  const MovieOnlyScreen({super.key, required this.movieId});

  @override
  MovieOnlyScreenState createState() => MovieOnlyScreenState();
}

class MovieOnlyScreenState extends ConsumerState<MovieOnlyScreen> {

  @override
  void initState() {
    super.initState();
    ref.read(movieInfoProvider.notifier).loadMovie(widget.movieId);
  }

  @override
  void dispose() {
    
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    
    final Movie?  movie = ref.watch(movieInfoProvider)[widget.movieId];
    if(movie == null) {return Scaffold(body: Center(child: CircularProgressIndicator(),),);}
    return Scaffold(
      appBar: AppBar(
        title:  Text('Movie Id ${widget.movieId}'),
      ),
    );
  }
}