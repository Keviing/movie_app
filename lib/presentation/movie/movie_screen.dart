import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/presentation/provider/providers.dart';
import 'package:movie_app/presentation/widgets/widgets.dart';

class MovieScreen extends StatelessWidget {
  static const name = 'home-screen';
  const MovieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _MoviesView()
      )
    );
  }
}

class _MoviesView extends ConsumerStatefulWidget {
  const _MoviesView();

  @override
  _MoviesViewState createState() => _MoviesViewState();
}

class _MoviesViewState extends ConsumerState<_MoviesView> {
  @override
  void initState() {
    super.initState();
    //Aqui inicia la aplicacion 
    //Por lo que debemos cargar la data por primera vez 
    //En metodos del ciclo de vida como init es aconsejable usar read
    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();  
  }


  @override
  Widget build(BuildContext context) {

    //despues de iniciar y cargar la data 
    //ya esta disponible el listado de peliculas 
    //Aqui si puedo usar watch para estar pendiente de los cambios 
    final moviesList = ref.watch(nowPlayingMoviesProvider);

    return Column(
      children: [
        CustomAppbar(),

        MoviesSlideshow(movies: moviesList),
        // Expanded(
        //   child: ListView.builder(
        //     itemCount:  moviesList.length,
        //     itemBuilder: (context, index) {
        //       final movie = moviesList[index];
        //       return ListTile(
        //         title: Text(movie.title) ,
        //       );
        //     },
        //     ),
        // ),
      ],
    );
  }
}