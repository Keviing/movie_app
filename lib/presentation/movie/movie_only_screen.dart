import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/domain/entities/movie.dart';
import 'package:movie_app/presentation/provider/movie/movie_info_provider.dart';
import 'package:movie_app/presentation/widgets/widgets.dart';

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
    final Movie? movie = ref.watch(movieInfoProvider)[widget.movieId];
    if (movie == null) {
      return Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _CustomSliverAppbar(movie: movie),
          
          SliverList(delegate: SliverChildBuilderDelegate(
            (context, index) => _MovieDeatils(movie: movie),
            childCount: 1
          ))
          ]

        ),
    );
  }
}

class _MovieDeatils extends StatelessWidget {
  final Movie movie;
  const _MovieDeatils({required this.movie});

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  movie.posterPath,
                  width: size.width * 0.3,
                  )
                ),

                const SizedBox(width: 10,),

                SizedBox(
                  width: (size.width - 40) * 0.7 ,
                  child: Column(
                    children: [
                      Text(movie.title, style: style.titleLarge,),
                      Text(movie.overview)
                    ],

                  ),
                  )
          ],),
        ),

        SizedBox(height: 100,)
      ],
    );
  }
}


class _CustomSliverAppbar extends StatelessWidget {
  final Movie movie;
  const _CustomSliverAppbar({required this.movie});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SliverAppBar(
      backgroundColor: Colors.black,
      expandedHeight: size.height * 0.7,
      foregroundColor: Colors.white,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          children: [
            SizedBox.expand(
              child: Image.network(movie.posterPath, fit: BoxFit.cover),
            ),

            SizedBox.expand(
              child: _CustomGradient(
                start: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stopStart: 0.7,
                stopEnd: 1.0,
                primaryColor: Colors.transparent,
                secondaryColor: Colors.black87,
              ),
            ),

            SizedBox.expand(
              child: _CustomGradient(
                start: Alignment.topLeft,
                end: Alignment.topCenter,
                stopStart: 0.0,
                stopEnd: 0.4,
                primaryColor: Colors.black87,
                secondaryColor: Colors.transparent,
              ),
            ),
          ],
        ),
        title: Text(
          movie.title,
          style: TextStyle(fontSize: 20, color: Colors.white),
          textAlign: TextAlign.start,
        ),
      ),
    );
  }
}

class _CustomGradient extends StatelessWidget {
  final Color primaryColor;
  final Color secondaryColor;
  final AlignmentGeometry start;
  final AlignmentGeometry end;
  final double stopStart;
  final double stopEnd;

  const _CustomGradient({
    required this.primaryColor,
    required this.secondaryColor, 
    required this.stopStart, 
    required this.stopEnd, 
    required this.start, 
    required this.end,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: start,
          end: end,
          stops: [stopStart, stopEnd],
          colors: [primaryColor, secondaryColor],
        ),
      ),
    );
  }
}
