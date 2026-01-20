import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/presentation/provider/movie/slider_movie_provider.dart';
import 'package:movie_app/presentation/provider/providers.dart';
import 'package:movie_app/presentation/widgets/movies/full_screen_loader.dart';
import 'package:movie_app/presentation/widgets/shared/custom_buttom_navigator.dart';
import 'package:movie_app/presentation/widgets/widgets.dart';

class MovieScreen extends StatelessWidget {
  static const name = 'home-screen';
  const MovieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _MoviesView(),
      bottomNavigationBar: CustomBottomNavigation(),
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
    ref.read(popularMoviesProvider.notifier).loadNextPage();
    ref.read(upComingMovieProvider.notifier).loadNextPage();
    ref.read(topRadeMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    //despues de iniciar y cargar la data
    //ya esta disponible el listado de peliculas
    //Aqui si puedo usar watch para estar pendiente de los cambios
    final moviesList2 = ref.watch(nowPlayingMoviesProvider);

    final moviesList = ref.watch(slideMovieProvider);

    final popularMovies = ref.watch(popularMoviesProvider);

    final topRadeMovies = ref.watch(topRadeMoviesProvider);
    final upComingMovies = ref.watch(upComingMovieProvider);

    return FullScreenLoader();
    return CustomScrollView(
      slivers: [
        //existe una propiedad donde podemos colocar un widget o diseño
        //como appbar de este scroll
        SliverAppBar(floating: true, title: CustomAppbar()),
        //Lista de slivers -> fragmentos
        SliverList(
          delegate: SliverChildBuilderDelegate(childCount: 1, (context, index) {
            return Column(
              children: [
                MoviesSlideshow(movies: moviesList),
                MoviesHorizontalListview(
                  movies: moviesList2,
                  label: 'En Cines',
                  subLabel: 'Lunes 20',
                  loadNextPague: () => ref
                      .read(nowPlayingMoviesProvider.notifier)
                      .loadNextPage(),
                ),
                MoviesHorizontalListview(
                  movies: popularMovies,
                  label: 'Populares',
                  loadNextPague: () =>
                      ref.read(popularMoviesProvider.notifier).loadNextPage(),
                ),
                MoviesHorizontalListview(
                  movies: upComingMovies,
                  label: 'Proximente',
                  loadNextPague: () =>
                      ref.read(upComingMovieProvider.notifier).loadNextPage(),
                ),
                MoviesHorizontalListview(
                  movies: topRadeMovies,
                  label: 'Mejor calificadas',
                  loadNextPague: () =>
                      ref.read(topRadeMoviesProvider.notifier).loadNextPage(),
                ),
              ],
            );
          }),
        ),
      ],
    );
  }
}
