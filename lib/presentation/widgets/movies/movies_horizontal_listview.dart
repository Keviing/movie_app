import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/domain/entities/movie.dart';

class MoviesHorizontalListview extends StatelessWidget {
  //ubico los parametros de mi widget
  final List<Movie> movies;
  final String? label;
  final String? subLabel;
  final VoidCallback?
  loadNextPague; // voidcallback me permite tener una funcion que no regresa nada
  const MoviesHorizontalListview({
    super.key,
    required this.movies,
    this.label,
    this.subLabel,
    this.loadNextPague,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350, 
      child: Column(
        children: [
          if(label != null || subLabel != null)
          //Seccion del titulo 
          _Title(title: label, subTitle: subLabel),
          //Seccion de las peliculas son scroll horizontal 
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              itemCount: movies.length,
              itemBuilder: (context, index) => _Slide(movie: movies[index],) ,
              )
            )
        ],
      )
      );
  }
}
class _Slide extends StatelessWidget {
  final Movie movie;
  const _Slide({ required this.movie});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8 ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Imagen
          SizedBox(
            width: 150,
            child: ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(20),
              child: Image.network(
                fit: BoxFit.cover,
                width: 150, 
                movie.posterPath,
                loadingBuilder: (context, child, loadingProgress) {
                  if(loadingProgress != null){
                    return Center(child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircularProgressIndicator(),
                    ),);
                  }

                  return FadeIn(child: child);
                },
                ),
            ),
          ),
          //Espacio 
          SizedBox(height: 5,),
          //Titulo de la pelicula 
          SizedBox( width: 150,child: Text(movie.title, maxLines: 2,style: textStyle.titleSmall,)),

        ],
      )
      );
  }
}
class _Title extends StatelessWidget {
  final String? title;
  final String? subTitle;
  const _Title({ this.title,  this.subTitle});

  @override
  Widget build(BuildContext context) {

    final titleStyle = Theme.of(context).textTheme.titleLarge;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          if(title != null)
          Text(title!, style: titleStyle,),
          Spacer(),
          if(subTitle != null)
          FilledButton.tonal(
            style: ButtonStyle(visualDensity: VisualDensity.compact),
            onPressed:(){}, 
            child: Text(subTitle!))
        ],
      ),
    );
  }
}
