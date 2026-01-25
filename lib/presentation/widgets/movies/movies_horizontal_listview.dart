import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/config/helpers/human_formats.dart';
import 'package:movie_app/domain/entities/movie.dart';

class MoviesHorizontalListview extends StatefulWidget {
  //ubico los parametros de mi widget
  final List<Movie> movies;
  final String? label;
  final String? subLabel;
  final VoidCallback? loadNextPague; // voidcallback me permite tener una funcion que no regresa nada
  const MoviesHorizontalListview({
    super.key,
    required this.movies,
    this.label,
    this.subLabel,
    this.loadNextPague,
  });

  @override
  State<MoviesHorizontalListview> createState() => _MoviesHorizontalListviewState();
}

class _MoviesHorizontalListviewState extends State<MoviesHorizontalListview> {
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      //SI no se proprociona un metodo no se hace nada 
      if(widget.loadNextPague == null) return;
        //if(POsicion actual + 200 es mayor o igual al maximo scroll activar el metodo)
      if((scrollController.position.pixels + 200) >= scrollController.position.maxScrollExtent){
        
        widget.loadNextPague!();
      }

    },);
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350, 
      child: Column(
        children: [
          if(widget.label != null || widget.subLabel != null)
          //Seccion del titulo 
          _Title(title: widget.label, subTitle: widget.subLabel),
          //Seccion de las peliculas son scroll horizontal 
          Expanded(
            child: ListView.builder(
              controller: scrollController,
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              itemCount: widget.movies.length,
              itemBuilder: (context, index) => FadeInRight(child: _Slide(movie: widget.movies[index],)) ,
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
                    return  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(child: CircularProgressIndicator(strokeWidth: 2,)),
                    );
                  }

                  return GestureDetector(
                    child: FadeIn(child: child),
                    onTap: () => context.push('/movie/${movie.id}'),
                    );
                },
                ),
            ),
          ),
          //Espacio 
          SizedBox(height: 5,),
          //Titulo de la pelicula 
          SizedBox( width: 150,child: Text(movie.title, maxLines: 2,style: textStyle.titleSmall,)),

          Row(
            children: [
              Icon(Icons.star_half_outlined, color: Colors.yellow.shade800,),
              SizedBox(width: 3,),
              Text('${movie.voteAverage}', style: textStyle.bodyMedium?.copyWith(color: Colors.yellow.shade800)),
              SizedBox(width: 10,),
              Text(HumanFormats.number(movie.popularity), style: textStyle.bodyMedium,)
            ],
          )
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
